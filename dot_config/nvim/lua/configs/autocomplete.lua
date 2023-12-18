-----------------------------
-- windwp/nvim-autopairs
require("nvim-autopairs").setup {}

-----------------------------
-- hrsh7th/cmp-*
-- L3MON4D3/LuaSnip
-- saadparwaiz1/cmp_luasnip

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
cmp.setup {
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

    ["<Esc>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.mapping.abort()
      else
        fallback()
      end
    end),
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  },
  experimental = {
    ghost_text = true,
  },
}

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources {
    { name = "git" },
  }, {
    { name = "buffer" },
  },
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

--cmp.setup.cmdline(":", {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = cmp.config.sources {
--    { name = "path" },
--  }, {
--    { name = "cmdline" },
--  },
--})
