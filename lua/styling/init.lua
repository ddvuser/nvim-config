local M = {}

M.setup = function ()

  local bufferline_setup = require('styling.bufferline-setup')
  bufferline_setup.setup()

  local theme_setup = require('styling.vscode-theme')
  theme_setup.setup()

  local lualine_setup = require('styling.lualine-setup')
  lualine_setup.setup()

  local nvimtree_setup = require('styling.nvimtree-setup')
  nvimtree_setup.setup()

  local gitsigns_setup = require('styling.gitsigns-setup')
  gitsigns_setup.setup()

end

return M
