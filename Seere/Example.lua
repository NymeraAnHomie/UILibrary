-- buddy didnt even add decimals value in slider dat crazy so i gotta add it by ma self
getgenv().FolderName = "skibidi hook real"
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NymeraAnHomie/Library/refs/heads/main/Seere/Source.lua"))()

local Tab = library:addTab("Example Tab")
local Settings = library:addTab("Settings")

local ConfigGroup = Settings:createGroup("left", "Config Example")
local UIGroup = Settings:createGroup("center", "UI Example")
local Group = Tab:createGroup("left", "Example Group")

local togg = Group:addToggle({text = "Toggle Example", default = false, flag = "example_toggle"})
Group:addButton({text = "Button Example", callback = function() 
	print("Button clicked")
end})
Group:addTextbox({text = "Textbox Example", flag = "example_textbox"})
Group:addSlider({text = "Slider Example", ontop = true, flag = "example_slider", min = 0, max = 100, increment = 0.01, value = 50}, "suffix")
Group:addKeybind({flag = "example_keybind", key = Enum.KeyCode.F}) -- work for toggle too like colorpicker
Group:addList({text = "List Example", multiselect = true, flag = "example_list", values = {"Option 1", "Option 2"}, value = "Option 1"})
togg:addColorpicker({text = "Colorpicker Example", flag = "example_colorpicker", color = Color3.new(1, 1, 1)})

ConfigGroup:addConfigbox({flag = "config_box", values = {}})
ConfigGroup:addTextbox({text = "Config Name", flag = "config_name"})
ConfigGroup:addButton({text = "Save Config", callback = library.saveConfig})
ConfigGroup:addButton({text = "Load Config", callback = library.loadConfig})
ConfigGroup:addButton({text = "Delete Config", callback = library.deleteConfig})
ConfigGroup:addButton({text = "Refresh Configs", callback = library.refreshConfigs})

UIGroup:addColorpicker({text = "Menu Accent", flag = "menu_accent", color = library.libColor, callback = function(v)
    library.libColor = v
end})
