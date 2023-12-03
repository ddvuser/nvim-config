-- Use your language server to automatically format your code on save.
-- Adds additional commands as well to manage the behavior

local M = {}

M.setup = function()
  -- Command to toggle autoformatting
  local format_is_enabled = true

  vim.api.nvim_create_user_command('ToggleFormat', function()
    format_is_enabled = not format_is_enabled
    print('Setting autoformatting to: ' .. tostring(format_is_enabled))
  end, {})

  -- Store augroups to manage formatting autocmds
  local _augroups = {}
  local get_augroup = function(client)
    if not _augroups[client.id] then
      local group_name = 'lsp-format-' .. client.name
      local id = vim.api.nvim_create_augroup(group_name, { clear = true })
      _augroups[client.id] = id
    end
    return _augroups[client.id]
  end

  -- Autocmd triggered when an LSP attaches to a buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach-format', { clear = true }),
    callback = function(args)
      local client_id = args.data.client_id
      local client = vim.lsp.get_client_by_id(client_id)
      local bufnr = args.buf

      -- Check if the client supports document formatting
      if not client.server_capabilities.documentFormattingProvider then
        return
      end

      -- Avoid formatting for specific clients like tsserver
      if client.name == 'tsserver' then
        return
      end

      -- Autocmd triggered before saving the buffer
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = get_augroup(client),
        buffer = bufnr,
        callback = function()
          if not format_is_enabled then
            return
          end

          -- Perform LSP formatting on buffer save
          vim.lsp.buf.format {
            async = false,
            filter = function(c)
              return c.id == client.id
            end,
          }
        end,
      })
    end,
  })
end

return M

-- vim: ts=2 sts=2 sw=2 et
