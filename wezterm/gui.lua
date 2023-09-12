local wezterm = require('wezterm')

function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "Dracula (Official)"
  else
    return 
    "Catppuccin Latte"
    -- "Gruvbox Light"
  end
end

wezterm.on("window-config-reloaded", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

local module = {
    hide_tab_bar_if_only_one_tab = false,
    window_close_confirmation = "NeverPrompt",
    tab_bar_at_bottom = true,
    window_decorations = "TITLE | RESIZE",
    scrollback_lines = 10000,
    show_tab_index_in_tab_bar = false,
    switch_to_last_active_tab_when_closing_tab = true,
    bidi_enabled = true,
    enable_scroll_bar = false,
    native_macos_fullscreen_mode = true,
    enable_tab_bar = true,
    use_fancy_tab_bar = false,
    enable_kitty_graphics = true,
    -- text_background_opacity = 0.7,
    window_background_opacity = 0.95,
    color_scheme = 'Dracula (Official)',

    tiling_desktop_environments = {
        'X11 LG3D',
        'X11 bspwm',
        'X11 i3',
        'X11 dwm',
        'Wayland'
    },
    front_end = "OpenGL",
    enable_wayland = true,
    window_padding = {
      left = 8,
      bottom = 0,
      right = 3,
      top = 8,
    },
    window_frame = { 
        font = wezterm.font { family = 'Noto Sans', weight = 'Regular' }, 
    }
}
return module
