local w = require('wezterm')
local act = w.action;
local smart_splits = require('smart-splits');

w.on('toggle-ligature', function(window, _pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.harfbuzz_features then
    -- If we haven't overridden it yet, then override with ligatures disabled
    overrides.harfbuzz_features = { 'calt=0', 'dlig=0' }
  else
    -- else we did already, and we should disable out override now
    overrides.harfbuzz_features = nil
  end
  window:set_config_overrides(overrides)
end)

w.on('toggle-opacity', function(window, _pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 1.0
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

return {
	-- move between split panes
	smart_splits.split_nav('move', 'h'),
	smart_splits.split_nav('move', 'j'),
	smart_splits.split_nav('move', 'k'),
	smart_splits.split_nav('move', 'l'),
	-- resize panes
	smart_splits.split_nav('resize', 'h'),
	smart_splits.split_nav('resize', 'j'),
	smart_splits.split_nav('resize', 'k'),
	smart_splits.split_nav('resize', 'l'),
	{
		key = 'L',
		mods = 'CTRL|SHIFT|ALT',
		action = act.Multiple {
			act.ClearScrollback 'ScrollbackAndViewport',
			act.SendKey { key = 'L', mods = 'CTRL' },
		},
	},
	{
		key = 'B',
		mods = 'CTRL|SHIFT|ALT',
		action = w.action.EmitEvent('toggle-ligatures'),
	},
	{
		key = 'B',
		mods = 'CTRL|SHIFT',
		action = w.action.EmitEvent('toggle-opacity'),
	},
	{
		key = 'F11',
		mods = '',
		action = w.action.ToggleFullScreen,
	},
};
