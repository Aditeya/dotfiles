return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" }
  },
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  event = "BufReadPost",
  -- keys = {
  --   { "<c-space>", desc = "Increment selection" },
  --   { "<bs>", desc = "Schrink selection", mode = "x" },
  -- },
  opts = {
    -- A list of parser names, or "all"
    indent = { enable = true },
    highlight = {
    	enable = true,
    	additional_vim_regex_highlighting = false,
    },
    ensure_installed = {
    	"markdown",
    	"rust",
    	"make",
    	"c",
    	"lua",
    	"vim",
    	"java",
    	"javascript",
    	"typescript",
    	"html",
    	"css",
    	"dockerfile",
    	"glsl",
    	"wgsl",
    	"jsonc",
      "bash",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
