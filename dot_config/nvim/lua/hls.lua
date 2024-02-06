-- nvim-treesitter
vim.api.nvim_set_hl(0, "@type.qualifier.cpp", { link = "Keyword" })
vim.api.nvim_set_hl(0, "@storageclass.cpp", { link = "Keyword" })

-- nvim-cmp
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "@function" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { link = "@function" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { link = "Structure" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { link = "@module" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { link = "@lsp.type.enum" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { link = "@keyword" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { link = "@lsp.type.enumMember" })
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { link = "@lsp.type.macro" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { link = "Structure" })

--local bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("CmpItemKindFunction")), "fg#")
--local fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Normal")), "bg")
--vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = fg, bg = bg })

-- write method to get every hl matching CmpItemKind*
-- write method to set fg to bg
