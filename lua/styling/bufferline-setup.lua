local M = {}

M.setup = function()
  local bufferline = require('bufferline')

  vim.keymap.set("n", "<leader>Bp",
    bufferline.pick,
    { desc = "Bufferline: Pick" })

  vim.keymap.set("n", "<leader>Bc",
    bufferline.close_with_pick,
    { desc = "Bufferline: Close with Pick" })

  bufferline.setup {
    options = {
      mode = 'buffers',
      style_preset = bufferline.style_preset.no_italic,
      diagnostics = 'nvim_lsp',
      separator_style = 'thin',
      color_icons = true,
    },
  }
end

return M
