return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		if vim.g.neovide then
			return
		end

		local transparency = require("transparent")
		transparency.setup({ -- Optional, you don't have to run setup.
			groups = {           -- table: default groups
				'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
				'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
				'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
				'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
				'EndOfBuffer',
			},
			extra_groups = {
				"NeoTreeNormal",
				"NeoTreeNormalNC",
			},          -- table: additional groups that should be cleared
			exclude_groups = {
				"NormalFloat",
			}, -- table: groups you don't want to clear
		})

		require('tokyonight').setup({ transparent = vim.g.transparent_enabled })
		vim.cmd[[colorscheme tokyonight-night]]

		-- if vim.g.neovide then
		-- 	vim.cmd[[TransparentDisable]]
		-- else
		-- 	vim.cmd[[TransparentEnable]]
		-- end
	end
}
