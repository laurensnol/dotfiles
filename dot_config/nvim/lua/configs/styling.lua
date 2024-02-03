-----------------------------
-- navarasu/onedark.nvim
local od = require("onedark")

od.setup {
  style = "darker",
  transparent = true,
  code_style = {
    comments = "italic",
  },
}

od.load()

-----------------------------
-- nvim-lualine/lualine.nvim
require("lualine").setup {
  options = {
    section_separators = '',
    component_separators = '',
    disabled_filetypes = { "NvimTree" },
  },
}

-----------------------------
-- lukas-reineke/indent-blankline.nvim
require("ibl").setup {
  indent = {
    char = { "│" },
  },
  scope = {
    show_start = false,
    show_end = false,
    highlight = { "Comment" },
  },
}

-----------------------------
-- highlight group overrides
vim.api.nvim_set_hl(0, "@type.qualifier.cpp", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@storageclass.cpp", { link = "Keyword" })
