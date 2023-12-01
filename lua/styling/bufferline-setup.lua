local M = {}

M.setup = function()
    local bufferline = require('bufferline')

    bufferline.setup{
      options = {
        mode = 'buffers',
        style_preset = bufferline.style_preset.no_italic,
      },
    }
end

return M
