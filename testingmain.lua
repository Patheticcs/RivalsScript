return function(Config)
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Camera = game.Workspace.CurrentCamera

    local WalkSpeedEnabled = Config.WalkSpeed.Enabled
    local MOVE_SPEED = Config.WalkSpeed.Speed
    local WalkSpeedToggleKey = Config.WalkSpeed.ToggleKey

    local function updateWalkSpeed(newSpeed)
        MOVE_SPEED = newSpeed
        if WalkSpeedEnabled then
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = newSpeed
                end
            end
        end
    end

    local function toggleWalkSpeed()
        WalkSpeedEnabled = not WalkSpeedEnabled
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = WalkSpeedEnabled and MOVE_SPEED or 16
            end
        end
    end

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == WalkSpeedToggleKey then
            toggleWalkSpeed()
        end
    end)

    updateWalkSpeed(MOVE_SPEED)

    local ESPEnabled = Config.ESP.Enabled
    local ESPKeybind = Config.ESP.Keybind
    local MAX_DISTANCE_THRESHOLD = Config.ESP.MaxDistance
    local ESPHighlights = {}

    local function createESP(player)
        if not ESPEnabled or not player.Character then return end
        local localRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local targetRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if not localRootPart or not targetRootPart then return end
        if (localRootPart.Position - targetRootPart.Position).Magnitude > MAX_DISTANCE_THRESHOLD then return end
        if ESPHighlights[player] then
            ESPHighlights[player]:Destroy()
        end
        local highlight = Instance.new("Highlight")
        highlight.Adornee = player.Character
        highlight.FillColor = Color3.new(0, 0, 0)
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
            if player ~= LocalPlayer then
                createESP(player)
            end
        end
    end

    local function removeESPFromAllPlayers()
        for player in pairs(ESPHighlights) do
            removeESP(player)
        end
    end

    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            if ESPEnabled then
                task.wait(0.5)
                createESP(player)
            end
        end)
    end)

    LocalPlayer.CharacterAdded:Connect(function()
        if ESPEnabled then
            task.wait(0.5)
            applyESPToAllPlayers()
        end
    end)

    Players.PlayerRemoving:Connect(removeESP)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == ESPKeybind then
            ESPEnabled = not ESPEnabled
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
                    local localRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local targetRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                    if localRootPart and targetRootPart then
                        local distance = (localRootPart.Position - targetRootPart.Position).Magnitude
                        if distance <= MAX_DISTANCE_THRESHOLD then
                            if not ESPHighlights[player] then
                                createESP(player)
                            end
                        else
                            removeESP(player)
                        end
                    end
                end
            end
        end
    end)

    local AimbotEnabled = Config.Aimbot.Enabled
    local AimbotMode = Config.Aimbot.Mode
    local AimbotKeybind = Config.Aimbot.Keybind
    local SENSITIVITY_MULTIPLIER = Config.Aimbot.Sensitivity
    local MAX_AIMBOT_DISTANCE = Config.Aimbot.MaxDistance
    local Target = nil
    local lastTime = tick()

    local function isDead(player)
        if not player or not player.Character then return true end
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        return not humanoid or humanoid.Health <= 0
    end

    local function isTeammate(player)
        if not LocalPlayer or not player then return false end
        if not LocalPlayer.Team or not player.Team then return false end
        return LocalPlayer.Team == player.Team
    end

    local function GetClosestPlayerToCursor()
        local closestPlayer = nil
        local shortestDistance = math.huge
        local mouseLocation = UserInputService:GetMouseLocation()
        local localRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not localRootPart then return nil end

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and not isTeammate(player) and not isDead(player) then
                local head = player.Character:FindFirstChild("Head")
                if head then
                    local distance = (localRootPart.Position - head.Position).Magnitude
                    if distance <= MAX_AIMBOT_DISTANCE then
                        local screenPosition, onScreen = Camera:WorldToViewportPoint(head.Position)
                        if onScreen then
                            local cursorDistance = (Vector2.new(screenPosition.X, screenPosition.Y) - mouseLocation).Magnitude
                            if cursorDistance < shortestDistance then
                                shortestDistance = cursorDistance
                                closestPlayer = head
                            end
                        else
                            if distance < shortestDistance then
                                shortestDistance = distance
                                closestPlayer = head
                            end
                        end
                    end
                end
            end
        end

        return closestPlayer
    end

    local function calculateVelocity(part, deltaTime)
        if not part or not part.Position then return Vector3.zero end
        if not part:FindFirstChild("LastPosition") then
            local lastPosition = Instance.new("Vector3Value")
            lastPosition.Name = "LastPosition"
            lastPosition.Value = part.Position
            lastPosition.Parent = part
        end
        local lastPosition = part.LastPosition.Value
        local velocity = (part.Position - lastPosition) / deltaTime
        part.LastPosition.Value = part.Position
        return velocity
    end

    local function predictPosition(target, deltaTime)
        if not target then return nil end
        local velocity = calculateVelocity(target, deltaTime)
        return target.Position + velocity * deltaTime * 2
    end

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed then
            if input.UserInputType == AimbotKeybind then
                if AimbotMode == "Toggle" then
                    AimbotEnabled = not AimbotEnabled
                    if AimbotEnabled then
                        Target = GetClosestPlayerToCursor()
                        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
                    else
                        Target = nil
                        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
                    end
                else
                    AimbotEnabled = true
                    Target = GetClosestPlayerToCursor()
                    UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
                end
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input, gameProcessed)
        if input.UserInputType == AimbotKeybind then
            if AimbotMode == "Hold" then
                AimbotEnabled = false
                Target = nil
                UserInputService.MouseBehavior = Enum.MouseBehavior.Default
            end
        end
    end)

    RunService.RenderStepped:Connect(function()
        local currentTime = tick()
        local deltaTime = currentTime - lastTime
        lastTime = currentTime

        if AimbotEnabled then
            if not Target then
                Target = GetClosestPlayerToCursor()
            end

            if Target and Target.Parent and not isTeammate(Target.Parent) then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - Target.Position).Magnitude
                if distance <= MAX_AIMBOT_DISTANCE then
                    local predictedPosition = predictPosition(Target, deltaTime)
                    if predictedPosition then
                        local screenPosition = Camera:WorldToViewportPoint(predictedPosition)
                        local centerScreen = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

                        local deltaX = (screenPosition.X - centerScreen.X) * SENSITIVITY_MULTIPLIER
                        local deltaY = (screenPosition.Y - centerScreen.Y) * SENSITIVITY_MULTIPLIER

                        mousemoverel(deltaX, deltaY)
                    end
                else
                    Target = nil
                end
            else
                Target = nil
            end
        else
            Target = nil
        end
    end)

    local AutoShootEnabled = Config.AutoShoot.Enabled
    local AutoShootKeybind = Config.AutoShoot.Keybind
    local holdingMouse = false

    local function isTargetValid(target)
        if target and target.Parent then
            local character = target.Parent
            if character:FindFirstChild("Humanoid") and character ~= LocalPlayer.Character then
                return true
            end
        end
        return false
    end

    local function autoShoot()
        if AutoShootEnabled then
            if isTargetValid(Mouse.Target) then
                if not holdingMouse then
                    holdingMouse = true
                    mouse1press()
                end
            else
                if holdingMouse then
                    holdingMouse = false
                    mouse1release()
                end
            end
        end
    end

    local function toggleAutoShoot(input, gameProcessed)
        if input.KeyCode == AutoShootKeybind and not gameProcessed then
            AutoShootEnabled = not AutoShootEnabled
            if not AutoShootEnabled and holdingMouse then
                holdingMouse = false
                mouse1release()
            end
        end
    end

    UserInputService.InputBegan:Connect(toggleAutoShoot)
    RunService.RenderStepped:Connect(autoShoot)
end
