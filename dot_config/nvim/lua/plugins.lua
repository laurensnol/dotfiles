require("lazy").setup {
  -- Base
  { "nvim-lua/plenary.nvim" },

  -- Language
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "mfussenegger/nvim-lint" },
  { "mfussenegger/nvim-dap" },

  -- Autocomplete
  { "windwp/nvim-autopairs", event = "InsertEnter" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Other
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
  { "nvim-lualine/lualine.nvim" },
  { "folke/todo-comments.nvim" },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { "simrat39/rust-tools.nvim" },
  { "akinsho/flutter-tools.nvim" },
  { "lewis6991/gitsigns.nvim" },
  --{ "tpope/vim-fugitive" },
  { "sindrets/diffview.nvim" },
  { "NeogitOrg/neogit" },

  -- Styling
  { "navarasu/onedark.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
}

require("configs/language")
require("configs/styling")
require("configs/autocomplete")
require("configs/other")
