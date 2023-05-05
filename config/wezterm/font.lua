local w = require('wezterm')

local family = 'Iosevka Term Slab'
local harfbuzz_features = { 'calt=0', 'dlig=1' }
local font = w.font_with_fallback({
  {
    family = family,
    weight = 'Light',
    harfbuzz_features = harfbuzz_features,
  },
  { family = 'Apple Color Emoji', assume_emoji_presentation = true },
  'Symbols-2048-em Nerd Font Complete',
})

-- font_family      Iosevka Term Slab Light
-- bold_font        Iosevka Term Slab Bold
-- italic_font      Iosevka Term Slab Light Italic
-- bold_italic_font Iosevka Term Slab Bold Italic

local font_rules = {
  {
    intensity = 'Bold',
    italic = false,
    font = w.font({
      family = family,
      weight = 'Bold', style = 'Normal',
      harfbuzz_features = harfbuzz_features,
    }),
  },
  {
    intensity = 'Normal',
    italic = true,
    font = w.font({
      family = family,
      weight = 'Light', style = 'Italic',
      harfbuzz_features = harfbuzz_features,
    }),
  },
  {
    intensity = 'Bold',
    italic = true,
    font = w.font({
      family = family,
      weight = 'Bold', style = 'Italic',
      harfbuzz_features = harfbuzz_features,
    }),
  },
}

return {
	font = font,
	font_rules = font_rules,
}
