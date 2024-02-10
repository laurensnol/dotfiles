-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    local autocmd_maps = require("keymaps")
    autocmd_maps.setup_lsp(opts)
  end
})

-- mfussenegger/nvim-lint
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    require("lint").try_lint()
  end,
})

-- mrcjkb/haskell-tools.nvim
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.hs", "*.hls" },
  callback = function()
    require("haskell-tools").lsp.start()
  end,
})
