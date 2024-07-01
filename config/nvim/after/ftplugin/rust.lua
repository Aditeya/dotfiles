local bufnr = vim.api.nvim_get_current_buf()
local opts = { remap = false, buffer = bufnr }
vim.keymap.set(
	"n",
	"<leader>ga",
	function()
		vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
		-- or vim.lsp.buf.codeAction() if you don't want grouping.
	end,
	{ silent = true, buffer = bufnr }
)

vim.keymap.set(
	"n",
	"K",
	function ()
		vim.cmd.RustLsp { 'hover', 'actions' }
	end,
	{ buffer = bufnr }
)

vim.keymap.set('n', '<C-k>', '<C-w>k', opts)

vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set('n','<leader>gr', vim.lsp.buf.rename , opts)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition , opts)

vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
