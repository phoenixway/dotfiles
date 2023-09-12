local wt = require('wezterm')
local module = {
	-- font = wt.font("FiraCode Nerd Font Mono", { weight = "Medium" }),
	-- font = wt.font("Inconsolata", { weight = "Regular" }),
	font = wt.font("MesloLGM Nerd Font Mono", { weight = "Regular" }),
	-- font = wt.font("CaskaydiaCove Nerd Font Mono", { weight = "Regular" }),
	font_size = 11,
        line_height = 1.0,
	command_palette_font_size = 30,
	harfbuzz_features = { "calt=0", "clig=0", "liga=1" }, 
	adjust_window_size_when_changing_font_size = false,
}
return module
