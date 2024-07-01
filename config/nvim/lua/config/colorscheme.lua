-- Colorschemes
vim.opt.termguicolors = true
vim.opt.syntax = 'on'

-- nord.nvim settings
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_cursorline_transparent = true
vim.g.nord_italic = false

local is_neovide = vim.fn.exists("g:neovide") ~= 0
if is_neovide then
  vim.g.nord_disable_background = false
  vim.g.nord_cursorline_transparent = false
  require('tokyonight').setup({ style = "night", transparent = true })
-- else
  -- vim.cmd([[
  --   hi Normal guibg=NONE ctermbg=NONE
  --   hi Normal ctermbg=NONE guibg=NONE
  --   hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
  -- ]])
end

-- vim.cmd([[colorscheme nord]])
-- if vim.api.nvim_get_hl(0, { name = "@lsp.type.function" }) then
--   for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--     vim.api.nvim_set_hl(0, group, {})
--   end
-- end

-- Also check transparency.lua
vim.cmd([[colorscheme tokyonight-night]])
