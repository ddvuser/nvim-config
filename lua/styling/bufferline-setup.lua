local M = {}

M.setup = function()
    local bufferline = require('bufferline')

    bufferline.setup{
      options = {
        mode = 'buffers',
        style_preset = bufferline.style_preset.no_italic,
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
      },
    }
end

return M
