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

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require('lsp-setup')


require('styling.bufferline-setup')
require('styling.vscode-theme')
require('styling.lualine-setup')
require('styling.nvimtree_config')

require('formatting.autoformat')
require('formatting.debug')
require('formatting.cmp-setup')

-- vim: ts=2 sts=2 sw=2 et
