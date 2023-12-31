vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Lazy
require('lazy-bootstrap')
require('lazy-plugins')

require('options')

require('keymaps')

-- fuzzy finder
require('telescope-setup')

-- syntax highlighting
require('treesitter-setup')

require('lsp-setup')

-- Styling: Bufferline, Gitsigns, Lualine, NvimTree, VSCodeTheme
local styling_setup = require('styling')
styling_setup.setup()

-- DAP
local dap_setup = require('dap-setup')
dap_setup.setup()

-- Formatting: Autoformat, CMP
local formatting_setup = require('formatting')
formatting_setup.setup()

-- vim: ts=2 sts=2 sw=2 et
