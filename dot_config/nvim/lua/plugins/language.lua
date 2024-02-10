return {
  -- nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    config = function()
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
    end,
  },

  -- neovim/nvim-lspconfig.nvim
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim"
    },
  },

  -- williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  -- williamboman/mason-lspconfig.nvim
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "mason.nvim"
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities {}
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
          }
        end,
        ["rust_analyzer"] = function() end,
        ["hls"] = function() end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          }
        end
      }

      require("mason-lspconfig").setup {
        ensure_installed = {
          "jsonls", "texlab", "marksman",
          "lua_ls", "clangd", --[["rust_analyzer",]] "pyright",
          "html", "cssls", "tsserver"
        },
      }
    end
  },

  -- mfussenegger/nvim-lint
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        cpp = { "cppcheck" },
        hpp = { "cppcheck" },
      }

      local cppcheck = require("lint.linters.cppcheck")
      table.insert(cppcheck.args, "--suppress=missingIncludeSystem")
    end,
  },
}
