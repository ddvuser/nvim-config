vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
require('styling')

-- DAP
require('dap-setup')

-- Formatting: Autoformat, CMP
require('formatting')

-- vim: ts=2 sts=2 sw=2 et
