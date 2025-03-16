local Config = {
    WalkSpeed = {
        Enabled = false, 
        Speed = 50,      
        ToggleKey = Enum.KeyCode.F 
    },
    ESP = {
        Enabled = false, 
        Keybind = Enum.KeyCode.E, 
        MaxDistance = 1000 
    },
    Aimbot = {
        Enabled = false, 
        Mode = "Hold",   
        Keybind = Enum.UserInputType.MouseButton2, 
        Sensitivity = 0.5, 
        MaxDistance = 1000 
    },
    AutoShoot = {
        Enabled = false, 
        Keybind = Enum.KeyCode.T 
    }
}

local scriptFunction = loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/rivalsscript/refs/heads/main/testingmain.lua", true))
scriptFunction(Config)
