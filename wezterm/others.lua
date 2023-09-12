local wt = require("wezterm")
local module = {
	-- Meta
	check_for_updates = false, -- done via homebrew already
	automatically_reload_config = true,

	-- Passwords
	-- INFO `sudo visudo`, and change line `Defaults env_reset` to `Defaults env_reset,pwfeedback`
	-- to see asterisks in general
	detect_password_input = false,

	-- Start/Close
	default_cwd = wt.home_dir .. "/home/roman/studio",
	quit_when_all_windows_are_closed = true,
	window_close_confirmation = "NeverPrompt",

	-- Mouse & Cursor
	hide_mouse_cursor_when_typing = true,
	default_cursor_style = "BlinkingBar", -- mostly overwritten by vi-mode.zsh
	cursor_thickness = "0.07cell",
	cursor_blink_rate = 700,
	cursor_blink_ease_in = "Constant", -- Constant = no fading
	cursor_blink_ease_out = "Constant",
	force_reverse_video_cursor = true, -- true = color is reverse, false = color by color scheme

	-- font
	-- INFO some nerd font requires a space after them to be properly sized

	-- Appearance
	audible_bell = "Disabled", -- SystemBeep|Disabled
	visual_bell = { -- briefly flash cursor on visual bell
		fade_in_duration_ms = 150,
		fade_out_duration_ms = 150,
		target = "CursorColor",
	}
    }
return module
