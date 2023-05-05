return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "mrjones2014/nvim-ts-rainbow",
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
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    }
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
