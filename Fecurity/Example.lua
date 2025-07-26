local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NymeraAnHomie/UILibrary/refs/heads/main/Fecurity/Source.lua"))() 

local Window = Library:window({
	name = "Farm Hub",
	size = UDim2.new(0, 600, 0, 450),
})

local MainTab = Window:tab({ name = "Main", icon = "rbxassetid://139765537381996" })
local CombatTab = Window:tab({ name = "Combat", icon = "rbxassetid://139765537381996" })
local VisualsTab = Window:tab({ name = "Visuals", icon = "rbxassetid://139765537381996" })

local FarmSection = MainTab:section({ name = "Auto Farm", side = "left" })
local PlayerSection = MainTab:section({ name = "Player", side = "right" })
local CombatSection = CombatTab:section({ name = "Combat", side = "left" })
local ESPSection = VisualsTab:section({ name = "ESP", side = "left" })

local AutoFarmToggle = FarmSection:toggle({
	name = "Auto Farm",
	default = false,
	flag = "AutoFarm",
	callback = function(value)
		print("Auto Farm:", value)
	end,
})

local FarmSpeedSlider = FarmSection:slider({
	name = "Farm Speed",
	min = 1,
	max = 10,
	default = 5,
	flag = "FarmSpeed",
	suffix = "x",
	callback = function(value)
		print("Farm Speed:", value)
	end,
})

local WalkSpeedSlider = PlayerSection:slider({
	name = "Walk Speed",
	min = 16,
	max = 100,
	default = 16,
	flag = "WalkSpeed",
	suffix = " speed",
	callback = function(value)
		if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
		end
	end,
})

local JumpPowerSlider = PlayerSection:slider({
	name = "Jump Power",
	min = 50,
	max = 200,
	default = 50,
	flag = "JumpPower",
	callback = function(value)
		if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
		end
	end,
})

local TargetTextbox = CombatSection:textbox({
	name = "Target Player",
	placeholder = "Enter player name...",
	default = "",
	flag = "TargetPlayer",
})

local KillAuraToggle = CombatSection:toggle({
	name = "Kill Aura",
	default = false,
	flag = "KillAura",
	callback = function(value)
		print("Kill Aura:", value)
	end,
})

local KillAuraKeybind = KillAuraToggle:keybind({
	name = "Kill Aura Key",
	key = Enum.KeyCode.F,
	mode = "Toggle",
	flag = "KillAuraKey",
})

local PlayerESPToggle = ESPSection:toggle({
	name = "Player ESP",
	default = false,
	flag = "PlayerESP",
	callback = function(value)
		print("Player ESP:", value)
	end,
})

local ESPColorPicker = PlayerESPToggle:colorpicker({
	name = "ESP Color",
	color = Color3.fromRGB(255, 0, 0),
	alpha = 0.5,
	flag = "ESPColor",
	callback = function(color, alpha)
		print("ESP Color changed to:", color, "Alpha:", alpha)
	end,
})

local TeleportButton = PlayerSection:button({
	name = "Teleport to Target",
	callback = function()
		local targetName = Library.flags.TargetPlayer
		if targetName and targetName ~= "" then
			local targetPlayer = game.Players:FindFirstChild(targetName)
			if targetPlayer and targetPlayer.Character then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
					targetPlayer.Character.HumanoidRootPart.CFrame
				Library.notifications:create_notification({ name = "Teleported to " .. targetName })
			else
				Library.notifications:create_notification({ name = "Player not found!" })
			end
		end
	end,
})

local WeaponDropdown = CombatSection:dropdown({
	name = "Select Weapon",
	items = { "Sword", "Gun", "Bow", "Magic" },
	default = "Sword",
	flag = "SelectedWeapon",
	callback = function(option)
		print("Selected weapon:", option)
	end,
})

Library.notifications:create_notification({ name = "Script loaded successfully!" })
