-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Automatically configure WSL distributions
wezterm.default_wsl_domains()

-- This table will hold the configuration.
local config = {}
wezterm.default_wsl_domains()
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.default_cursor_style = 'BlinkingBar'
config.color_scheme = 'Monokai Vivid'
config.default_domain = 'WSL:Ubuntu'
-- and finally, return the configuration to wezterm
return config
