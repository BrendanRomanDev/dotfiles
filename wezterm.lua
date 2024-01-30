-- wezterm will watch for file changes and reload on save
-- for manual config refresh: CTRL + SHIFT + R
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Initial window size
config.initial_rows = 40
config.initial_cols = 120

--  Styling
-- config.color_scheme = "Solarized Dark Higher Contrast"
config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font("SpaceMono Nerd Font Mono")
config.font_size = 13
-- -- disable ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.window_background_opacity = 0.80
config.macos_window_background_blur = 60
-- -- inactive pane styling
config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 0.4,
}

-- Updates
config.status_update_interval = 10000

-- Keymap
config.keys = {
	-- Panes
	-- -- splits
	{ key = "b", mods = "CTRL | CMD", action = wezterm.action.SplitHorizontal },
	{ key = "u", mods = "CTRL | CMD", action = wezterm.action.SplitVertical },
	{ key = "-", mods = "CTRL | CMD", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	-- -- resize
	{ key = "h", mods = "CTRL | CMD", action = wezterm.action.AdjustPaneSize({ "Left", 10 }) },
	{ key = "l", mods = "CTRL | CMD", action = wezterm.action.AdjustPaneSize({ "Right", 10 }) },
	{ key = "k", mods = "CTRL | CMD", action = wezterm.action.AdjustPaneSize({ "Up", 3 }) },
	{ key = "j", mods = "CTRL | CMD", action = wezterm.action.AdjustPaneSize({ "Down", 3 }) },
	{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontAndWindowSize },
	-- -- selection
	{ key = "n", mods = "CTRL | CMD", action = wezterm.action.ActivatePaneDirection("Next") },
	{ key = "p", mods = "CTRL | CMD", action = wezterm.action.ActivatePaneDirection("Prev") },
	{ key = ",", mods = "CTRL | CMD", action = wezterm.action.PaneSelect },
	-- Rotation / Swap
	{ key = "Tab", mods = "CTRL | CMD", action = wezterm.action.RotatePanes("CounterClockwise") },
	{ key = "i", mods = "CTRL | CMD", action = wezterm.action.RotatePanes("CounterClockwise") },
	{ key = "o", mods = "CTRL | CMD", action = wezterm.action.RotatePanes("Clockwise") },
}

-- Window swapping with cmd alt + windowNum
for i = 1, 8 do
	-- CMD+ALT + number to activate that window
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CMD | CTRL",
		action = wezterm.action.ActivateWindow(i - 1),
	})
end

-- Relocating your tab to a different order
for i = 1, 8 do
	-- CTRL+ALT + number to move to that position
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.MoveTab(i - 1),
	})
end

-- Update tab titles based on cwd
wezterm.on("update-status", function(window)
	local active_pane = window:active_tab():active_pane()

	if not active_pane then
		wezterm.log_info("no pane sorry")
		return
	end

	local cwd = tostring(active_pane:get_current_working_dir())
	local curr_tab_title = active_pane:tab():get_title()
	local new_tab_title = cwd:match("/([^/]+)$")

	if curr_tab_title ~= new_tab_title then
		window:active_tab():set_title(new_tab_title)
	end
end)

-- and finally, return the configuration to wezterm
return config
