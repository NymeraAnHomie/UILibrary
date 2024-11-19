local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/NymeraAnHomie/Library/refs/heads/main/Pandora/Source.lua')))()
local window = Library:Window({Name = "Example Hub"})
local pages = {["Combat"] = window:Page({Name = "Combat"}), ["Visuals"] = window:Page({Name = "Visuals"}), ["Settings"] = window:Page({Name = "Settings"})}

do
    local combatSection = pages["Combat"]:Section({Name = "Combat Features", LeftTitle = "Options", RightTitle = "Details"})
    combatSection:Toggle({Name = "Enable Aimbot", Flag = "aimbot_enabled"})
    combatSection:Slider({Name = "Aimbot Sensitivity", Flag = "aimbot_sensitivity", Default = 50, Maximum = 100, Minimum = 1, Decimals = 1, Suffix = "%"})
    combatSection:List({Name = "Target Part", Flag = "aimbot_target_part", Options = {"Head", "Torso", "Legs"}})
    combatSection:Toggle({Name = "Enable Triggerbot", Flag = "triggerbot_enabled"})
    combatSection:Slider({Name = "Triggerbot Delay", Flag = "triggerbot_delay", Default = 100, Maximum = 1000, Minimum = 0, Suffix = "ms"})
end

do
    local visualsSection = pages["Visuals"]:Section({Name = "ESP", LeftTitle = "Player ESP", RightTitle = "Colors"})
    visualsSection:Toggle({Name = "Enable ESP", Flag = "esp_enabled"})
    visualsSection:Slider({Name = "ESP Distance", Flag = "esp_distance", Default = 500, Maximum = 5000, Minimum = 50, Suffix = "m"})
    visualsSection:Colorpicker({Name = "ESP Color", Flag = "esp_color", Default = Color3.fromRGB(255, 255, 255)})
end

-- // u can view the source to find a built in cfg system
do
    local settingsSection = pages["Settings"]:Section({Name = "Configuration", LeftTitle = "Config", RightTitle = "UI"})
    settingsSection:Textbox({Name = "Config Name", Flag = "config_name"})
    settingsSection:Button({Name = "Save Config", Callback = function() print("Config saved") end})
    settingsSection:Button({Name = "Load Config", Callback = function() print("Config loaded") end})
    settingsSection:Keybind({Name = "Toggle Menu", Flag = "menu_key", Default = Enum.KeyCode.F, Callback = function(value) Library.UIKey = value end})
    settingsSection:Colorpicker({Name = "Accent Color", Flag = "menu_accent", Default = Library.Accent, Callback = function(value) Library:ChangeAccent(value) end})
end
