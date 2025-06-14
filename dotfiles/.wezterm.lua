-- https://wezfurlong.org/wezterm/config/lua/config/index.html
-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- https://www.nerdfonts.com/font-downloads
-- wezterm ls-fonts --list-system|grep
config.font = wezterm.font_with_fallback({
	{ family = "Hack Nerd Font Mono", weight = "Regular" }, -- looks quite nice
	--{ family = "Iosevka Nerd Font", weight = "Regular" }, -- huge install, small width
	"Consolas", -- linux? glyphs?
	"JetBrains Mono", -- glyphs?
	-- { family = "FiraCode Nerd Font Mono", weight = "Regular" }, -- wierd 'www'
	-- { family = "CaskaydiaCove Nerd Font Mono", weight = "Regular" }, -- too fat, wierd '--'
	-- "0xProto Nerd Font Mono", -- delete? just for glyphs
})

config.font_size = 12.0
config.warn_about_missing_glyphs = false

-- use system ssh agent - https://github.com/wezterm/wezterm/discussions/5541
config.mux_enable_ssh_agent = false

--config.color_scheme = 'AdventureTime'
--config.color_scheme = 'Batman'
--config.color_scheme = 'Red Scheme'
--config.window_decorations = "NONE"
-- config.window_decorations = "TITLE | RESIZE"
config.window_decorations = "RESIZE"

--config.color_scheme = 'Batman'
--config.color_scheme = 'Builtin Solarized Dark'

config.unix_domains = {
	{
		name = "unix",
	},
	{
		name = "dropdown",
	},
}

config.check_for_updates = false
config.audible_bell = "Disabled"

-- This causes `wezterm` to act as though it was started as
-- `wezterm connect unix` by default, connecting to the unix
-- domain on startup.
-- If you prefer to connect manually, leave out this line.
-- config.default_gui_startup_args = { 'connect', 'unix' }

config.default_domain = "unix"

if wezterm.target_triple:find("windows") ~= nil then
  config.default_prog = { "pwsh", "-nologo" }
  -- allows using ssh-agent on Windows unlike the default "Libssh"
  config.ssh_backend = "Ssh2"
end

-- maximized window on 0,0 instead of somewhere centered
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():set_position(0, 0)
	window:gui_window():maximize()
end)

-- timeout_millisecondm defaults to 1000 and can be omitted
-- tmux leader
-- config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
-- alternative leader key to make life easier with tmux
config.leader = { key = "g", mods = "CTRL", timeout_milliseconds = 1000 }

-- extra actions
local ext = {}
ext.RenameTab = act.PromptInputLine({
	description = "Enter new name for tab",
	action = wezterm.action_callback(function(window, pane, line)
		if line then
			window:active_tab():set_title(line)
		end
	end),
})
ext.RenameWindow = act.PromptInputLine({
	description = "Enter new name for window",
	action = wezterm.action_callback(function(window, pane, line)
		if line then
			wezterm.GLOBAL.title = line .. " "
		end
	end),
})

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
	local zoomed = ""
	if tab.active_pane.is_zoomed then
		zoomed = "[Z] "
	end

	local index = ""
	if #tabs > 1 then
		index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
	end

	return (wezterm.GLOBAL.title or "") .. zoomed .. index .. tab.active_pane.title
end)

-- true - graphical tabs. false - text tabs
config.use_fancy_tab_bar = true
config.show_new_tab_button_in_tab_bar = true
--config.show_close_tab_button_in_tabs = false


--config.color_scheme = "carbonfox"
--config.color_scheme = 'Batman'

-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
--   -- local palette = config.resolved_palette.tab_bar
--   -- local colors = {
--   --   bg = palette.background,
--   --   tab = tab.is_active and palette.active_tab.bg_color or palette.inactive_tab.bg_color,
--   --   fg = tab.is_active and palette.active_tab.fg_color or palette.inactive_tab.fg_color,
--   -- }
--
--   return {
--   --  { Background = { Color = colors.bg } },
--   --  { Foreground = { Color = colors.tab } },
--   --  { Text = wezterm.nerdfonts.ple_lower_right_triangle },
--   --  --{ Background = { Color = colors.tab } },
--   --  { Background = { Color = '#00ff00' } },
--   --  { Foreground = { Color = colors.fg } },
--   --  { Text = '!!!' },
--     { Text = ' [' },
--     { Text = tab.active_pane.title:sub(-max_width) },
--     { Text = '] ' },
--   --  { Text = tab.active_pane.title },
--   --  { Background = { Color = colors.tab } },
--   --  { Foreground = { Color = colors.bg } },
--   --  { Text = wezterm.nerdfonts.ple_upper_right_triangle },
--   }
-- end)

