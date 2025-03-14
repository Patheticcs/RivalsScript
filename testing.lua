local UserConfig = {
    ESPEnabled = true,               -- Enable/Disable ESP
    AimbotEnabled = true,            -- Enable/Disable Aimbot
    AimbotMode = "Hold",             -- Aimbot mode: "Hold" or "Toggle"
    AimbotKeybind = Enum.UserInputType.MouseButton2,  -- Aimbot keybind
    AimbotSensitivity = 0.5,         -- Aimbot sensitivity
    AutoShootEnabled = false,        -- Enable/Disable Auto Shoot
    InfiniteJumpEnabled = true,      -- Enable/Disable Infinite Jump
    NoClipEnabled = false,           -- Enable/Disable NoClip
    WalkSpeedEnabled = true,         -- Enable/Disable WalkSpeed
    WalkSpeedValue = 50,             -- WalkSpeed value
    Theme = "Dark"                   -- UI Theme: "Dark" or "Light"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/rivalsscript/refs/heads/main/testingmain.lua", true))()
