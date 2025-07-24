local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NymeraAnHomie/UILibrary/refs/heads/main/BitchbotV3/Source.lua"))()
local Window = Library:Window({
	Name = "(panichook11, nomercy.rip, fijihook.fun, desktopware, templehook, pulse, brick heck ui services)",
	Size = UDim2.new(0, 500, 0, 400),
})

local MainTab = Window:Tab({ Name = "Main" })
local CombatTab = Window:Tab({ Name = "Combat" })
local VisualsTab = Window:Tab({ Name = "Visuals" })

local FarmSection = MainTab:Section({ Name = "Auto Farm", Side = "Left" })
local PlayerSection = MainTab:Section({ Name = "Player", Side = "Right" })

local AutoFarmToggle = FarmSection:Toggle({
	Name = "Auto Farm",
	Default = false,
	Flag = "AutoFarm",
	Callback = function(value)
		print("Auto Farm:", value)
	end,
})

local ESPColorPicker = AutoFarmToggle:Colorpicker({
	Name = "ESP Color",
	Flag = "ESPColor",
	Color = Color3.fromRGB(0, 255, 0),
	Alpha = 0.8,
})

local FarmKeybind = AutoFarmToggle:Keybind({
	Name = "Farm Key",
	Key = Enum.KeyCode.F,
	Mode = "Toggle",
	Flag = "FarmKeybind",
})

local FarmColor = AutoFarmToggle:Colorpicker({
	Name = "Farm Color",
	Default = Color3.fromRGB(0, 255, 0),
	Flag = "FarmColor",
})

local WalkSpeedSlider = PlayerSection:Slider({
	Name = "Walk Speed",
	Min = 16,
	Max = 100,
	Default = 16,
	Decimal = 1,
	Suffix = " speed",
	Flag = "WalkSpeed",
	Callback = function(value)
		if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
		end
	end,
})

local ColorPicker = PlayerSection:Colorpicker({
	Name = "ESP Color",
	Flag = "ESPColor",
	Color = Color3.fromRGB(255, 0, 0),
	Alpha = 0.5,
	Callback = function(color, alpha)
		print("Color changed to:", color)
		print("Alpha:", alpha)
	end,
})

local WeaponDropdown = CombatTab:Section({ Name = "Weapons", Side = "Left" }):Dropdown({
	Name = "Select Weapon",
	Options = { "Sword", "Gun", "Bow", "Magic" },
	Default = "Sword",
	Flag = "SelectedWeapon",
	Callback = function(option)
		print("Selected weapon:", option)
	end,
})

local PlayerNameBox = PlayerSection:Textbox({
	Name = "Target Player",
	PlaceHolder = "Enter player name...",
	Default = "",
	Flag = "TargetPlayer",
	Callback = function(text)
		print("Target player:", text)
	end,
})

local TeleportButton = PlayerSection:Button({
	Name = "Teleport to Player",
	Callback = function()
		local targetName = Library.Flags.TargetPlayer
		local targetPlayer = game.Players:FindFirstChild(targetName)
		if targetPlayer and targetPlayer.Character then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
		else
			print("Player not found!")
		end
	end,
})

local InfoLabel = FarmSection:Label({ Name = "Status: Ready" })

local ESPToggle = VisualsTab:Section({ Name = "ESP", Side = "Left" }):Toggle({
	Name = "ESP Settings",
	Default = false,
	Folding = true,
	Flag = "ESPMain",
	Callback = function(value)
		print("ESP Main:", value)
	end,
})

local PlayerESP = ESPToggle:Toggle({
	Name = "Player ESP",
	Default = false,
	Flag = "PlayerESP",
})

local ItemESP = ESPToggle:Toggle({
	Name = "Item ESP",
	Default = false,
	Flag = "ItemESP",
})

local PlayerListTab = Window:Tab({ Name = "Players" })
local PlayerList = PlayerListTab:PlayerList()

Library:Configs(Window)

spawn(function()
	while wait(1) do
		if Library.Flags.AutoFarm then
			InfoLabel.Set("Status: Farming...")
		else
			InfoLabel.Set("Status: Ready")
		end
	end
end)

print("Current walk speed:", Library.Flags.WalkSpeed)
print("Auto farm enabled:", Library.Flags.AutoFarm)
