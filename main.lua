local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera
local Keybind = Enum.UserInputType.MouseButton2 

local AimbotEnabled = false
local AimbotToggleEnabled = false
local Target = nil
local ESPEnabled = false
local ESPHighlights = {}
local NoClipEnabled = false

local DefaultWalkSpeed = 16
local DefaultJumpPower = 50
local WalkSpeed = DefaultWalkSpeed
local JumpPower = DefaultJumpPower

local ThemeColors = {
    Background = Color3.fromRGB(25, 25, 35),
    Panel = Color3.fromRGB(30, 30, 40),
    Accent = Color3.fromRGB(65, 105, 225), 
    Highlight = Color3.fromRGB(100, 149, 237), 
    Text = Color3.fromRGB(240, 240, 255),
    Danger = Color3.fromRGB(220, 20, 60) 
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EnhancedGameUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    ScreenGui.Parent = CoreGui
end)

if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Size = 0
BlurEffect.Parent = game.Lighting

local function createGlassPanel(parent, size, position, cornerRadius)
    local panel = Instance.new("Frame")
    panel.Size = size
    panel.Position = position
    panel.BackgroundColor3 = ThemeColors.Panel
    panel.BackgroundTransparency = 0.4
    panel.BorderSizePixel = 0
    panel.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, cornerRadius or 12)
    corner.Parent = panel

    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeColors.Text
    stroke.Thickness = 1.5
    stroke.Transparency = 0.7
    stroke.Parent = panel

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))
    })
    gradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.7),
        NumberSequenceKeypoint.new(1, 0.9)
    })
    gradient.Rotation = 45
    gradient.Parent = panel

    return panel
end

local function createButton(parent, size, position, text, cornerRadius)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = position
    button.Text = text
    button.BackgroundColor3 = ThemeColors.Accent
    button.BackgroundTransparency = 0.3
    button.TextColor3 = ThemeColors.Text
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.AutoButtonColor = false
    button.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, cornerRadius or 8)
    corner.Parent = button

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.3), {
            BackgroundTransparency = 0.1,
            BackgroundColor3 = ThemeColors.Highlight,
            TextSize = 15
        }):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.3), {
            BackgroundTransparency = 0.3,
            BackgroundColor3 = ThemeColors.Accent,
            TextSize = 14
        }):Play()
    end)

    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {
            Size = size - UDim2.new(0, 4, 0, 4),
            Position = position + UDim2.new(0, 2, 0, 2)
        }):Play()
    end)

    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {
            Size = size,
            Position = position
        }):Play()
    end)

    return button
end

local function createSlider(parent, size, position, minValue, maxValue, defaultValue, label, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(size.X.Scale, size.X.Offset, size.Y.Scale, size.Y.Offset + 25)
    container.Position = position
    container.BackgroundTransparency = 1
    container.Parent = parent

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0, 20)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.Text = label .. ": " .. defaultValue
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = ThemeColors.Text
    textLabel.TextSize = 14
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.Parent = container

    local slider = Instance.new("Frame")
    slider.Size = size
    slider.Position = UDim2.new(0, 0, 0, 25)
    slider.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    slider.BackgroundTransparency = 0.3
    slider.BorderSizePixel = 0
    slider.Parent = container

    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 8)
    sliderCorner.Parent = slider

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((defaultValue - minValue) / (maxValue - minValue), 0, 1, 0)
    fill.BackgroundColor3 = ThemeColors.Accent
    fill.BackgroundTransparency = 0.2
    fill.BorderSizePixel = 0
    fill.Parent = slider

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 8)
    fillCorner.Parent = fill

    local bubble = Instance.new("Frame")
    bubble.Size = UDim2.new(0, 30, 0, 30)
    bubble.Position = UDim2.new(fill.Size.X.Scale, -15, 0.5, -15)
    bubble.BackgroundColor3 = ThemeColors.Highlight
    bubble.BackgroundTransparency = 0.2
    bubble.ZIndex = 2
    bubble.Parent = fill

    local bubbleCorner = Instance.new("UICorner")
    bubbleCorner.CornerRadius = UDim.new(1, 0)
    bubbleCorner.Parent = bubble

    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(1, 0, 1, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(defaultValue)
    valueLabel.TextColor3 = ThemeColors.Text
    valueLabel.TextSize = 12
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.ZIndex = 3
    valueLabel.Parent = bubble

    local dragging = false

    local function updateSlider(input)
        local mouseX = input.Position.X
        local sliderX = slider.AbsolutePosition.X
        local sliderWidth = slider.AbsoluteSize.X
        local percent = math.clamp((mouseX - sliderX) / sliderWidth, 0, 1)
        local value = math.floor(minValue + (maxValue - minValue) * percent)

        fill.Size = UDim2.new(percent, 0, 1, 0)
        bubble.Position = UDim2.new(percent, -15, 0.5, -15)
        valueLabel.Text = tostring(value)
        textLabel.Text = label .. ": " .. value

        callback(value)
    end

    slider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            updateSlider(input)
        end
    end)

    slider.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input)
        end
    end)

    return container
