local scriptUrl = "https://raw.githubusercontent.com/Patheticcs/rivalsscript/refs/heads/main/testingmain.lua"
local config = {
    WalkSpeedEnabled = true,
    MOVE_SPEED = 100,
    SENSITIVITY_MULTIPLIER = 0.2,
    MAX_AIMBOT_DISTANCE = 1500,
    AimbotMode = "Toggle",
    ESPEnabled = true,
    ESPKeybind = Enum.KeyCode.Q,
    autoShootEnabled = true,
    toggleKey = Enum.KeyCode.R
}

local MainScript = loadstring(game:HttpGet(scriptUrl, true))()
MainScript(config)
