vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- [[ Install `lazy.nvim` plugin manager ]]
require('lazy-bootstrap')

-- [[ Configure plugins ]]
require('lazy-plugins')

-- [[ Setting options ]]
require('options')

-- [[ Basic Keymaps ]]
require('keymaps')

-- [[ Configure Telescope ]]
-- (fuzzy finder)
require('telescope-setup')

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require('treesitter-setup')

require('lsp-setup')

-- Styling: Bufferline, Gitsigns, Lualine, NvimTree, VSCodeTheme
local styling_setup = require('styling')
styling_setup.setup()

-- DAP
local dap_setup = require('dap-setup')
dap_setup.setup()

-- Formatting: Autoformat, CMP
require('formatting')

-- vim: ts=2 sts=2 sw=2 et