end

local function createToggle(parent, position, text, default)
    local toggle = Instance.new("Frame")
    toggle.Size = UDim2.new(0, 200, 0, 30)
    toggle.Position = position
    toggle.BackgroundTransparency = 1
    toggle.Parent = parent

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 130, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = ThemeColors.Text
    label.TextSize = 14
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = toggle

    local switchContainer = Instance.new("Frame")
    switchContainer.Size = UDim2.new(0, 50, 0, 24)
    switchContainer.Position = UDim2.new(0, 140, 0, 3)
    switchContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    switchContainer.BackgroundTransparency = 0.3
    switchContainer.Parent = toggle

    local switchCorner = Instance.new("UICorner")
    switchCorner.CornerRadius = UDim.new(1, 0)
    switchCorner.Parent = switchContainer

    local toggleButton = Instance.new("Frame")
    toggleButton.Size = UDim2.new(0, 20, 0, 20)
    toggleButton.Position = UDim2.new(0, default and 27 or 2, 0, 2)
    toggleButton.BackgroundColor3 = default and ThemeColors.Accent or Color3.fromRGB(150, 150, 170)
    toggleButton.Parent = switchContainer

    local toggleButtonCorner = Instance.new("UICorner")
    toggleButtonCorner.CornerRadius = UDim.new(1, 0)
    toggleButtonCorner.Parent = toggleButton

    local enabled = default

    switchContainer.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            enabled = not enabled

            TweenService:Create(toggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = UDim2.new(0, enabled and 27 or 2, 0, 2),
                BackgroundColor3 = enabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 170)
            }):Play()

            TweenService:Create(switchContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                BackgroundColor3 = enabled and Color3.fromRGB(60, 60, 70) or Color3.fromRGB(50, 50, 60)
            }):Play()

            return enabled
        end
    end)

    label.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            enabled = not enabled

            TweenService:Create(toggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                Position = UDim2.new(0, enabled and 27 or 2, 0, 2),
                BackgroundColor3 = enabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 170)
            }):Play()

            TweenService:Create(switchContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
                BackgroundColor3 = enabled and Color3.fromRGB(60, 60, 70) or Color3.fromRGB(50, 50, 60)
            }):Play()

            return enabled
        end
    end)

    local function getState()
        return enabled
    end

    local function setState(state)
        enabled = state
        TweenService:Create(toggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            Position = UDim2.new(0, enabled and 27 or 2, 0, 2),
            BackgroundColor3 = enabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 170)
        }):Play()

        TweenService:Create(switchContainer, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            BackgroundColor3 = enabled and Color3.fromRGB(60, 60, 70) or Color3.fromRGB(50, 50, 60)
        }):Play()
    end

    return toggle, getState, setState
end

local SidePanel = createGlassPanel(ScreenGui, UDim2.new(0, 220, 0, 190), UDim2.new(1, -230, 0.5, -95))

spawn(function()
    local offset = 0
    while true do
        offset = (offset + 0.5) % 360
        local yOffset = math.sin(math.rad(offset)) * 3
        SidePanel.Position = UDim2.new(1, -230, 0.5, -95 + yOffset)
        wait(0.03)
    end
end)

