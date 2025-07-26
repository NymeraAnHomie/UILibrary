-- documentation
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NymeraAnHomie/UILibrary/refs/heads/main/Atlanta/Source.lua"))()
local window = library:window({
	name = os.date("(panichook11, nomercy.rip, fijihook.fun, desktopware, templehook, pulse, brick heck ui services) - %b %d %Y"),
	size = UDim.new(0, 614, 0, 639),
})
local watermark = library:watermark({
	default = os.date("(panichook11, nomercy.rip, fijihook.fun, desktopware, templehook, pulse, brick heck ui services) - %b %d %Y - %H:%M:%S"),
})
local hex = Color3.fromHex
local Aimbot = window:tab({ name = "Aimbot" })
local Misc = window:tab({ name = "Misc" })
local Visuals = window:tab({ name = "Visuals" })
local Players = window:tab({ name = "Players" })
local Settings = window:tab({ name = "Settings" })

-- Aimbot
local column = Aimbot:column()
local selec, lock, assist = column:multi_section({
	names = { "Camlock", "Triggerbot" },
})

selec
	:toggle({
		name = "Enable camlock",
		flag = "target_selected",
		tooltip = "Manages selection of the target (both lock and aim assist)",
	})
	:keybind({
		name = "Camlock",
		flag = "target_selected_bind",
		callback = function(key)
			print("Locked")
		end,
	})
selec:dropdown({
	name = "Hit part",
	items = { "Head", "HumanoidRootPart", "LowerTorso", "Legs" },
	default = "Head",
	flag = "Camlock_HitPart",
	callback = function(text)
		print(text)
	end,
})
selec:slider({
	name = "Smoothness",
	min = 1,
	max = 100,
	default = 100,
	interval = 0.5,
	flag = "camlock_smoothness",
	callback = function(value)
		print(value)
	end,
})
selec:slider({
	name = "Prediction",
	min = 1,
	max = 10,
	default = 10,
	interval = 1,
	flag = "Preditcion_Triggerbot",
	suffix = " PTS",
	callback = function(value)
		print(value)
	end,
})
selec
	:toggle({
		name = "Show FOV",
		flag = "FOV_enambled",
		tooltip = "shows your FOV",
	})
	:colorpicker({
		name = "FOV color fill",
		flag = "FOV_color",
		color = hex("#7D0DC3"),
		callback = function(selectedColor)
			print("FOV color fill:", selectedColor)
		end,
	})
	:colorpicker({
		name = "FOV color outline",
		flag = "FOV_color_outline",
		color = hex("#7D0DC3"),
		callback = function(selectedColor)
			print("FOV color outline:", selectedColor)
		end,
	})

selec:slider({
	name = "FOV",
	min = 1,
	max = 500,
	default = 100,
	interval = 1,
	flag = "FOV_size_triggerbot",
	callback = function(value)
		print(value)
	end,
})
-- TRiggerbot
lock:toggle({
	name = "Enable Triggerbot",
	flag = "target_selected",
	tooltip = "Autoshoots if your crosshair is on the target",
}):keybind({
	name = "Triggerbot",
	flag = "Triggerbot_Key",
	callback = function(key)
		print(key)
	end,
})
lock:slider({
	name = "Hit chance ",
	min = 1,
	max = 100,
	default = 100,
	interval = 1,
	flag = "Hit_Chance_Triggerbot",
	suffix = "%",
	callback = function(value)
		print(value)
	end,
})

lock:slider({
	name = "Prediction",
	min = 1,
	max = 10,
	default = 10,
	interval = 1,
	flag = "Preditcion_Triggerbot",
	suffix = " PTS",
	callback = function(value)
		print(value)
	end,
})

lock:toggle({
	name = "Show FOV",
	flag = "FOV_enambled",
	tooltip = "shows your FOV",
})
	:colorpicker({
		name = "FOV color fill",
		flag = "FOV_color",
		color = hex("#7D0DC3"),
		callback = function(selectedColor)
			print("FOV color fill:", selectedColor)
		end,
	})
	:colorpicker({
		name = "FOV color outline",
		flag = "FOV_color_outline",
		color = hex("#7D0DC3"),
		callback = function(selectedColor)
			print("FOV color outline:", selectedColor)
		end,
	})

lock:slider({
	name = "FOV",
	min = 1,
	max = 500,
	default = 100,
	interval = 1,
	flag = "FOV_size_triggerbot",
	callback = function(value)
		print(value)
	end,
})

local column = Aimbot:column()
local targetvis, other = column:multi_section({
	names = { "Target visuals", "Anti-Aim" },
})

--

-- Players
local column = Players:column()
local section = column:section({ name = "Playerlist" })
local playerlist = section:playerlist({})
section:dropdown({
	name = "Priority",
	items = { "Enemy", "Priority", "Neutral", "Friendly" },
	default = "Neutral",
	flag = "PLAYERLIST_DROPDOWN",
	callback = function(text)
		library.prioritize(text)
	end,
})

-- Settings
getgenv().load_config = function(name)
	library:load_config(readfile(library.directory .. "/configs/" .. name .. ".cfg"))
end

