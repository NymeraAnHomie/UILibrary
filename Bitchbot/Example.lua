local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

if not Drawing then return end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NymeraAnHomie/Library/refs/heads/main/Bitchbot/Source.lua"))() do
	getgenv().Library, Utility, ESP, Flag = {}
	getgenv().Flag = Library.Flags -- why tf we cant use flag portal
	
	do
		local Passed, Statement = pcall(function()
			local Window = Library:Window({Name = "Example Window", Size = Vector2.new(450, 450)})
			local Combat = Window:Page({Name = "Combat"})
			local Visual = Window:Page({Name = "Visual"})
			local Aimbot, Misc = Combat:MultiSection({Sections = {"Aimbot", "Misc"}, Zindex = 5, Side = "Left", Size = 315})
			local Exploits, Resolver = Combat:MultiSection({Sections = {"Exploits", "Resolver"}, Zindex = 5, Side = "Right", Size = 315})
			
			local imsosigma = Aimbot:Toggle({Name = "Enable", Risk = false, Callback = function(v)
			    print("[cb]: you have set the toggle to " .. v .. ".")
			end})
			--imsosigma:Colorpicker({Default = Color3.fromRGB(255, 255, 255), Callback = function(v)
			--	print("[cb]: You have set the toggle color to" .. v .. ".")
            --end}) who ever fuck up colorpicker fuck u
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
		end)
	end
	
	do
		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Parent = game:GetService("CoreGui")
		ScreenGui.ResetOnSpawn = false
		ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		
		local Outline = Instance.new("ImageButton")
		Outline.Name = "Outline"
		Outline.AnchorPoint = Vector2.new(0.5, 0.5)
		Outline.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Outline.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Outline.Position = UDim2.new(1, -32, 0, 10)
		Outline.Size = UDim2.new(0, 50, 0, 50)
		Outline.AutoButtonColor = false
		Outline.Image = "rbxassetid://10709781919"
		Outline.ImageColor3 = Color3.fromRGB(255, 209, 220)
		Outline.ImageTransparency = 0 -- Ensure image is visible
		Outline.ZIndex = 2
		Outline.Parent = ScreenGui
		
		local Inline = Instance.new("Frame")
		Inline.Name = "Inline"
		Inline.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		Inline.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Inline.BorderSizePixel = 0
		Inline.Position = UDim2.new(0, 1, 0, 1)
		Inline.Size = UDim2.new(1, -2, 1, -2)
		Inline.ZIndex = 1
		Inline.Parent = Outline
		
		local Accent = Instance.new("Frame")
		Accent.Name = "Accent"
		Accent.BackgroundColor3 = Color3.fromRGB(255, 209, 220)
		Accent.BorderColor3 = Color3.fromRGB(20, 20, 20)
		Accent.BorderSizePixel = 0
		Accent.Position = UDim2.new(0, 0, 0, 0)
		Accent.Size = UDim2.new(1, 0, 0, 1.5)
		Accent.ZIndex = 1
		Accent.Parent = Inline
		
		local UIGradient = Instance.new("UIGradient")
		UIGradient.Name = "UIGradient"
		UIGradient.Color = ColorSequence.new({
		    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
		    ColorSequenceKeypoint.new(1, Color3.fromRGB(145, 145, 145)),
		})
		UIGradient.Rotation = 90
		UIGradient.Parent = Accent
		
		Outline.MouseButton1Click:Connect(function()
		    Library:SetOpen(not Library.Open)
		    if Library.Open then
		        Outline.Image = "rbxassetid://10709781919"
		    else
		        Outline.Image = "rbxassetid://10709782044"
		    end
		end)
	end
end
