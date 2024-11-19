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

window:Seperator({Name = "Star Hook UI Library"}); -- lmao i'm using this as a title you dont have to, but to use the seperator you can do this

--[[
    ui.tabs["legit"] = window:Page({Name = "TestTab1", Icon = "http://www.roblox.com/asset/?id=6023426921"});
    window:Seperator({Name = "Combat"});
    ui.tabs["combat"] = window:Page({Name = "TestCombatTab", Icon = "http://www.roblox.com/asset/?id=6023426921"}); -- Change the Icon btw.

    ---- StarHook uses the following ----
    http://www.roblox.com/asset/?id=6023426921 - Rage/Legit Icon
    http://www.roblox.com/asset/?id=6034684930 - World Icon
    http://www.roblox.com/asset/?id=6031075931 - View Icon
    http://www.roblox.com/asset/?id=6034754445 - Movement Icon
    http://www.roblox.com/asset/?id=14760676189 - Anti Aim Icon
    http://www.roblox.com/asset/?id=6031280882 - Settings Icon
]]--

ui.tabs["legit"] = window:Page({Name = "Test", Icon = "http://www.roblox.com/asset/?id=6023426921"});

local dbasdb = ui.tabs["legit"]:Section({Name = "Test", Side = "Left", Size = 420}); -- Section inside of the "legit" tab.

local main_toggle = dbasdb:Toggle({Name = "Enabled", Flag = "opritnaga"}); -- Toggle
-- To use the toggle, just do flags["opritnaga"]
dbasdb:Colorpicker({Name = "Example Color", Flag = "bee_beep_color", Default = Color3.new(0, 255, 0)}); -- Color example, you can change the default color to anything
-- To use the color picker you would just do flags["bee_beep_color"]
dbasdb:Slider({Name = "Slider Example", Flag = "this_is_a_slider", Default = 1, Minimum = 1, Maximum = 200, Decimals = 0.01, Ending = "%"}); -- Slider Example, you can change everything including the ending to really anything.
-- To use the slider you would just do flags["this_is_a_slider"]
dbasdb:Textbox({Name = "Prediction", Flag = "this_is_a_textbox", Default = "151", PlaceHolder = "Prediction"});
-- To use the Textbox you just need to do flags["this_is_a_textbox"]
local debugTextbox = dbasdb:Toggle({Name = "Debug Textbox", Flag = "debug_textBox"});
-- I think you get it.
game:GetService("RunService").Heartbeat:Connect(function ()
    if flags["opritnaga"] then
        print("hello this is enabled")
    end
    if flags["debug_textBox"] then
        print(flags["this_is_a_textbox"])
    end
end)
