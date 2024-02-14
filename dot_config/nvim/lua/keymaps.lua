-- convenience indentation mappings
vim.keymap.set("x", "<Tab>", function()
  vim.api.nvim_command('normal >>')
  vim.api.nvim_command('normal gv')
end, {})

vim.keymap.set("x", "<S-Tab>", function()
  vim.api.nvim_command('normal <<')
  vim.api.nvim_command('normal gv')
end, {})

-- a: [a]ction
local function setup_lsp_a(opts)
  vim.keymap.set("n", "<leader>ar", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>af", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, opts)
end

-- d: [d]iagnostic
vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {})

-- e: [e]xplorer
vim.keymap.set("n", "<leader>ee", ":Explore<CR>", {})
vim.keymap.set("n", "<leader>eh", ":Hexplore<CR>", {})
vim.keymap.set("n", "<leader>eH", ":Sexplore<CR>", {})
vim.keymap.set("n", "<leader>ev", ":Vexplore!<CR>", {})
vim.keymap.set("n", "<leader>eV", ":Vexplore", {})

-- f: [f]ind
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").git_files, {})
vim.keymap.set("n", "<leader>fa", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").live_grep, {})

vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<leader>fc", require("telescope.builtin").commands, {})
vim.keymap.set("n", "<leader>fq", require("telescope.builtin").quickfix, {})

vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, {})
vim.keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_implementations, {})
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").lsp_definitions, {})

-- g: [g]oto
local function setup_lsp_g(opts)
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
end

-- s: [s]how
local function setup_lsp_s(opts)
  vim.keymap.set("n", "<leader>sd", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>si", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>sr", vim.lsp.buf.references, opts)
end

-- w: [w]indows
vim.keymap.set("n", "<leader>ws", function()
  vim.cmd("vs")
  vim.cmd("wincmd l")

  require("telescope.builtin").find_files()
end)

vim.keymap.set("n", "<leader>wS", function()
  vim.cmd("sp")
  vim.cmd("wincmd j")

  require("telescope.builtin").find_files()
end)

vim.keymap.set("n", "<leader>wr", ":vert res 86<CR>", {})

--
AutocmdMaps = {}
function AutocmdMaps.setup_lsp(opts)
  setup_lsp_a(opts)
  setup_lsp_g(opts)
  setup_lsp_s(opts)
end

return AutocmdMaps
