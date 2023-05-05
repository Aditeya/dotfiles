return {
  "folke/which-key.nvim",
  config = function ()
    vim.o.timeout = true
    vim.o.timeoutlen = 500

    local wk = require("which-key")
    wk.setup({})

    wk.register({
      f = { name = 'Search' },
    }, { prefix = '<leader>' })
  end
}
