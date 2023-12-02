local M = {}

M.setup = function ()

  require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
  })

  vim.keymap.set('n', '<c-n>', ':NvimTreeFindFile<CR>')
end

return M

-- vim: ts=2 sts=2 sw=2 et
