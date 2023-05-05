return {
	'ckolkey/ts-node-action',
	dependencies = { 'nvim-treesitter' },
	opts = {},
	init = function()
		require "null-ls".register({
			name = "more_actions",
			method = { require "null-ls".methods.CODE_ACTION },
			filetypes = { "_all" },
			generator = {
				fn = require("ts-node-action").available_actions
			}
		})
	end
}
