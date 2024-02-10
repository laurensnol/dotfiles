return {
  -- nvim-telescope/telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- mrcjkb/rustaceanvim
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
  },

  -- iamcco/markdown-preview.nvim
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- mrcjkb/haskell-tools.nvim
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  },
}