local SidePanelTitle = Instance.new("TextLabel")
SidePanelTitle.Size = UDim2.new(0, 200, 0, 30)
SidePanelTitle.Position = UDim2.new(0.1, 0, 0.05, 0)
SidePanelTitle.Text = "Active Features"
SidePanelTitle.BackgroundTransparency = 1
SidePanelTitle.TextColor3 = ThemeColors.Text
SidePanelTitle.TextSize = 18
SidePanelTitle.Font = Enum.Font.GothamBold
SidePanelTitle.TextXAlignment = Enum.TextXAlignment.Left
SidePanelTitle.Parent = SidePanel

local ESPStatus, NoClipStatus, AimbotStatus

local function createStatusIndicator(panel, position, icon, text)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 180, 0, 30)
    container.Position = position
    container.BackgroundTransparency = 1
    container.Parent = panel

    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 30, 0, 30)
    iconLabel.Position = UDim2.new(0, 0, 0, 0)
    iconLabel.Text = icon
    iconLabel.BackgroundTransparency = 1
    iconLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    iconLabel.TextSize = 18
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = container

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(0, 150, 0, 30)
    statusLabel.Position = UDim2.new(0, 30, 0, 0)
    statusLabel.Text = text
    statusLabel.BackgroundTransparency = 1
    statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    statusLabel.TextSize = 14
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.Parent = container

    return statusLabel, iconLabel
end

ESPStatus, ESPIcon = createStatusIndicator(SidePanel, UDim2.new(0.1, 0, 0.3, 0), "👁️", "ESP: Off")
NoClipStatus, NoClipIcon = createStatusIndicator(SidePanel, UDim2.new(0.1, 0, 0.45, 0), "🚶", "No-Clip: Off")
AimbotStatus, AimbotIcon = createStatusIndicator(SidePanel, UDim2.new(0.1, 0, 0.6, 0), "🎯", "Aimbot: Off")

local SettingsButton = createButton(ScreenGui, UDim2.new(0, 110, 0, 40), UDim2.new(0.9, -120, 0.05, 0), "Settings")

spawn(function()
    while true do
        TweenService:Create(SettingsButton, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            BackgroundTransparency = 0.1
        }):Play()
        wait(1.5)
        TweenService:Create(SettingsButton, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            BackgroundTransparency = 0.3
        }):Play()
        wait(1.5)
    end
end)

local SettingsFrame = createGlassPanel(ScreenGui, UDim2.new(0, 320, 0, 470), UDim2.new(0.5, -160, 0.5, -235))
SettingsFrame.Visible = false

local SettingsTitle = Instance.new("TextLabel")
SettingsTitle.Size = UDim2.new(0, 250, 0, 40)
SettingsTitle.Position = UDim2.new(0.1, 0, 0.02, 0)
SettingsTitle.Text = "Rivals Script"
SettingsTitle.BackgroundTransparency = 1
SettingsTitle.TextColor3 = ThemeColors.Text
SettingsTitle.TextSize = 22
SettingsTitle.Font = Enum.Font.GothamBold
SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left
SettingsTitle.Parent = SettingsFrame

local CloseSettings = createButton(SettingsFrame, UDim2.new(0, 40, 0, 40), UDim2.new(0.9, -45, 0.02, 0), "✕")
CloseSettings.TextSize = 20
CloseSettings.BackgroundColor3 = ThemeColors.Danger

local espToggle, getESPState, setESPState = createToggle(SettingsFrame, UDim2.new(0.1, 0, 0.15, 0), "ESP", ESPEnabled)

local noClipToggle, getNoClipState, setNoClipState = createToggle(SettingsFrame, UDim2.new(0.1, 0, 0.25, 0), "No-Clip", NoClipEnabled)

local KeybindLabel = Instance.new("TextLabel")
KeybindLabel.Size = UDim2.new(0, 250, 0, 30)
KeybindLabel.Position = UDim2.new(0.1, 0, 0.35, 0)
KeybindLabel.Text = "Aimbot Keybind: Right Click"
KeybindLabel.BackgroundTransparency = 1
KeybindLabel.TextColor3 = ThemeColors.Text
KeybindLabel.TextSize = 14
KeybindLabel.Font = Enum.Font.Gotham
KeybindLabel.TextXAlignment = Enum.TextXAlignment.Left
KeybindLabel.Parent = SettingsFrame

local ChangeKeybind = createButton(SettingsFrame, UDim2.new(0, 250, 0, 40), UDim2.new(0.1, 0, 0.42, 0), "Change Keybind")

