local wezterm = require 'wezterm'
local act = wezterm.action

-- Configuration table
local config = {}

-- Use config builder if available (newer versions)
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Import the theme from neapsix/wezterm
-- Import rose-pine.lua file to C:\Users\Admin\.config\wezterm\lua
-- Shorcut Target "C:\Program Files\WezTerm\wezterm-gui.exe" start -- wsl.exe --cd /mnt/c
local theme = require('lua/rose-pine').main
config.colors = theme.colors()
-- REMOVE ALL "config.colors" PARAMETERS FOR THIS TO WORK!!
--config.color_scheme = 'The Hulk'

-- Make ANSI colors more vibrant
config.colors.ansi = {
  '#000000', -- Black (unchanged)
  '#FF5555', -- Bright Red (was probably more muted)
  '#50FA7B', -- Bright Green
  '#F1FA8C', -- Bright Yellow
  '#BD93F9', -- Bright Purple/Blue
  '#FF79C6', -- Bright Pink/Magenta
  '#8BE9FD', -- Bright Cyan
  '#F8F8F2', -- Bright White
}

-- Make bright ANSI colors even more vibrant
config.colors.brights = {
  '#6272A4', -- Bright Black (gray)
  '#FF6E6E', -- Bright Red
  '#69FF94', -- Bright Green
  '#FFFFA5', -- Bright Yellow
  '#D6ACFF', -- Bright Blue
  '#FF92DF', -- Bright Magenta
  '#A4FFFF', -- Bright Cyan
  '#FFFFFF', -- Bright White
}

-- Scrollbar color override (without affecting theme)
config.colors.scrollbar_thumb = "#dc74bc"

-- General settings
config.check_for_updates = true
config.automatically_reload_config = true
config.exit_behavior = 'CloseOnCleanExit'
config.window_close_confirmation = 'NeverPrompt'
config.scrollback_lines = 10000
config.enable_scroll_bar = false

-- Appearance settings
config.font = wezterm.font_with_fallback({
  {
    family = 'FiraCode Nerd Font Ret',
    weight = 'Regular',
    harfbuzz_features = {'calt=1', 'clig=1', 'liga=1'},
  },
  'FiraCode Nerd Font Sembd',
})

-- Background Image Configuration
--config.background = {
--  {
--    source = {
--      -- IMPORTANT: Replace this with the full path to your image file.
--      -- Use forward slashes, e.g., "C:/Users/Admin/Pictures/my-background.png"
--      File = "C:/Users/Admin/Downloads/sk.png",
--    },
--    -- Controls the transparency of the image. 0.0 is fully transparent, 1.0 is fully opaque.
--    opacity = 0.90,
--    -- Dims the image to 30% of its original brightness to make text more readable.
--    hsb = {
--      brightness = 0.1,
--    },
--  },
--}

-- Background Image Configuration (moving)
--local dimmer = { brightness = 0.040 }
--config.background = {
--  -- This is the deepest/back-most layer. It will be rendered first
--  {
--    source = {
--      File = 'C:/Users/Admin/Downloads/sk.png',
--    },
--    -- The texture tiles vertically but not horizontally.
--    -- When we repeat it, mirror it so that it appears "more seamless".
--    -- An alternative to this is to set `width = "100%"` and have
--    -- it stretch across the display
--    repeat_x = 'Mirror',
--    hsb = dimmer,
--    -- When the viewport scrolls, move this layer 10% of the number of
--    -- pixels moved by the main viewport. This makes it appear to be
--    -- further behind the text.
--    attachment = { Parallax = 0.1 },
--  },
--  -- Subsequent layers are rendered over the top of each other
--  {
--    source = {
--      File = 'C:/Users/Admin/Downloads/sk.png',
--    },
--    width = '100%',
--    repeat_x = 'NoRepeat',
--
--    -- position the spins starting at the bottom, and repeating every
--    -- two screens.
--    vertical_align = 'Bottom',
--    repeat_y_size = '200%',
--    hsb = dimmer,
--
--    -- The parallax factor is higher than the background layer, so this
--    -- one will appear to be closer when we scroll
--    attachment = { Parallax = 0.2 },
--  },
--  {
--    source = {
--      File = 'C:/Users/Admin/Downloads/sk.pngg',
--    },
--    width = '100%',
--    repeat_x = 'NoRepeat',
--
--    -- start at 10% of the screen and repeat every 2 screens
--    vertical_offset = '10%',
--    repeat_y_size = '200%',
--    hsb = dimmer,
--    attachment = { Parallax = 0.3 },
--  },
--  {
--    source = {
--      File = 'C:/Users/Admin/Downloads/sk.png',
--    },
--    width = '100%',
--    repeat_x = 'NoRepeat',
--
--    vertical_offset = '30%',
--    repeat_y_size = '200%',
--    hsb = dimmer,
--    attachment = { Parallax = 0.4 },
--  },
--  {
--    source = {
--      File = 'C:/Users/Admin/Downloads/sk.png',
--    },
--    width = '100%',
--    repeat_x = 'NoRepeat',
--
--    vertical_offset = '50%',
--    repeat_y_size = '150%',
--    hsb = dimmer,
--    attachment = { Parallax = 0.5 },
--  },
--}

