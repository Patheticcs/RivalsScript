-- Configuration Table (Customize these settings)
local Config = {
    WalkSpeed = {
        Enabled = false, -- Toggle WalkSpeed
        Speed = 50,      -- WalkSpeed value
        ToggleKey = Enum.KeyCode.F -- Key to toggle WalkSpeed
    },
    ESP = {
        Enabled = false, -- Toggle ESP
        Keybind = Enum.KeyCode.E, -- Key to toggle ESP
        MaxDistance = 1000 -- Maximum distance for ESP
    },
    Aimbot = {
        Enabled = false, -- Toggle Aimbot
        Mode = "Hold",   -- "Hold" or "Toggle"
        Keybind = Enum.UserInputType.MouseButton2, -- Right Click
        Sensitivity = 0.1, -- Aimbot sensitivity
        MaxDistance = 1000 -- Maximum distance for Aimbot
    },
    AutoShoot = {
        Enabled = false, -- Toggle AutoShoot
        Keybind = Enum.KeyCode.T -- Key to toggle AutoShoot
    }
}

-- Load the script and pass the configuration
loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/rivalsscript/refs/heads/main/testingmain.lua", true))(Config)
