-- local wezterm = require('wezterm')
local fonts = require('font');
local keys = require('keys');

-- local gpus = wezterm.gui.enumerate_gpus()

local padding = '0px'
local window_padding = {
  top = padding,
  right = padding,
  bottom = padding,
  left = padding,
}

return {
  keys = keys,

  -- NOTE: doesn't work on all devices
  -- front_end = 'WebGpu',
  -- webgpu_preferred_adapter = gpus[0],

  default_prog = { '/usr/bin/zsh', '-l' },
  adjust_window_size_when_changing_font_size = false,
  use_cap_height_to_scale_fallback_fonts = true,
  -- font_locator = 'ConfigDirsOnly',
  -- freetype_load_flags = 'NO_HINTING',
  font_dirs = { 'fonts' },
  font_size = 14,
  font = fonts.font,
  font_rules = fonts.font_rules,

  -- color_scheme = 'nord',
  color_scheme = 'tokyonight_night',

  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,

  window_padding = window_padding,
  window_background_opacity = 0.8,
}