config.font_size = 12.5
config.line_height = 1.0
config.cell_width = 1.0
config.initial_cols = 70 -- Width
config.initial_rows = 22 -- Height
config.window_background_opacity = 0.94
config.text_background_opacity = 1.0
config.integrated_title_button_style = 'Windows'
config.integrated_title_button_color = 'Auto'
config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 0.8,
}

-- Border Padding
config.window_padding = {
  left = 15,
  right = 15,
  top = 15,
  bottom = 15,
}

  -- Adjust Window Frame
config.window_frame = {
  border_left_width = '1px',
  border_right_width = '1px',
  border_bottom_height = '1px',
  border_top_height = '1px',
  border_left_color = '#a5427b',    -- Pink border (matches cursor)
  border_right_color = '#a5427b',   -- Pink border (matches cursor)
  border_bottom_color = '#a5427b',  -- Pink border (matches cursor)
  border_top_color = '#a5427b',     -- Pink border (matches cursor)
  
  -- Add these to preserve tab bar styling
  font = wezterm.font { family = 'Hack Nerd Font', weight = 'DemiBold' },
  font_size = 10.0,
  active_titlebar_bg = '#161821',
  inactive_titlebar_bg = '#161821',
}

-- Hide the title bar
config.window_decorations = "NONE"
  
-- Color overrides to make text brighter and more vibrant
config.colors.foreground = '#FFFFFF' -- Brighter white text

-- Cursor color settings
config.colors.cursor_bg = '#FF79C6' -- Background color of the cursor (bright pink)
config.colors.cursor_fg = '#ffffff' -- Text color when cursor is on a character
config.colors.cursor_border = '#FF79C6' -- Border color of the cursor

-- Tab bar colors (Vibrant Pink Candy Theme - Final)
config.colors.tab_bar = {
  -- The overall background of the tab bar area.
  background = '#191724',

  -- === ACTIVE TAB ===
  active_tab = {
    bg_color = '#dc74bc', -- The main vibrant pink
	fg_color = '#171717', -- Keep dark text
    intensity = 'Bold',
	italic = true,
  },
  -- === INACTIVE TABS ===
  inactive_tab = {
    bg_color = '#6d2d57', -- A brighter, but still muted, dark pink
    fg_color = '#a9a9a9', -- Soft, light text color
  },
  -- How an inactive tab looks when you hover over it.
  inactive_tab_hover = {
    bg_color = '#aa4c8d', -- An even brighter pink for hover feedback
    fg_color = '#eaeaea', -- Fully white text on hover
    italic = true,
  },

  -- === NEW TAB BUTTON (+) ===
  new_tab = {
    bg_color = '#191724',
    fg_color = '#dc74bc',
  },
  -- The new tab button hover state.
  new_tab_hover = {
    bg_color = '#e86dc2', -- The very bright pink for the '+' hover effect
    fg_color = '#191724', -- Dark text for contrast
  },
}

-- Tab bar settings
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.tab_max_width = 25
config.show_tab_index_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

-- Cursor settings
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 500
config.cursor_thickness = 8
config.cursor_blink_ease_in = 'Linear'
config.cursor_blink_ease_out = 'Linear'

-- Performance settings
config.front_end = 'WebGpu'  -- Use WebGpu for better performance
config.webgpu_power_preference = 'HighPerformance'
config.animation_fps = 60
config.max_fps = 120
config.enable_wayland = false
config.enable_kitty_graphics = true
config.enable_csi_u_key_encoding = true
config.use_ime = true
config.adjust_window_size_when_changing_font_size = true

-- Check updates every 24 hours
config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

-- Create a comprehensive launch menu with different options
config.launch_menu = {
  -- WSL options
  {
    label = 'WSL: Home',
    args = {'wsl.exe'},
  },
  {
    label = 'WSL: Projects',
    args = {'wsl.exe', '--cd', '~/projects'},
  },
  {
    label = 'WSL: Code',
    args = {'wsl.exe', '--cd', '~/code'},
  },
  {
    label = 'WSL: Root',
    args = {'wsl.exe', '--cd', '/'},
  },
  
  -- Windows options - these DO NOT use domain and specify args directly
  {
    label = 'PowerShell: Home',
    args = {'powershell.exe', '-NoLogo'},
  },
  {
    label = 'PowerShell: Documents',
    args = {'pwsh.exe', '-NoLogo'},
    cwd = wezterm.home_dir .. '\\Documents',
  },
  {
    label = 'PowerShell: Downloads',
    args = {'pwsh.exe', '-NoLogo'},
    cwd = wezterm.home_dir .. '\\Downloads',
  },
  {
    label = 'PowerShell: Desktop',
    args = {'pwsh.exe', '-NoLogo'},
    cwd = wezterm.home_dir .. '\\Desktop',
  },
  {
    label = 'PowerShell: C Drive',
    args = {'pwsh.exe', '-NoLogo'},
    cwd = 'C:\\',
  },
  {
    label = 'CMD: Home',
    args = {'cmd.exe'},
  },
  {
    label = 'Git Bash: Home',
    args = {'C:\\Program Files\\Git\\bin\\bash.exe', '-l'},
  },
}

