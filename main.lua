--[[

░░░░░██╗░█████╗░██╗███╗░░██╗  ███╗░░░███╗██╗░░░██╗  ██████╗░██╗░██████╗░█████╗░░█████╗░██████╗░██████╗░
░░░░░██║██╔══██╗██║████╗░██║  ████╗░████║╚██╗░██╔╝  ██╔══██╗██║██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗
░░░░░██║██║░░██║██║██╔██╗██║  ██╔████╔██║░╚████╔╝░  ██║░░██║██║╚█████╗░██║░░╚═╝██║░░██║██████╔╝██║░░██║
██╗░░██║██║░░██║██║██║╚████║  ██║╚██╔╝██║░░╚██╔╝░░  ██║░░██║██║░╚═══██╗██║░░██╗██║░░██║██╔══██╗██║░░██║
╚█████╔╝╚█████╔╝██║██║░╚███║  ██║░╚═╝░██║░░░██║░░░  ██████╔╝██║██████╔╝╚█████╔╝╚█████╔╝██║░░██║██████╔╝
░╚════╝░░╚════╝░╚═╝╚═╝░░╚══╝  ╚═╝░░░░░╚═╝░░░╚═╝░░░  ╚═════╝░╚═╝╚═════╝░░╚════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░

https://discord.gg/uGxSYkyp66

--]]

-- Configuration Settings
local Config = {
    
    -- Sensitivity Settings
    -- The sensitivity multiplier for aiming adjustments (Max: 5)
    SENSITIVITY_MULTIPLIER = 0.5,  

    -- Aimbot Settings
    -- Toggle to enable or disable aimbot functionality
    AimbotToggleEnabled = false,  
    
    -- Aimbot Mode: "Hold" for holding the key, "Toggle" for pressing once to enable/disable
    AimbotMode = "Hold",  
    
    -- ESP (Extra Sensory Perception) Settings
    -- Enable or disable ESP to highlight enemies
    ESPEnabled = false,  

    -- Auto Shoot Settings
    -- Automatically shoots when an enemy is detected
    AutoShootEnabled = false,  

    -- Infinite Jump Settings
    -- Enables infinite jumping
    InfiniteJumpEnabled = false,  

    -- Walk Speed Settings
    -- Enables custom walk speed
    WalkSpeedEnabled = false,  
    
    -- Custom Walk Speed (used only if WalkSpeedEnabled is true)
    WalkSpeed = 100,  

    -- Aimbot Keybind Settings
    -- The keybind for activating the aimbot (default: Right Mouse Button)
    AimbotKeybind = Enum.UserInputType.MouseButton2  
}

getfenv(1).Config = Config

loadstring(game:HttpGet("https://pastebin.com/raw/mGCxuJSf",true))()
