-----------------------------
-- nvim-tree/nvim-tree.lua
require("nvim-tree").setup {}

-----------------------------
-- nvim-lualine/lualine.nvim
require("lualine").setup {
  options = {
    theme = "onedark",
    component_seperators = { left = ' ', right = ' ' },
    --section_separators = { left = '', right = '' },
    disabled_filetypes = { "NvimTree" },
  },
}

-----------------------------
-- folke/todo-comments.nvim
require("todo-comments").setup {}

-----------------------------
-- akinsho/flutter-tools.nvim
require("flutter-tools").setup {}

-----------------------------
-- lewis6991/gitsigns.nvim
require('gitsigns').setup {}

-----------------------------
-- NeogitOrg/neogit
require("neogit").setup {}