-- Key bindings
config.disable_default_key_bindings = false
config.keys = {
  -- Split panes with WSL and send a clear command immediately after
  { key = '|', mods = 'CTRL|SHIFT', action = wezterm.action_callback(function(window, pane)
    -- First split the pane
    window:perform_action(
      act.SplitPane {
        direction = 'Right',
        command = { args = {'wsl.exe'} },
      },
      pane
    )
    
    -- Wait a moment for the pane to initialize
    wezterm.sleep_ms(100)
    
    -- Send the clear command
    window:active_pane():send_text("clear\n")
  end)},

  { key = '_', mods = 'CTRL|SHIFT', action = wezterm.action_callback(function(window, pane)
    -- First split the pane
    window:perform_action(
      act.SplitPane {
        direction = 'Down',
        command = { args = {'wsl.exe'} },
      },
      pane
    )
    
    -- Wait a moment for the pane to initialize
    wezterm.sleep_ms(100)
    
    -- Send the clear command
    window:active_pane():send_text("clear\n")
  end)},

  -- Close current pane
  { key = 'x', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane { confirm = false } },
  
  -- Navigate between panes
  { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down' },
  
  -- Resize panes
  { key = 'LeftArrow', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Left', 5 } },
  { key = 'RightArrow', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Right', 5 } },
  { key = 'UpArrow', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Up', 5 } },
  { key = 'DownArrow', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Down', 5 } },
  
  -- Tabs with WSL
  { key = 't', mods = 'CTRL', action = act.SpawnCommandInNewTab { args = {'wsl.exe'} } },
  { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab { confirm = false } },
  
  -- Font size
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
  { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  
  -- Clipboard
  { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
  
  -- Quick select mode
  { key = 'f', mods = 'CTRL|SHIFT', action = act.Search { CaseSensitiveString = '' } },
  
  -- Launcher menu
  { key = 'l', mods = 'CTRL|SHIFT', action = act.ShowLauncherArgs { flags = 'FUZZY|LAUNCH_MENU_ITEMS' } },
  
  -- WINDOW CONTROL SHORTCUTS
  { key = 'q', mods = 'CTRL|SHIFT', action = act.QuitApplication },
  { key = 'm', mods = 'CTRL|SHIFT', action = act.Hide },
  { key = 'n', mods = 'CTRL|SHIFT', action = wezterm.action.ToggleFullScreen },
  
    -- Run the 'fish' command with Ctrl+E
  {
    key = 'e',
    mods = 'CTRL',
    action = wezterm.action.SendString 'fish\n',
  },

}

-- Mouse bindings
config.mouse_bindings = {
  -- Right click paste
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = act.PasteFrom 'Clipboard',
  },
  -- Select text with double-click
  {
    event = { Down = { streak = 2, button = 'Left' } },
    mods = 'NONE',
    action = act.SelectTextAtMouseCursor 'Word',
  },
  -- Select line with triple-click
  {
    event = { Down = { streak = 3, button = 'Left' } },
    mods = 'NONE',
    action = act.SelectTextAtMouseCursor 'Line',
  },
}

-- Disable confirmation for tab close button
wezterm.on('mux-is-process-stateful', function(domain, pane)
  -- Always return false to indicate no confirmation needed
  return false
end)

-- Override the new tab button behavior to open WSL
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  -- This ensures the tab title is formatted correctly
  return tab.active_pane.title
end)

-- Make the new tab button spawn WSL tabs on left click, show launcher on right click
wezterm.on('new-tab-button-click', function(window, pane, button, default_action)
  -- Check which mouse button was clicked
  if button == "Left" then
    -- Left click: spawn a WSL tab
    window:perform_action(
      act.SpawnCommandInNewTab { args = {'wsl.exe'} },
      pane
    )
    return false -- prevent the default action
  end
end)


-- Add a visual exit button indicator in the status bar
wezterm.on('update-right-status', function(window, pane)
  local hostname = wezterm.hostname()

  
  -- Create a status with hostname, date, and exit button
  local elements = {
    { Foreground = { Color = '#b7f070' } },
    { Text = ' ' .. hostname .. ' ' },
    { Foreground = { Color = '#F8F8F2' } },
  }
  
  window:set_right_status(wezterm.format(elements))
end)

-- Return the configuration
return config