local walkSpeedSlider = createSlider(
    SettingsFrame, 
    UDim2.new(0, 250, 0, 20), 
    UDim2.new(0.1, 0, 0.55, 0), 
    0, 100, WalkSpeed, 
    "Walk Speed",
    function(value)
        WalkSpeed = value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
)

local jumpPowerSlider = createSlider(
    SettingsFrame, 
    UDim2.new(0, 250, 0, 20), 
    UDim2.new(0.1, 0, 0.7, 0), 
    0, 200, JumpPower, 
    "Jump Power",
    function(value)
        JumpPower = value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end
)

local dragging = false
local dragStart, startPos

SettingsFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and input.Position.Y - SettingsFrame.AbsolutePosition.Y <= 50 then
        dragging = true
        dragStart = input.Position
        startPos = SettingsFrame.Position

        TweenService:Create(BlurEffect, TweenInfo.new(0.3), {Size = 10}):Play()
    end
end)

SettingsFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
        dragging = false

        TweenService:Create(BlurEffect, TweenInfo.new(0.3), {Size = 0}):Play()
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        local targetPos = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )

        TweenService:Create(SettingsFrame, TweenInfo.new(0.1), {Position = targetPos}):Play()
    end
end)

SettingsButton.MouseButton1Click:Connect(function()
    if SettingsFrame.Visible then

        TweenService:Create(BlurEffect, TweenInfo.new(0.3), {Size = 0}):Play()
        TweenService:Create(SettingsFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 320, 0, 0),
            Position = UDim2.new(0.5, -160, 0.5, 0)
        }):Play()

        wait(0.5)
        SettingsFrame.Visible = false
    else

        SettingsFrame.Size = UDim2.new(0, 320, 0, 0)
        SettingsFrame.Position = UDim2.new(0.5, -160, 0.5, 0)
        SettingsFrame.Visible = true

        TweenService:Create(BlurEffect, TweenInfo.new(0.3), {Size = 10}):Play()
        TweenService:Create(SettingsFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 320, 0, 470),
            Position = UDim2.new(0.5, -160, 0.5, -235)
        }):Play()
    end
end)

CloseSettings.MouseButton1Click:Connect(function()

    TweenService:Create(BlurEffect, TweenInfo.new(0.3), {Size = 0}):Play()
    TweenService:Create(SettingsFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 320, 0, 0),
        Position = UDim2.new(0.5, -160, 0.5, 0)
    }):Play()

    wait(0.5)
    SettingsFrame.Visible = false
end)

ChangeKeybind.MouseButton1Click:Connect(function()
    KeybindLabel.Text = "Press any key..."
    KeybindLabel.TextColor3 = ThemeColors.Highlight

    local inputConnection
    inputConnection = UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard or 
           input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.MouseButton2 then

            Keybind = input.UserInputType
            local keyName

            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                keyName = "Left Click"
            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                keyName = "Right Click"
            else
                keyName = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
            end

            KeybindLabel.Text = "Aimbot Keybind: " .. keyName
            KeybindLabel.TextColor3 = ThemeColors.Text

            TweenService:Create(KeybindLabel, TweenInfo.new(0.3), {TextSize = 16}):Play()
            wait(0.3)
            TweenService:Create(KeybindLabel, TweenInfo.new(0.3), {TextSize = 14}):Play()

            inputConnection:Disconnect()
        end
    end)
end)

local function createESP(player)
    if not ESPEnabled or not player.Character then return end

    if ESPHighlights[player] then
        ESPHighlights[player]:Destroy()
    end

    local highlight = Instance.new("Highlight")
    highlight.Adornee = player.Character
    highlight.FillColor = Color3.new(0, 0.7, 1)
    highlight.OutlineColor = Color3.new(1, 1, 1)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0.3
    highlight.Parent = player.Character

    ESPHighlights[player] = highlight
end

local function removeESP(player)
    if ESPHighlights[player] then
        ESPHighlights[player]:Destroy()
        ESPHighlights[player] = nil
    end
end

local function applyESPToAllPlayers()
    if not ESPEnabled then return end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            createESP(player)
        end
    end
end

