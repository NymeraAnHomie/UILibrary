--// u can use flags Library.Flags or smt

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NymeraAnHomie/Library/refs/heads/main/Bitchbot/Source.lua"))()

local Window = Library:Window({Name = "Example Window", Size = Vector2.new(450, 450)})
local Combat = Window:Page({Name = "Combat"})
local Visual = Window:Page({Name = "Visual"})
local Aimbot, Misc = Combat:MultiSection({Sections = {"Aimbot", "Misc"}, Zindex = 5, Side = "Left", Size = 315})
local Exploits, Resolver = Combat:MultiSection({Sections = {"Exploits", "Resolver"}, Zindex = 5, Side = "Right", Size = 315})

local Toggle = Aimbot:Toggle({Name = "Enable", Risk = false, Callback = function(v)
    print("[cb]: you have set the toggle to " .. v .. ".")
end})
Toggle:Colorpicker({Name = "Color", Default = Color3.fromRGB(255, 255, 255), Callback = function(v)
	print("[cb]: You have set the toggle color to" .. v .. ".")
end})
Aimbot:Button({Name = "Button", Callback = function()
    print("[cb]: You have called a button.")
end})
Aimbot:List({Name = "Hit Priority", Options = {
	"HumanoidRootPart",
	"UpperTorso",
	"LowerTorso",
	"Head"
}, Default = "HumanoidRootPart", Callback = function(v)
    print("[cb]: Aim part set to " .. v .. ".")
end})
Aimbot:Textbox({Name = "Vertical", Default = "0.14", Callback = function(v)
    print("[cb]: Horizontal Vertical set to " .. v .. ".")
end})
Aimbot:Textbox({Name = "Horizontal", Default = "0.14", Callback = function(v)
    print("[cb]: Horizontal prediction set to " .. v .. ".")
end})
Aimbot:Slider({Name = "Hit Chance", Default = 10, Min = 0, Max = 100, Decimals = 0.01})
