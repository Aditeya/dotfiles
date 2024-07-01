-- Clipboard
vim.opt.clipboard = 'unnamedplus'

-- Show hidden chars
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- Line number and Relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab Settigns
local function tabs(tabsize)
	vim.opt.tabstop = tabsize
	vim.opt.shiftwidth = tabsize
	vim.opt.softtabstop = tabsize
	-- vim.opt.expandtab=false
	vim.opt.autoindent = true
end

tabs(4)

-- NOTE: tabsize in HTML
vim.api.nvim_create_autocmd("FileType", {
	pattern = "html",
	callback = function() tabs(2) end
})

-- Cursor Options
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Mouse & GUI settings
vim.opt.mouse = 'a'
-- vim.opt.guifont = { 'Iosevka Term Slab,Noto Color Emoji', ':h8.5' }
vim.opt.guifont = { 'Iosevka Term Slab,Noto Color Emoji', ':h16' }

-- UFO Fold settings
vim.opt.foldlevel = 999

