-----------------------------
--[[

Prefixes:
 - a  : action
 - d  : diagnostic
 - D  : debug
 - e  : (file) explorer
 - F/f: find
 - g  : go to
 - G  : git
 - s  : show

--]]
-----------------------------

vim.g.mapleader = " "

-----------------------------
-- nvim-lspconfig
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    -- [a]
    vim.keymap.set("n", "<leader>ar", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>af", function() vim.lsp.buf.format() end, opts)
    vim.keymap.set("n", "<leader>ac", function() vim.lsp.buf.code_action() end, opts)

    -- [d]
    vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)

    -- [g]
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

    -- [s]
    vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>si", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>sr", vim.lsp.buf.references, opts)
  end,
})

-----------------------------
-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>F", builtin.git_files, {})
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})

-----------------------------
-- NvimTree
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>E", "<Cmd>NvimTreeFocus<CR>")

-----------------------------
-- NeogitOrg/neogit
local neogit = require("neogit")
vim.keymap.set("n", "<leader>G", neogit.open, {});

-----------------------------
-- diffview.nvim
vim.keymap.set("n", "<leader>Gd", function()
  if next(require("diffview.lib").views) == nil then
    vim.cmd("DiffviewOpen")
  else
    vim.cmd("DiffviewClose")
  end
end)

-----------------------------
-- nvim-dap
vim.keymap.set("n", "<leader>Dr", function() require("dap").continue() end)
vim.keymap.set("n", "<leader>Db", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<leader>Di", function() require("dap").step_into() end)
vim.keymap.set("n", "<leader>Do", function() require("dap").step_over() end)
vim.keymap.set("n", "<leader>DO", function() require("dap").step_out() end)
