PLib = {}

local function I(sFile) return include("p_lib/"..sFile) end
local function A(sFile) return AddCSLuaFile("p_lib/"..sFile) end
local function IA(sFile) return I(sFile), A(sFile) end

-- IA("configuration.lua")
IA("constants.lua")
IA("lang.lua")

for _, sFile in ipairs(file.Find("p_lib/localization/*.lua", "LUA")) do
    IA("localization/"..sFile)

    print("Loaded localization file: "..sFile)
end

if SERVER then
    resource.AddSingleFile("resource/fonts/montserrat-light.ttf")
	resource.AddSingleFile("resource/fonts/montserrat-semibold.ttf")
	resource.AddSingleFile("resource/fonts/montserrat-bold.ttf")

    A("client/drawing.lua")
else
    I("client/drawing.lua")
end

MsgC(Color(0, 255, 0), "PLib loaded successfully!\n")
MsgC(Color(0, 255, 0), "Version: ", PLib.Constants.Version, "\n")
