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

require('styling')

require('dap-setup')

require('formatting')

-- vim: ts=2 sts=2 sw=2 et
