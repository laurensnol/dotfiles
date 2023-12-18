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
-- lukas-reineke/indent-blankline.nvim
require("ibl").setup {
  indent = {
    char = { "│" },
  },
  scope = {
    show_start = false,
    highlight = { "Comment" },
  },
}
