if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "EnergyWatchSkin"
function AS:SkinEnergyWatch()
	EnergyWatchBar:StripTextures(true)
	AS:SkinStatusBar(EnergyWatchStatusBar)
end

AS:RegisterSkin(name, AS.SkinEnergyWatch)