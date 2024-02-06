return {
  -- windwp/nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "windwp/nvim-autopairs",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")

      local autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on(
        "confirm_done",
        autopairs.on_confirm_done()
      )

      local kind_icons = {
        --[[Text = "",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",]]

        --[[Text = "T",
        Method = "F",
        Function = "F",
        Constructor = "c",
        Field = "F",
        Variable = "V",
        Class = "C",
        Interface = "I",
        Module = "M",
        Property = "P",
        Unit = "u",
        Value = "v",
        Enum = "E",
        Keyword = "K",
        Snippet = "S",
        Color = "c",
        File = "f",
        Reference = "F",
        Folder = "f",
        EnumMember = "E",
        Constant = "G",
        Struct = "C",
        Event = "e",
        Operator = "o",
        TypeParameter = "p",]]

        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      }

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")

      cmp.setup {
        formatting = {
          fields = {
            "kind",
            "abbr",
          },
          format = function(_, vim_item)
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.abbr = string.format("%s", vim_item.abbr)

            return vim_item
          end,
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end),

          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Esc>"] = cmp.mapping.abort(),
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        --{
        --  { name = "buffer" },
        --},
        experimental = {
          ghost_text = true,
        },
      }

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources {
          { name = "git" },
        },
        {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
    end
  },
}
