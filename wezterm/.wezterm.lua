local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)

config.font = wezterm.font("ComicShannsMono Nerd Font")
config.font_size = 20

config.enable_tab_bar = false

local primary_color = "#FFB6C1"
-- config.color_scheme = "Batman"
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#FFB6C1",
	cursor_border = "#FFB6C1",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", primary_color, "#a277ff", primary_color, primary_color },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", primary_color, primary_color },
}
config.window_decorations = "TITLE | RESIZE"

config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.native_macos_fullscreen_mode = true

return config
