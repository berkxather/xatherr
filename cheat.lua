-- Aimbot Scripti yüklendiyse devam eder
repeat task.wait() until getgenv().ExunysDeveloperAimbot
local Aimbot = getgenv().ExunysDeveloperAimbot

-- MaterialLua UI'yi yükle
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/raindrop-devs/MaterialLua/main/Source.lua"))()

local UI = Material.Load({
    Title = "Aimbot Settings",
    Style = 1,
    SizeX = 400,
    SizeY = 350,
    Theme = "Dark"
})

local AimbotTab = UI.New({
    Title = "Aimbot"
})

AimbotTab.Toggle({
    Text = "Enabled",
    Callback = function(Value)
        Aimbot.Settings.Enabled = Value
    end,
    Enabled = Aimbot.Settings.Enabled
})

AimbotTab.Toggle({
    Text = "Team Check",
    Callback = function(Value)
        Aimbot.Settings.TeamCheck = Value
    end,
    Enabled = Aimbot.Settings.TeamCheck
})

AimbotTab.Toggle({
    Text = "Alive Check",
    Callback = function(Value)
        Aimbot.Settings.AliveCheck = Value
    end,
    Enabled = Aimbot.Settings.AliveCheck
})

AimbotTab.Toggle({
    Text = "Wall Check",
    Callback = function(Value)
        Aimbot.Settings.WallCheck = Value
    end,
    Enabled = Aimbot.Settings.WallCheck
})

AimbotTab.Toggle({
    Text = "Offset To Move Direction",
    Callback = function(Value)
        Aimbot.Settings.OffsetToMoveDirection = Value
    end,
    Enabled = Aimbot.Settings.OffsetToMoveDirection
})

AimbotTab.Slider({
    Text = "Offset Increment",
    Callback = function(Value)
        Aimbot.Settings.OffsetIncrement = Value
    end,
    Min = 0,
    Max = 30,
    Def = Aimbot.Settings.OffsetIncrement
})

AimbotTab.Slider({
    Text = "Sensitivity",
    Callback = function(Value)
        Aimbot.Settings.Sensitivity = Value
    end,
    Min = 0,
    Max = 1,
    Def = Aimbot.Settings.Sensitivity,
    Float = 0.01
})

AimbotTab.Slider({
    Text = "Sensitivity2",
    Callback = function(Value)
        Aimbot.Settings.Sensitivity2 = Value
    end,
    Min = 1,
    Max = 10,
    Def = Aimbot.Settings.Sensitivity2
})

AimbotTab.Dropdown({
    Text = "LockPart",
    Callback = function(Value)
        Aimbot.Settings.LockPart = Value
    end,
    Options = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"},
    Def = Aimbot.Settings.LockPart
})

AimbotTab.Dropdown({
    Text = "LockMode",
    Callback = function(Value)
        Aimbot.Settings.LockMode = (Value == "CFrame" and 1 or 2)
    end,
    Options = {"CFrame", "MouseMoveRel"},
    Def = (Aimbot.Settings.LockMode == 1 and "CFrame" or "MouseMoveRel")
})

AimbotTab.Toggle({
    Text = "Toggle Mode",
    Callback = function(Value)
        Aimbot.Settings.Toggle = Value
    end,
    Enabled = Aimbot.Settings.Toggle
})
