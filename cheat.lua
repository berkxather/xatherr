-- Aimbot Scripti yüklendiyse devam eder
repeat task.wait() until getgenv().ExunysDeveloperAimbot
local Aimbot = getgenv().ExunysDeveloperAimbot

-- Rayfield UI yükle
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Aimbot Settings",
    LoadingTitle = "Exunys Aimbot",
    LoadingSubtitle = "Rayfield UI",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

local AimbotTab = Window:CreateTab("Aimbot", 4483362458)

AimbotTab:CreateToggle({
    Name = "Enabled",
    CurrentValue = Aimbot.Settings.Enabled,
    Callback = function(Value)
        Aimbot.Settings.Enabled = Value
    end
})

AimbotTab:CreateToggle({
    Name = "Team Check",
    CurrentValue = Aimbot.Settings.TeamCheck,
    Callback = function(Value)
        Aimbot.Settings.TeamCheck = Value
    end
})

AimbotTab:CreateToggle({
    Name = "Alive Check",
    CurrentValue = Aimbot.Settings.AliveCheck,
    Callback = function(Value)
        Aimbot.Settings.AliveCheck = Value
    end
})

AimbotTab:CreateToggle({
    Name = "Wall Check",
    CurrentValue = Aimbot.Settings.WallCheck,
    Callback = function(Value)
        Aimbot.Settings.WallCheck = Value
    end
})

AimbotTab:CreateToggle({
    Name = "Offset To Move Direction",
    CurrentValue = Aimbot.Settings.OffsetToMoveDirection,
    Callback = function(Value)
        Aimbot.Settings.OffsetToMoveDirection = Value
    end
})

AimbotTab:CreateSlider({
    Name = "Offset Increment",
    Range = {0, 30},
    Increment = 1,
    CurrentValue = Aimbot.Settings.OffsetIncrement,
    Callback = function(Value)
        Aimbot.Settings.OffsetIncrement = Value
    end
})

AimbotTab:CreateSlider({
    Name = "Sensitivity",
    Range = {0, 1},
    Increment = 0.01,
    CurrentValue = Aimbot.Settings.Sensitivity,
    Callback = function(Value)
        Aimbot.Settings.Sensitivity = Value
    end
})

AimbotTab:CreateSlider({
    Name = "Sensitivity2",
    Range = {1, 10},
    Increment = 1,
    CurrentValue = Aimbot.Settings.Sensitivity2,
    Callback = function(Value)
        Aimbot.Settings.Sensitivity2 = Value
    end
})

AimbotTab:CreateDropdown({
    Name = "LockPart",
    Options = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"},
    CurrentOption = Aimbot.Settings.LockPart,
    Callback = function(Value)
        Aimbot.Settings.LockPart = Value
    end
})

AimbotTab:CreateDropdown({
    Name = "LockMode",
    Options = {"CFrame", "MouseMoveRel"},
    CurrentOption = Aimbot.Settings.LockMode == 1 and "CFrame" or "MouseMoveRel",
    Callback = function(Value)
        Aimbot.Settings.LockMode = (Value == "CFrame" and 1 or 2)
    end
})

AimbotTab:CreateToggle({
    Name = "Toggle Mode",
    CurrentValue = Aimbot.Settings.Toggle,
    Callback = function(Value)
        Aimbot.Settings.Toggle = Value
    end
})
