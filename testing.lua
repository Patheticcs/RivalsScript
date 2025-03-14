local UserConfig = {
    ESPEnabled = true,
    AimbotEnabled = true,
    AutoShootEnabled = false,
    InfiniteJumpEnabled = true,
    NoClipEnabled = false,
    WalkSpeedEnabled = true,
    WalkSpeed = 50,
    AimbotKeybind = Enum.UserInputType.MouseButton2,
    AimbotSensitivity = 0.5,
    AimbotMode = "Hold",
    AimbotToggleEnabled = true,
    Whitelist = {"Player1", "Player2"}
}

local function isWhitelisted(player)
    for _, username in pairs(UserConfig.Whitelist) do
        if player.Name == username then
            return true
        end
    end
    return false
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/rivalsscript/refs/heads/main/testingmain.lua", true))()
