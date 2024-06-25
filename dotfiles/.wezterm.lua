-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font 'Consolas'

--config.color_scheme = 'AdventureTime'
--config.color_scheme = 'Batman'
--config.color_scheme = 'Red Scheme'
--config.window_decorations = "NONE"
config.window_decorations = "TITLE | RESIZE" 


--config.color_scheme = 'Batman'
--config.color_scheme = 'Builtin Solarized Dark'


config.default_prog = { 'pwsh', '-nologo' }


-- timeout_milliseconds defaults to 1000 and can be omitted
-- tmux leader
-- config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
-- alternative leader key to make life easier with tmux
config.leader = { key = 'g', mods = 'CTRL', timeout_milliseconds = 1000 }

-- extra actions
local ext = {}
ext.RenameTab = act.PromptInputLine {
        description = 'Enter new name for tab',
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end)
}
ext.RenameWindow = act.PromptInputLine {
        description = 'Enter new name for window',
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            wezterm.GLOBAL.title = line .. ' '
          end
        end)
}

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local zoomed = ''
  if tab.active_pane.is_zoomed then
    zoomed = '[Z] '
  end

  local index = ''
  if #tabs > 1 then
    index = string.format('[%d/%d] ', tab.tab_index + 1, #tabs)
  end

  return (wezterm.GLOBAL.title or '')  .. zoomed .. index .. tab.active_pane.title
end)

wezterm.on('augment-command-palette', function(window, pane)
  return {
    {
      brief = 'Rename window',
      icon = 'md_rename_box',
      action = ext.RenameWindow
      },
    }
end)
wezterm.on('augment-command-palette', function(window, pane)
  return {
    {
      brief = 'Rename tab',
      icon = 'md_rename_box',
      action = ext.RenameTab
      },
    }
end)



-- https://wezfurlong.org/wezterm/config/lua/keyassignment/ActivateTabRelative.html

local clk = config.leader.key
config.keys = {
    -- escape for leader on double-press
    { key = clk, mods = "LEADER|CTRL",  action=act.SendKey { key = clk, mods = 'CTRL' }, },

    --- tmux splits " and %
    { key = "\"",mods = "LEADER|SHIFT",action=act{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "%", mods = "LEADER|SHIFT", action=act{SplitHorizontal={domain="CurrentPaneDomain"}}},
    
    -- tmux new tab ctrl-b c
    { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },

    -- vim ctrl-w splits
    { key = "s", mods = "LEADER",       action=act{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "v", mods = "LEADER",       action=act{SplitHorizontal={domain="CurrentPaneDomain"}}},

    { key = "z", mods = "LEADER",       action="TogglePaneZoomState" },

    -- pane movement vim
    { key = "h", mods = "LEADER",       action=act{ActivatePaneDirection="Left"}},
    { key = "j", mods = "LEADER",       action=act{ActivatePaneDirection="Down"}},
    { key = "k", mods = "LEADER",       action=act{ActivatePaneDirection="Up"}},
    { key = "l", mods = "LEADER",       action=act{ActivatePaneDirection="Right"}},

    -- pane movement tmux arrows
    { key = "LeftArrow",  mods = "LEADER",       action=act{ActivatePaneDirection="Left"}},
    { key = "DownArrow",  mods = "LEADER",       action=act{ActivatePaneDirection="Down"}},
    { key = "UpArrow",    mods = "LEADER",       action=act{ActivatePaneDirection="Up"}},
    { key = "RightArrow", mods = "LEADER",       action=act{ActivatePaneDirection="Right"}},

    -- pane size
    { key = "H", mods = "LEADER|SHIFT", action=act{AdjustPaneSize={"Left", 5}}},
    { key = "J", mods = "LEADER|SHIFT", action=act{AdjustPaneSize={"Down", 5}}},
    { key = "K", mods = "LEADER|SHIFT", action=act{AdjustPaneSize={"Up", 5}}},
    { key = "L", mods = "LEADER|SHIFT", action=act{AdjustPaneSize={"Right", 5}}},

    -- tmux tab movement ctrl-b [n|p]
    { key = "n", mods = "LEADER",       action=act.ActivateTabRelative(1)},
    { key = "p", mods = "LEADER",       action=act.ActivateTabRelative(-1)},

    -- tmux switch to last tab. ctrl-b l
    { key = "l", mods = "LEADER",       action=act.ActivateLastTab},


    -- tmux rename tab
    { key = ",", mods = "LEADER",       action=ext.RenameTab},
    --{ key = ",", mods = "LEADER",       action=act.ShowTabNavigator},

    -- wezterm tab navigator with search
    { key = "/", mods = "LEADER",       action=act.ShowTabNavigator},


    -- tmux close tab
    { key = "K", mods = "LEADER|SHIFT", action=act{CloseCurrentTab={confirm=true}}},
    -- { key = "d", mods = "LEADER",       action=act{CloseCurrentPane={confirm=true}}},
    -- { key = "x", mods = "LEADER",       action=act{CloseCurrentPane={confirm=true}}}

    -- tmux tab index activation. ctrl-b #
    { key = "1", mods = "LEADER",       action=act{ActivateTab=0}},
    { key = "2", mods = "LEADER",       action=act{ActivateTab=1}},
    { key = "3", mods = "LEADER",       action=act{ActivateTab=2}},
    { key = "4", mods = "LEADER",       action=act{ActivateTab=3}},
    { key = "5", mods = "LEADER",       action=act{ActivateTab=4}},
    { key = "6", mods = "LEADER",       action=act{ActivateTab=5}},
    { key = "7", mods = "LEADER",       action=act{ActivateTab=6}},
    { key = "8", mods = "LEADER",       action=act{ActivateTab=7}},
    { key = "9", mods = "LEADER",       action=act{ActivateTab=8}}
}



return config