local column = Settings:column()
local section = column:section({ name = "Options" })
local old_config = library:get_config()
config_holder = section:list({ flag = "config_name_list" })
section:textbox({ flag = "config_name_text_box" })
section:button_holder({})
section:button({
	name = "Create",
	callback = function()
		writefile(library.directory .. "/configs/" .. flags["config_name_text_box"] .. ".cfg", library:get_config())
		library:config_list_update()
	end,
})
section:button({
	name = "Delete",
	callback = function()
		delfile(library.directory .. "/configs/" .. flags["config_name_list"] .. ".cfg")
		library:config_list_update()
	end,
})
section:button_holder({})
section:button({
	name = "Load",
	callback = function()
		library:load_config(readfile(library.directory .. "/configs/" .. flags["config_name_list"] .. ".cfg"))
		library:notification({
			text = "Loaded Config: " .. flags["config_name_list"],
			time = 3,
		})
	end,
})
section:button({
	name = "Save",
	callback = function()
		writefile(library.directory .. "/configs/" .. flags["config_name_list"] .. ".cfg", library:get_config())
		library:config_list_update()
		library:notification({
			text = "Saved Config: " .. flags["config_name_list"],
			time = 3,
		})
	end,
})
section:button_holder({})
section:button({
	name = "Refresh Configs",
	callback = function()
		library:config_list_update()
	end,
})
section:button_holder({})
section:button({
	name = "Unload Config",
	callback = function()
		library:load_config(old_config)
	end,
})
section:button({
	name = "Unload Menu",
	callback = function()
		library:load_config(old_config)

		for _, gui in library.guis do
			gui:Destroy()
		end

		for _, connection in library.connections do
			connection:Disconnect()
		end
	end,
})

local column = Settings:column()
local section = column:section({ name = "Theme" })
section:label({ name = "Accent" }):colorpicker({
	name = "Accent",
	color = themes.preset.accent,
	flag = "accent",
	callback = function(color, alpha)
		library:update_theme("accent", color)
	end,
})
section
	:label({ name = "Contrast" })
	:colorpicker({
		name = "Low",
		color = themes.preset.low_contrast,
		flag = "low_contrast",
		callback = function(color)
			if flags["high_contrast"] and flags["low_contrast"] then
				library:update_theme(
					"contrast",
					rgbseq({
						rgbkey(0, flags["low_contrast"].Color),
						rgbkey(1, flags["high_contrast"].Color),
					})
				)
			end
		end,
	})
	:colorpicker({
		name = "High",
		color = themes.preset.high_contrast,
		flag = "high_contrast",
		callback = function(color)
			library:update_theme(
				"contrast",
				rgbseq({
					rgbkey(0, flags["low_contrast"].Color),
					rgbkey(1, flags["high_contrast"].Color),
				})
			)
		end,
	})
section:label({ name = "Inline" }):colorpicker({
	name = "Inline",
	color = themes.preset.inline,
	callback = function(color, alpha)
		library:update_theme("inline", color)
	end,
})
section:label({ name = "Outline" }):colorpicker({
	name = "Outline",
	color = themes.preset.outline,
	callback = function(color, alpha)
		library:update_theme("outline", color)
	end,
})
section
	:label({ name = "Text Color" })
	:colorpicker({
		name = "Main",
		color = themes.preset.text,
		callback = function(color, alpha)
			library:update_theme("text", color)
		end,
	})
	:colorpicker({
		name = "Outline",
		color = themes.preset.text_outline,
		callback = function(color, alpha)
			library:update_theme("text_outline", color)
		end,
	})
section:label({ name = "Glow" }):colorpicker({
	name = "Glow",
	color = themes.preset.glow,
	callback = function(color, alpha)
		library:update_theme("glow", color)
	end,
})
section:label({ name = "UI Bind" }):keybind({
	callback = window.set_menu_visibility,
	key = Enum.KeyCode.Insert,
})
section:toggle({
	name = "Keybind List",
	flag = "keybind_list",
	callback = function(bool)
		library.keybind_list_frame.Visible = bool
	end,
})
section:toggle({
	name = "Watermark",
	flag = "watermark",
	callback = function(bool)
		watermark.set_visible(bool)
	end,
})
section:button_holder({})
section:button({
	name = "Copy JobId",
	callback = function()
		setclipboard(game.JobId)
	end,
})
section:button_holder({})
section:button({
	name = "Copy GameID",
	callback = function()
		setclipboard(game.GameId)
	end,
})
section:button_holder({})
section:button({
	name = "Copy Join Script",
	callback = function()
		setclipboard(
			'game:GetService("TeleportService"):TeleportToPlaceInstance('
				.. game.PlaceId
				.. ', "'
				.. game.JobId
				.. '", game.Players.LocalPlayer)'
		)
	end,
})
section:button_holder({})
section:button({
	name = "Rejoin",
	callback = function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
	end,
})
section:button_holder({})
section:button({
	name = "Join New Server",
	callback = function()
		local apiRequest = game:GetService("HttpService"):JSONDecode(
			game:HttpGetAsync(
				"https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
			)
		)
		local data = apiRequest.data[random(1, #apiRequest.data)]

		if data.playing <= flags["max_players"] then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, data.id)
		end
	end,
})
section:slider({
	name = "Max Players",
	flag = "max_players",
	min = 0,
	max = 40,
	default = 15,
	interval = 1,
})
--

Aimbot.open_tab()

task.spawn(function()
	while task.wait(1) do
		watermark.change_text(os.date("alex gut - Developer - %b %d %Y - %H:%M:%S"))
	end
end)
--

library:config_list_update()

for index, value in next, themes.preset do
	pcall(function()
		library:update_theme(index, value)
	end)
end
