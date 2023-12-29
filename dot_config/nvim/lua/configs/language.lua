-----------------------------
-- nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "vim", "vimdoc", "query", "json", "latex", "markdown",
    "lua", "c", "cpp", "rust", "python",
    "html", "css", "javascript", "typescript"
  },
  auto_install = false,
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

      if ok and stats and stats.size > max_filesize then
        return true
      end
    end
  },
}

-----------------------------
-- williamboman/mason.nvim
require("mason").setup {}

-----------------------------
-- williamboman/mason-lspconfig.nvim
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local handlers = {
  function (server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
    }
  end,

  ["lua_ls"] = function ()
    local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        }
      }
  end,

  ["rust_analyzer"] = function ()
    require("rust-tools").setup {
      server = {
        settings = {
          ["rust-analyzer"] = {
            --capabilities = capabilities,
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }
  end
}

require("mason-lspconfig").setup {
  handlers = handlers,
  ensure_installed = {
    "jsonls", "texlab", "marksman",
    "lua_ls", "clangd", "rust_analyzer", "pyright",
    "html", "cssls", "tsserver",
  },
}

-----------------------------
-- mfussenegger/nvim-lint
require("lint").linters_by_ft = {
  cpp = {"cppcheck",},
  hpp = {"cppcheck",},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function ()
    require("lint").try_lint()
  end,
})
