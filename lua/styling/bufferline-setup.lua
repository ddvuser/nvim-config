local bufferline = require('bufferline')

bufferline.setup{
  options = {
    mode = 'buffers',
    style_preset = bufferline.style_preset.no_italic,
    hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
    },
  }
}