local function removeESPFromAllPlayers()
    for player, _ in pairs(ESPHighlights) do
        removeESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if ESPEnabled then
            wait(0.5)  
            createESP(player)
        end
    end)
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    if ESPEnabled then
        wait(0.5)  
        applyESPToAllPlayers()
    end
end)

local function removeESPFromAllPlayers()
    for player, _ in pairs(ESPHighlights) do
        removeESP(player)
    end
end

Players.PlayerRemoving:Connect(function(player)
    if ESPHighlights[player] then
        removeESP(player)
    end
end)

espToggle:GetChildren()[2].InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        ESPEnabled = not ESPEnabled

        ESPStatus.Text = "ESP: " .. (ESPEnabled and "On" or "Off")
        ESPStatus.TextColor3 = ESPEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)
        ESPIcon.TextColor3 = ESPEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)

        if ESPEnabled then
            applyESPToAllPlayers()
        else
            removeESPFromAllPlayers()
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if ESPEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                if not ESPHighlights[player] then
                    createESP(player)
                end
            end
        end
    end
end)

noClipToggle:GetChildren()[2].InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        NoClipEnabled = not NoClipEnabled
        NoClipStatus.Text = "No-Clip: " .. (NoClipEnabled and "On" or "Off")
        NoClipStatus.TextColor3 = NoClipEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)
        NoClipIcon.TextColor3 = NoClipEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)

        if NoClipEnabled then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
        end
    end
end)

local function GetClosestPlayerToCursor()
    local closestPlayer = nil
    local shortestDistance = math.huge
    local mouseLocation = UserInputService:GetMouseLocation()

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            local screenPosition, onScreen = Camera:WorldToViewportPoint(head.Position)

            if onScreen then
                local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - mouseLocation).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = head
                end
            end
        end
    end
    return closestPlayer
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.UserInputType == Keybind then

        if AimbotToggleEnabled then
            AimbotEnabled = true
            Target = GetClosestPlayerToCursor()
            AimbotStatus.Text = "Aimbot: On"
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Keybind then
        AimbotEnabled = false
        Target = nil
        AimbotStatus.Text = "Aimbot: Off"
    end
end)

RunService.RenderStepped:Connect(function()

    if AimbotEnabled and AimbotToggleEnabled and Target then
        local mouseLocation = UserInputService:GetMouseLocation()
        local screenPosition = Camera:WorldToViewportPoint(Target.Position)
        local delta = (Vector2.new(screenPosition.X, screenPosition.Y) - mouseLocation) * 0.2 

        if math.abs(delta.X) > 1 or math.abs(delta.Y) > 1 then 
            mousemoverel(delta.X, delta.Y)
        end
    end
end)

local aimbotToggle, getAimbotState, setAimbotState = createToggle(SettingsFrame, UDim2.new(0.1, 0, 0.35, 0), "Aimbot", AimbotToggleEnabled)

aimbotToggle:GetChildren()[2].InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        AimbotToggleEnabled = not AimbotToggleEnabled
        AimbotEnabled = false  
        Target = nil

        AimbotStatus.Text = "Aimbot: " .. (AimbotToggleEnabled and "On" or "Off")
        AimbotStatus.TextColor3 = AimbotToggleEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)
        AimbotIcon.TextColor3 = AimbotToggleEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)
    end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = WalkSpeed
    humanoid.JumpPower = JumpPower

    if ESPEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                createESP(player)
            end
        end
    end
end)

game:GetService("Players").PlayerRemoving:Connect(function(player)
    if ESPHighlights[player] then
        removeESP(player)
    end
end)

local function updateUI()
    ESPStatus.Text = "ESP: " .. (ESPEnabled and "On" or "Off")
    ESPStatus.TextColor3 = ESPEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)
    ESPIcon.TextColor3 = ESPEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)

    NoClipStatus.Text = "No-Clip: " .. (NoClipEnabled and "On" or "Off")
    NoClipStatus.TextColor3 = NoClipEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)
    NoClipIcon.TextColor3 = NoClipEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)

    AimbotStatus.Text = "Aimbot: " .. (AimbotToggleEnabled and "On" or "Off")
    AimbotStatus.TextColor3 = AimbotToggleEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)
    AimbotIcon.TextColor3 = AimbotToggleEnabled and ThemeColors.Accent or Color3.fromRGB(150, 150, 150)
end

updateUI()
