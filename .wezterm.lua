local wezterm = require 'wezterm'


local config = {}

wezterm.on('toggle-opacity', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.7
  else
    overrides.window_background_opacity = nil
  end
  window:set_config_overrides(overrides)
end)

wezterm.on('toggle-blur', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.macos_window_background_blur then
    overrides.macos_window_background_blur = 0
  else
    overrides.macos_window_background_blur = nil
  end
  window:set_config_overrides(overrides)
end)

wezterm.on('window-focus-changed', function(window)
  local overrides = window:get_config_overrides() or {}
  if window:is_focused() then
    -- Set opacity for active window
    overrides.window_background_opacity = 0.9  -- Fully opaque when focused
  else
    -- Set opacity for inactive windows
    overrides.window_background_opacity = 0.73  -- Your default opacity
  end
  window:set_config_overrides(overrides)
end)


-- wezterm.on('focus-changed', function(window, pane)
--   local process = pane:get_foreground_process_name()
  
--   if process and process:lower():find("nvim") then
--     toggle_opacity(window, pane)
--   else
--     local overrides = window:get_config_overrides() or {}
--     overrides.window_background_opacity = config.window_background_opacity
--     window:set_config_overrides(overrides)
--   end
-- end)


config.keys = {
    {
      key = 'B',
      mods = 'CTRL',
      action = wezterm.action.EmitEvent 'toggle-opacity',
    },
     {
      key = 'Y',
      mods = 'CTRL',
      action = wezterm.action.EmitEvent 'toggle-blur',
    },
}

config.audible_bell = 'Disabled'
config.font_size = 14
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.73
config.macos_window_background_blur = 30
config.window_decorations = "RESIZE"
config.window_close_confirmation = 'NeverPrompt'


config.font = wezterm.font 'JetBrains Mono'




config.colors = {
  -- The default text color
  foreground = '#ffc100',
  -- The default background color
  background = '#00061b',
-- background = '#353C4B',

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = '#c7c7c7',
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = 'black',
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  cursor_border = '#c7c7c7',

  -- the foreground color of selected text
  selection_fg = 'black',
  -- the background color of selected text
  selection_bg = '#fffacd',

  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  scrollbar_thumb = '#222222',

  -- The color of the split lines between panes
  split = '#444444',

  ansi = {
    'black',
    'maroon',
    '#0bff00',
    '#ffc100',
    '#8B02B8',
    'purple',
    '#709596',
    'silver',
  },
  brights = {
    'grey',
    'red',
    '#5FF967',
    '#feff55',
    '#6A71FF',
    'fuchsia',
    '#00beff',
    'white',
  },

  -- Arbitrary colors of the palette in the range from 16 to 255
  indexed = { [136] = '#af8700' },

  -- Since: 20220319-142410-0fcdea07
  -- When the IME, a dead key or a leader key are being processed and are effectively
  -- holding input pending the result of input composition, change the cursor
  -- to this color to give a visual cue about the compose state.
  compose_cursor = 'orange',

  -- Colors for copy_mode and quick_select
  -- available since: 20220807-113146-c2fee766
	  -- In copy_mode, the color of the active text is:
	  -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
	  -- 2. selection_* otherwise
	  copy_mode_active_highlight_bg = { Color = '#000000' },
	  -- use `AnsiColor` to specify one of the ansi color palette values
	  -- (index 0-15) using one of the names "Black", "Maroon", "Green",
	  --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
	  -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
	  copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
	  copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
	  copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

	  quick_select_label_bg = { Color = 'peru' },
	  quick_select_label_fg = { Color = '#ffffff' },
	  quick_select_match_bg = { AnsiColor = 'Navy' },
	  quick_select_match_fg = { Color = '#ffffff' },
	}

	return config

