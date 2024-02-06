return {
  -- navarasu/onedark.nvim
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      local onedark = require("onedark")

      onedark.setup {
        style = "darker",
        transparent = true,
        code_style = {
          comments = "italic",
        },
      }

      onedark.load {}
    end,
  },

  -- nvim-lualine/lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          section_separators = '',
          component_separators = '',
          disabled_filetypes = { "netrw" },
        }
      }
    end,
  },

  -- lukas-reineke/indent-blankline.nvim
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
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
    end
  },

  -- folke/todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
}