wezterm.on("augment-command-palette", function(window, pane)
	return {
		{
			brief = "Rename window",
			icon = "md_rename_box",
			action = ext.RenameWindow,
		},
	}
end)
wezterm.on("augment-command-palette", function(window, pane)
	return {
		{
			brief = "Rename tab",
			icon = "md_rename_box",
			action = ext.RenameTab,
		},
	}
end)

-- https://wezfurlong.org/wezterm/config/lua/keyassignment/ActivateTabRelative.html

local clk = config.leader.key
config.keys = {
	-- escape for leader on double-press
	{ key = clk, mods = "LEADER|CTRL", action = act.SendKey({ key = clk, mods = "CTRL" }) },

	--- tmux splits " and %
	{ key = '"', mods = "LEADER|SHIFT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "%", mods = "LEADER|SHIFT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

	-- tmux new tab ctrl-b c
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "y", mods = "CTRL|SHIFT", action = wezterm.action.SpawnCommandInNewTab({
		args = { "cmd.exe" }, -- make sure to also install clink. pure cmd is garbage
	}) },
	{ key = "y", mods = "CTRL|SHIFT", action = wezterm.action.SpawnCommandInNewTab({
		args = { "cmd.exe" },
	}) },

	-- vim ctrl-w splits
	{ key = "s", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "v", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },

	-- pane movement vim
	{ key = "h", mods = "LEADER", action = act({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = act({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = act({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = act({ ActivatePaneDirection = "Right" }) },

	-- pane movement tmux arrows
	{ key = "LeftArrow", mods = "LEADER", action = act({ ActivatePaneDirection = "Left" }) },
	{ key = "DownArrow", mods = "LEADER", action = act({ ActivatePaneDirection = "Down" }) },
	{ key = "UpArrow", mods = "LEADER", action = act({ ActivatePaneDirection = "Up" }) },
	{ key = "RightArrow", mods = "LEADER", action = act({ ActivatePaneDirection = "Right" }) },

	-- tab fast arrows
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = act({ ActivatePaneDirection = "Up" }) },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = act({ ActivatePaneDirection = "Down" }) },

	-- pane size
	{ key = "H", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Left", 5 } }) },
	{ key = "J", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Down", 5 } }) },
	{ key = "K", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Up", 5 } }) },
	{ key = "L", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Right", 5 } }) },

	-- tmux tab movement ctrl-b [n|p]
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },

	-- tmux switch to last tab. ctrl-b l
	{ key = "l", mods = "LEADER", action = act.ActivateLastTab },

	-- tmux rename tab
	{ key = ",", mods = "LEADER", action = ext.RenameTab },
	--{ key = ",", mods = "LEADER",       action=act.ShowTabNavigator},

	-- wezterm tab navigator with search by ctrl-g / or ctrl-shift-/
	{ key = "/", mods = "LEADER", action = act.ShowTabNavigator },
	{ key = "?", mods = "CTRL|SHIFT", action = act.ShowTabNavigator },

	-- tmux close tab/pane
	{ key = "K", mods = "LEADER|SHIFT", action = act({ CloseCurrentPane = { confirm = false } }) },
	-- { key = "d", mods = "LEADER",       action=act{CloseCurrentPane={confirm=true}}},
	-- { key = "x", mods = "LEADER",       action=act{CloseCurrentPane={confirm=true}}}

	-- tmux tab index activation. ctrl-b #
	{ key = "1", mods = "LEADER", action = act({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = act({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = act({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = act({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = act({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = act({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = act({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = act({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = act({ ActivateTab = 8 }) },
}

return config

-- vim: noet sw=4 ts=4
