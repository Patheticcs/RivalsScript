local Config = {
    SENSITIVITY_MULTIPLIER = 100,
    AimbotMode = "Hold",
    ESPEnabled = true,
    AutoShootEnabled = true,
    InfiniteJumpEnabled = true,
    NoClipEnabled = true,
    WalkSpeedEnabled = true,
    WalkSpeed = 100,
    AimbotKeybind = Enum.UserInputType.MouseButton2
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/rivalsscript/refs/heads/main/testingmain.lua", true))()

-- Pass the Config table to the loadstring environment
getfenv(1).Config = Config
