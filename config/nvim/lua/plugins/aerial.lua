return {
  'stevearc/aerial.nvim',
  opts = {
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown", "man" },
    layout = { min_width = 28 },
    show_guides = true,
    guides = {
      mid_item = "├ ",
      last_item = "└ ",
      nested_top = "│ ",
      whitespace = "  ",
    },
    filter_kind = {
      'Interface',
    	'Class',
    	'Constructor',
    	'Enum',
    	'Module',
    	'Method',
    	'Struct',
    },
    on_attach = function(bufnr)
    	-- Toggle the aerial window with <leader>a
      local opts = { silent = true }
    	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', opts)

      -- NOTE: disabled in favour of smart-splits.nvim
    	-- Jump forwards/backwards with '{' and '}'
    	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-k>', '<cmd>AerialPrev<CR>', opts)
    	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-j>', '<cmd>AerialNext<CR>', opts)

    	-- Jump up the tree with '[[' or ']]'
    	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-K>', '<cmd>AerialPrevUp<CR>', opts)
    	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<A-J>', '<cmd>AerialNextUp<CR>', opts)
    end
  }
}
