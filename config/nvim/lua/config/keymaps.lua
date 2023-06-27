local opts = { silent = true }

-- Leader key bindings
vim.keymap.set('n', '<leader>ww', ':w<cr>', opts)
vim.keymap.set('n', '<leader>wa', ':wa<cr>', opts)
vim.keymap.set('n', '<leader>ee', ':e<cr>', opts)
vim.keymap.set('n', '<leader>ef', ':e!<cr>', opts)

-- Key Bindings
vim.keymap.set('', '<C-p>', '"+P', opts)
vim.keymap.set('v', '<C-c>', '"+y', opts)

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Tabbing
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set('n', '<S-Tab>', ':tabprev<cr>', opts)
vim.keymap.set('n', '<Tab>', ':tabnext<cr>', opts)

vim.keymap.set("n", "J", "mzJ`z")		-- Append bottom line to current line and keep cursor @ 0
vim.keymap.set("n", "<C-d>", "<C-d>zz")	-- Center cursor on half page up n down
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")		-- Keep cursor centered when next or prev on search objs
vim.keymap.set("n", "N", "Nzzzv")

-- don't overwrite current buffer with pasted over word
vim.keymap.set("x", "<leader>p", [["_dP]])

-- substitute current selected word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- chmod current file to +x
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

-- <enter> to ciw
vim.keymap.set("n", "<cr>", "ciw", opts)
vim.keymap.set('i', '<C-H>', '<C-W>', {noremap = true})
vim.keymap.set("i", "<C-BS>", "<esc>cvb", opts)


-- Better window navigation
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
-- vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
-- vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
-- vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
local smart_splits = require('smart-splits');
vim.keymap.set('n', '<A-h>', smart_splits.resize_left)
vim.keymap.set('n', '<A-j>', smart_splits.resize_down)
vim.keymap.set('n', '<A-k>', smart_splits.resize_up)
vim.keymap.set('n', '<A-l>', smart_splits.resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', smart_splits.move_cursor_left)
vim.keymap.set('n', '<C-j>', smart_splits.move_cursor_down)
vim.keymap.set('n', '<C-k>', smart_splits.move_cursor_up)
vim.keymap.set('n', '<C-l>', smart_splits.move_cursor_right)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', smart_splits.swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', smart_splits.swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', smart_splits.swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', smart_splits.swap_buf_right)

-- LSP formatter
vim.keymap.set('n', '<leader>cf', ':lua vim.lsp.buf.format()<cr>', opts)
