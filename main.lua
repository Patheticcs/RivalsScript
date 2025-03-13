--[[

░░░░░██╗░█████╗░██╗███╗░░██╗  ███╗░░░███╗██╗░░░██╗  ██████╗░██╗░██████╗░█████╗░░█████╗░██████╗░██████╗░
░░░░░██║██╔══██╗██║████╗░██║  ████╗░████║╚██╗░██╔╝  ██╔══██╗██║██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗
░░░░░██║██║░░██║██║██╔██╗██║  ██╔████╔██║░╚████╔╝░  ██║░░██║██║╚█████╗░██║░░╚═╝██║░░██║██████╔╝██║░░██║
██╗░░██║██║░░██║██║██║╚████║  ██║╚██╔╝██║░░╚██╔╝░░  ██║░░██║██║░╚═══██╗██║░░██╗██║░░██║██╔══██╗██║░░██║
╚█████╔╝╚█████╔╝██║██║░╚███║  ██║░╚═╝░██║░░░██║░░░  ██████╔╝██║██████╔╝╚█████╔╝╚█████╔╝██║░░██║██████╔╝
░╚════╝░░╚════╝░╚═╝╚═╝░░╚══╝  ╚═╝░░░░░╚═╝░░░╚═╝░░░  ╚═════╝░╚═╝╚═════╝░░╚════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░

https://discord.gg/uGxSYkyp66

--]]

local Config = {
    SENSITIVITY_MULTIPLIER = 0.5,
    AimbotToggleEnabled = false,
    AimbotMode = "Hold",
    ESPEnabled = false,
    AutoShootEnabled = false,
    InfiniteJumpEnabled = false,
    WalkSpeedEnabled = false,
    WalkSpeed = 100,
    AimbotKeybind = Enum.UserInputType.MouseButton2
}

getfenv(1).Config = Config

loadstring(game:HttpGet("https://pastebin.com/raw/mGCxuJSf",true))()
