-- Pull in the wezterm API
local wezterm = require 'wezterm'

local wezterm_mod = "CTRL"

-- This will hold the configuration.
local config = wezterm.config_builder()

config.automatically_reload_config = true

config.font_size = 17.0
config.use_ime = true
config.font = wezterm.font_with_fallback {
  'Fira Code',
  'DengXian',
}

config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

config.color_scheme = 'Tokyo Night Moon'

-- 上のバーを消す
config.window_decorations = "RESIZE"


config.colors = {
  tab_bar = {
    background = "none",
  },
}

config.window_background_gradient = {
  colors = { "#000000" },
}

config.use_fancy_tab_bar = true

config.window_frame = {
  -- ここの数値を上げると、タブバー全体の高さが高くなります
  -- (メインの文字サイズ17.0に合わせて、少し大きめの15.0あたり推奨)
  font_size = 15.0,

  -- 非アクティブなタブの背景色（下のformat-tab-titleの隙間を埋める色）
  active_titlebar_bg = '#000000',
  inactive_titlebar_bg = '#000000',
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#101033"
  local foreground = "#999999" -- 非アクティブ時は少し暗くすると見やすいです

  if tab.is_active then
    background = "#333388"
    foreground = "#FFFFFF"
  elseif hover then
    background = "#202055"
    foreground = "#FFFFFF"
  end

  -- タイトル作成
  -- 左右のスペース "   " を増やすと、横幅も広がります
  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
  }
end)

config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#101033"
  local foreground = "#FFFFFF"
  local edge_background = "none"
  if tab.is_active then
    background = "#333388"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
  }
end)

config.keys = {
  {
    key = "f",
    mods = wezterm_mod
  ,
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },{
    key = "d",
    mods = wezterm_mod
  ,
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },{
    key = "k",
    mods = wezterm_mod
  ,
    action = wezterm.action.ActivatePaneDirection "Up",
  },{
    key = "j",
    mods = wezterm_mod
  ,
    action = wezterm.action.ActivatePaneDirection "Down",
  },{
    key = "h",
    mods = wezterm_mod
  ,
    action = wezterm.action.ActivatePaneDirection "Left",
  },{
    key = "l",
    mods = wezterm_mod
  ,
    action = wezterm.action.ActivatePaneDirection "Right",
  },{
    key = 'w',
    mods = wezterm_mod,
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },{
    key = 'z',
    mods = wezterm_mod,
    action = wezterm.action.ToggleFullScreen,
  },
}

return config

