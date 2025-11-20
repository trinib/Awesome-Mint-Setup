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
-- Add to cursor settings section
config.force_reverse_video_cursor = false
config.colors.cursor_bg = '#FF79C6'
config.colors.cursor_fg = '#FFF833'
config.colors.cursor_border = '#FF1493'  -- Hot pink border

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
----------------------------------
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

-- Add shadow effect (simulate glow)
--config.window_background_gradient = {
--    colors = { '#191724', '#272538', '#261924', '#1F1B1F' },
--    orientation = 'Vertical',
--}

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

----------------------------------
-- launch menu with different options
config.launch_menu = {
  -- WSL options
  {
    label = 'WSL: Home',
    args = {'wsl.exe', '--cd', '/home/trinib'},
  },
  {
    label = 'WSL: Admin',
    args = {'wsl.exe'},
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
    label = 'PowerShell7: Home',
    args = {"C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo"},
  },
  {
    label = 'PowerShell7: Documents',
    args = {"C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo"},
    cwd = wezterm.home_dir .. '\\Documents',
  },
  {
    label = 'PowerShell7: Downloads',
    args = {"C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo"},
    cwd = wezterm.home_dir .. '\\Downloads',
  },
  {
    label = 'PowerShell7: Desktop',
    args = {"C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo"},
    cwd = wezterm.home_dir .. '\\Desktop',
  },
  {
    label = 'PowerShell7: C Drive',
    args = {"C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo"},
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
  {
    label = "SSH: VS",
    args = {"ssh", "root@142.11.236.29"},
  },
  {
    label = "SSH: Oracle",
    args = {"ssh", "-i", "~/.ssh/oraclessh", "ubuntu@150.136.37.234"},
  },
}
----------------------------------
-- Key bindings
config.disable_default_key_bindings = false
config.keys = {
  -- Split panes with WSL and send a clear command immediately after
  { key = '}', mods = 'CTRL|SHIFT', action = wezterm.action_callback(function(window, pane)
    -- First split the pane
    window:perform_action(
      act.SplitPane {
        direction = 'Right',
        command = { args = {'wsl.exe', '--cd', '/home/trinib'}, },
      },
      pane
    )
    
    -- Wait a moment for the pane to initialize
    wezterm.sleep_ms(100)
    
    -- Send the clear command
    window:active_pane():send_text("clear\n")
  end)},
  
  -- Split panes down
  { key = '"', mods = 'CTRL|SHIFT', action = wezterm.action_callback(function(window, pane)
    -- First split the pane
    window:perform_action(
      act.SplitPane {
        direction = 'Down',
        command = { args = {'wsl.exe', '--cd', '/home/trinib'}, },
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
  { key = 's', mods = 'CTRL|SHIFT', action = act.Search { CaseSensitiveString = '' } },
  
  -- Launcher menu
  { key = 'l', mods = 'CTRL|SHIFT', action = act.ShowLauncherArgs { flags = 'FUZZY|LAUNCH_MENU_ITEMS' } },
  
  -- WINDOW CONTROL SHORTCUTS
  { key = 'q', mods = 'CTRL|SHIFT', action = act.QuitApplication },
  { key = 'm', mods = 'CTRL|SHIFT', action = act.Hide },
  { key = 'f', mods = 'CTRL|SHIFT', action = wezterm.action.ToggleFullScreen },
  
    -- Run the 'fish' command with Ctrl+E
  {
    key = 'e',
    mods = 'CTRL',
    action = wezterm.action.SendString 'fish\n',
  },
  
  -- Animated Background Opacity Toggle
  { key = 'o', mods = 'CTRL|SHIFT', action = wezterm.action_callback(function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.window_background_opacity then
        overrides.window_background_opacity = 0.7
    else
        if overrides.window_background_opacity == 0.7 then
            overrides.window_background_opacity = 0.94
        else
            overrides.window_background_opacity = 0.7
        end
    end
    window:set_config_overrides(overrides)
end)},

 --Quick Directory Jumper
{ key = '1', mods = 'CTRL|ALT', action = act.SpawnCommandInNewTab { 
    args = {'wsl.exe', '--cd', '/home/trinib/projects'} 
}},
{ key = '2', mods = 'CTRL|ALT', action = act.SpawnCommandInNewTab { 
    args = {"C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo"} 
}},

-- Add these for Chrome-like tab switching
{ key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
{ key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },

-- Jump to specific tabs
{ key = '1', mods = 'ALT', action = act.ActivateTab(0) },
{ key = '2', mods = 'ALT', action = act.ActivateTab(1) },
{ key = '3', mods = 'ALT', action = act.ActivateTab(2) },
{ key = '4', mods = 'ALT', action = act.ActivateTab(3) },

-- Tab Move/Reorder
{ key = '{', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(-1) },
{ key = '}', mods = 'SHIFT|ALT', action = act.MoveTabRelative(1) },

--Better Scrolling
{ key = 'k', mods = 'CTRL|SHIFT', action = act.ScrollByPage(-0.5) },
{ key = 'j', mods = 'CTRL|SHIFT', action = act.ScrollByPage(0.5) },
{ key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
{ key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },

--Rename Current Tab
{ key = 'r', mods = 'CTRL|SHIFT', action = act.PromptInputLine {
    description = 'Enter new name for tab',
    action = wezterm.action_callback(function(window, pane, line)
        if line then
            window:active_tab():set_title(line)
        end
    end),
}},

}

----------------------------------
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

----------------------------------
-- Disable confirmation for tab close button
wezterm.on('mux-is-process-stateful', function(domain, pane)
  -- Always return false to indicate no confirmation needed
  return false
end)

----------------------------------
-- Override the new tab button behavior to open WSL
--wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
--  -- This ensures the tab title is formatted correctly
--  return tab.active_pane.title
--end)

----------------------------------------------------------
-- Show icon and name on tabs
--wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
--  local process_name = tab.active_pane.foreground_process_name or ""
--  local icon, text, icon_color
--
--  -- Match based on process name (case-insensitive)
--  if process_name:match("wsl") then
--    icon = "🐧"
--    text = "WSL"
--    icon_color = "#7ECF17" -- green
--  elseif process_name:match("powershell") or process_name:match("pwsh") then
--    icon = "⚡"
--    text = "PowerShell"
--    icon_color = "#FFB86C" -- orange
--  elseif process_name:match("bash") then
--    icon = "🐚"
--    text = "Bash"
--    icon_color = "#8BE9FD" -- cyan
--  elseif process_name:match("cmd") then
--    icon = "💻"
--    text = "CMD"
--    icon_color = "#F1FA8C" -- yellow
--  else
--    icon = "💻"
--    text = "Shell"
--    icon_color = "#BD93F9" -- purple fallback
--  end
--
--  -- Tab colors
--  local bg, fg
--  if tab.is_active then
--    bg, fg = "#ff79c6", "#000000"  -- active tab background/text
--  elseif hover then
--    bg, fg = "#bd93f9", "#ffffff"  -- hovered tab
--  else
--    bg, fg = "#44475a", "#bfbfbf"  -- inactive tab
--  end
--
--  return {
--    { Background = { Color = bg } },
--    { Foreground = { Color = icon_color } },
--    { Text = " " .. icon .. " " },
--    { Foreground = { Color = fg } },
--    { Text = text .. " " },
--  }
--end)

-----------------------------------------------------------------
-- Show icons and path on tabs
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local process_name = tab.active_pane.foreground_process_name or ""
  local cwd_uri = tab.active_pane.current_working_dir
  local cwd = ""

  -- Extract folder name from URI (e.g. file:///home/user/project)
  if cwd_uri then
    cwd = cwd_uri.file_path or cwd_uri
    cwd = cwd:gsub("file://", "")
    cwd = cwd:gsub("%%20", " ")  -- decode spaces
    local home = os.getenv("HOME") or os.getenv("USERPROFILE")
    if home and cwd:find(home, 1, true) then
      cwd = cwd:gsub(home, "~") -- shorten home dir
    end
    -- Show only last folder name
    cwd = cwd:match("([^/\\]+)$") or cwd
  else
    cwd = "🔎"
  end
  
----------------------------------
  -- Determine icon and color based on process
  --Terminal / Shell Generic (copy and past in terminal to view)
-- 	  	  	  󰆍	  󰆍	  󰞷	  󰦪 	 󰨚	 󰩈	 󰅟	 
-- | Shell         | Icon  |
-- | ------------- | ----- |
-- | Bash          |      |
-- | Zsh           | 󱆃    |
-- | Fish          | 󰈺    |
-- | Nushell       | 󰯉    |
-- | PowerShell    | 󰨊    |
-- | CMD           |      |
-- | Korn / POSIX  |      |
-- | Shell Unknown |  /  |
-- 
-- | OS            | Icon  |
-- | ------------- | ----- |
-- | Windows       |  /  |
-- | macOS         |      |
-- | Generic Linux |      |
-- | Red Hat       |      |
-- | Ubuntu        |  /  |
-- | Debian        |      |
-- | Arch          |      |
-- | Fedora        |      |
-- | Alpine Linux  |      |
-- | Kali Linux    |      |
-- | Manjaro       |      |
-- | CentOS        |      |
-- | OpenSUSE      |      |
-- | Gentoo        |      |
-- | NixOS         |      |
-- | BSD (Generic) |  /  |
-- | Android Shell |      |
-- 
-- | Tool                 | Icon |
-- | -------------------- | ---- |
-- | Git Repo             |     |
-- | Git Branch           |     |
-- | Git Commit           |     |
-- | Code Workstation     |     |
-- | Editor Terminal Mode | 󰅩   |
-- | Debug Shell          |     |
-- | Python Venv          |     |
-- | Node CLI             |     |
-- | Rust CLI             |     |
-- | Go CLI               |     |
-- 
-- | Context      | Icon |
-- | ------------ | ---- |
-- | Docker       |     |
-- | Kubernetes   | 󱁢   |
-- | AWS CLI      |     |
-- | Azure Shell  | ﴱ    |
-- | Google Cloud |     |
-- | Remote SSH   | 󰣀   |
-- | VPN Tunnel   | 󰕥   |
-- | VM Guest     | 󰢹   |
-- 
-- | Meaning             | Icon |
-- | ------------------- | ---- |
-- | Root user / SU mode |     |
-- | Sudo Available      | 󰯃   |
-- | Elevated Shell      |     |
-- | Chroot              | 󰱅   |
-- | Virtual Environment |     |
-- | Script Execution    |     |
-- | System Monitor      |     |
-- 
-- | Context         | Icon  |
-- | --------------- | ----- |
-- | Home Directory  |  /  |
-- | Git Repo Folder |      |
-- | Media Folder    |      |
-- | Network Folder  | 󰌷    |
local icon, icon_color
if process_name:match("wsl") then
    icon = ""  -- Linux Tux icon
    icon_color = "#4AFF67"
elseif process_name:match("powershell") or process_name:match("pwsh") then
    icon = ""  -- Powershell Nerd Font icon
    icon_color = "#FFB86C"
elseif process_name:match("bash") then
    icon = ""  -- Bash shell Nerd Font icon
    icon_color = "#8BE9FD"
elseif process_name:match("cmd") then
    icon = ""  -- Command prompt Nerd Font icon
    icon_color = "#D0D400"
else
    icon = ""  -- Generic terminal
    icon_color = "#6363FF"
end

  -- Background / text color states
  local bg, fg
  if tab.is_active then
    bg, fg = "#ff79c6", "#000000"
  elseif hover then
    bg, fg = "#bd93f9", "#ffffff"
  else
    bg, fg = "#612E4A", "#bfbfbf"
  end

  -- Build final title
  return {
    { Background = { Color = bg } },
    { Foreground = { Color = icon_color } },
    { Text = " " .. icon .. " " },
    { Foreground = { Color = fg } },
    { Text = cwd .. " " },
  }
end)

----------------------------------
-- Make the new tab button spawn WSL tabs on left click, show launcher on right click
wezterm.on('new-tab-button-click', function(window, pane, button, default_action)
  -- Check which mouse button was clicked
  if button == "Left" then
    -- Left click: spawn a WSL tab
    window:perform_action(
      act.SpawnCommandInNewTab { args = {'wsl.exe', '--cd', '/home/trinib'} },
      pane
    )
    return false -- prevent the default action
  end
end)

----------------------------------
  -- 🌈 Gradient trail at top
local gradient_colors = {
  "#ff5555", "#ff79c6", "#bd93f9", "#50fa7b", "#f1fa8c", "#ffb86c", "#7989FF"
}

-- How fast to animate (seconds)
local frame_delay = 0.3  -- 20fps (lower = smoother, higher CPU)
local window_ref = nil

local function update_status()
  if not window_ref then return end
  local window = window_ref
  local hostname = wezterm.hostname()

  -- 🌈 Build gradient trail
  local trail = {}
  for _, c in ipairs(gradient_colors) do
    table.insert(trail, { Foreground = { Color = c } })
    table.insert(trail, { Text = "▋" })
  end

  -- Rotate colors
  table.insert(gradient_colors, 1, table.remove(gradient_colors))

  -- 🧠 Compose right-status
  local status = {
    { Foreground = { Color = '#b7f070' } },
    { Text = ' ' .. hostname .. '  ' },
  }
  for _, item in ipairs(trail) do
    table.insert(status, item)
  end

  window:set_right_status(wezterm.format(status))

  -- 🔁 Schedule next frame
  wezterm.time.call_after(frame_delay, update_status)
end

wezterm.on("update-right-status", function(window, _)
  if not window_ref then
    window_ref = window
    wezterm.time.call_after(frame_delay, update_status)
  end
end)
----------------------------

-- 🔔 Visual Bell (Silent Pink Flash)
config.visual_bell = {
  fade_in_duration_ms = 250,
  fade_out_duration_ms = 350,
  target = "BackgroundColor",
}

config.colors.visual_bell = "#7A3A5A"  -- bright pink flash

config.audible_bell = "Disabled"       -- 🚫 no sound
----------------------------------------------------------

-- Return the configuration
return config
