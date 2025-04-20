-- Aimbot scripti yüklendiyse devam eder
repeat task.wait() until getgenv().ExunysDeveloperAimbot
local Aimbot = getgenv().ExunysDeveloperAimbot

-- Menüyü ve özellikleri kontrol etmek için temel bir GUI oluşturuyoruz
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 320)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "Exunys Aimbot V3"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24
Title.TextAlign = Enum.TextXAlignment.Center
Title.Parent = MainFrame

local function createToggle(label, position, defaultValue, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(0, 300, 0, 40)
    ToggleFrame.Position = position
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ToggleFrame.Parent = MainFrame

    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Text = label
    ToggleLabel.Size = UDim2.new(0, 200, 1, 0)
    ToggleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleLabel.TextSize = 18
    ToggleLabel.TextAlign = Enum.TextXAlignment.Left
    ToggleLabel.Parent = ToggleFrame

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 60, 1, 0)
    ToggleButton.Position = UDim2.new(1, -60, 0, 0)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    ToggleButton.Text = defaultValue and "ON" or "OFF"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.TextSize = 18
    ToggleButton.Parent = ToggleFrame

    ToggleButton.MouseButton1Click:Connect(function()
        defaultValue = not defaultValue
        ToggleButton.Text = defaultValue and "ON" or "OFF"
        callback(defaultValue)
    end)
end

-- Aimbot özelliklerini yöneten toggle'ları ekliyoruz
createToggle("Aimbot Aktif", UDim2.new(0, 50, 0, 60), Aimbot.Settings.Enabled, function(Value)
    Aimbot.Settings.Enabled = Value
end)

createToggle("Takım Kontrolü", UDim2.new(0, 50, 0, 110), Aimbot.Settings.TeamCheck, function(Value)
    Aimbot.Settings.TeamCheck = Value
end)

createToggle("Hayatta Kalma Kontrolü", UDim2.new(0, 50, 0, 160), Aimbot.Settings.AliveCheck, function(Value)
    Aimbot.Settings.AliveCheck = Value
end)

createToggle("Duvar Kontrolü", UDim2.new(0, 50, 0, 210), Aimbot.Settings.WallCheck, function(Value)
    Aimbot.Settings.WallCheck = Value
end)

createToggle("Yön Ofseti", UDim2.new(0, 50, 0, 260), Aimbot.Settings.OffsetToMoveDirection, function(Value)
    Aimbot.Settings.OffsetToMoveDirection = Value
end)

createToggle("Toggle Modu", UDim2.new(0, 50, 0, 310), Aimbot.Settings.Toggle, function(Value)
    Aimbot.Settings.Toggle = Value
end)

-- Hassasiyet ve ofset slider'ları
local function createSlider(label, position, min, max, defaultValue, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(0, 300, 0, 40)
    SliderFrame.Position = position
    SliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    SliderFrame.Parent = MainFrame

    local SliderLabel = Instance.new("TextLabel")
    SliderLabel.Text = label
    SliderLabel.Size = UDim2.new(0, 200, 1, 0)
    SliderLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderLabel.TextSize = 18
    SliderLabel.TextAlign = Enum.TextXAlignment.Left
    SliderLabel.Parent = SliderFrame

    local SliderBar = Instance.new("Frame")
    SliderBar.Size = UDim2.new(0, 250, 0, 4)
    SliderBar.Position = UDim2.new(0, 50, 1, -6)
    SliderBar.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    SliderBar.Parent = SliderFrame

    local SliderButton = Instance.new("Frame")
    SliderButton.Size = UDim2.new(0, 10, 0, 10)
    SliderButton.Position = UDim2.new(0, (defaultValue - min) / (max - min) * 240, 0, -3)
    SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderButton.Parent = SliderBar

    SliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local function updateSlider()
                local mousePos = game:GetService("UserInputService"):GetMouseLocation()
                local newX = math.clamp(mousePos.X - SliderBar.AbsolutePosition.X, 0, 240)
                SliderButton.Position = UDim2.new(0, newX, 0, -3)
                callback(min + (newX / 240) * (max - min))
            end
            game:GetService("UserInputService").InputChanged:Connect(updateSlider)
        end
    end)
end

-- Slider'ları ekliyoruz
createSlider("Hassasiyet (CFrame)", UDim2.new(0, 50, 0, 360), 0, 1, Aimbot.Settings.Sensitivity, function(Value)
    Aimbot.Settings.Sensitivity = Value
end)

createSlider("Hassasiyet 2 (MouseMoveRel)", UDim2.new(0, 50, 0, 410), 1, 10, Aimbot.Settings.Sensitivity2, function(Value)
    Aimbot.Settings.Sensitivity2 = Value
end)

createSlider("Ofset Artışı", UDim2.new(0, 50, 0, 460), 0, 30, Aimbot.Settings.OffsetIncrement, function(Value)
    Aimbot.Settings.OffsetIncrement = Value
end)

-- Menüyü ve özellikleri başarıyla oluşturduk.
