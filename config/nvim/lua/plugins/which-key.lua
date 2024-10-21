vim.o.timeout = true
vim.o.timeoutlen = 500

return {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons"
  },
  event = "VeryLazy",
  keys = {
    { "<leader>f", group = "Search"},
  },
}
