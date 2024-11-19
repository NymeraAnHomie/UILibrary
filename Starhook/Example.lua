local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NymeraAnHomie/Library/refs/heads/main/Starhook/Source.lua"))();
local ui = {
	window = nil,
	tabs = {}
}
local window = library:New({
    Size = UDim2.new(0, 600, 0, 500)
});
local flags = library.Flags
local watermark = library:Watermark({Name = ""});

window:Seperator({Name = "Star Hook UI Library"});
-- // for the logo you have to go the function window in the source and edit it

ui.tabs["legit"] = window:Page({
    Name = "Legit",
    Icon = "http://www.roblox.com/asset/?id=6023426921"
});

ui.tabs["world"] = window:Page({
    Name = "World",
    Icon = "http://www.roblox.com/asset/?id=6034684930"
});

ui.tabs["view"] = window:Page({
    Name = "View",
    Icon = "http://www.roblox.com/asset/?id=6031075931"
});

ui.tabs["movement"] = window:Page({
    Name = "Movement",
    Icon = "http://www.roblox.com/asset/?id=6034754445"
});

ui.tabs["anti_aim"] = window:Page({
    Name = "Anti Aim",
    Icon = "http://www.roblox.com/asset/?id=14760676189"
});

ui.tabs["settings"] = window:Page({
    Name = "Settings",
    Icon = "http://www.roblox.com/asset/?id=6031280882"
});

local section = ui.tabs["legit"]:Section({Name = "Settings", Side = "Left", Size = 420});

section:Toggle({Name = "Enabled", Flag = "feature_enabled"});
section:Colorpicker({
    Name = "Choose Color",
    Flag = "selected_color",
    Default = Color3.new(0, 1, 0)
});
section:Slider({
    Name = "Adjust Slider",
    Flag = "slider_value",
    Default = 50,
    Minimum = 0,
    Maximum = 100,
    Decimals = 1,
    Ending = "%"
});
section:Textbox({
    Name = "Enter Text",
    Flag = "text_input",
    Default = "",
    PlaceHolder = "Type here..."
});

game:GetService("RunService").Heartbeat:Connect(function()
    if flags["feature_enabled"] then
        print("Feature Enabled");
    end
    if flags["slider_value"] then
        print("Slider Value: " .. flags["slider_value"]);
    end
    if flags["text_input"] then
        print("User Input: " .. flags["text_input"]);
    end
end);
