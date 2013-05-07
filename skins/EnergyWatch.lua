if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "EnergyWatchSkin"
function US:SkinEnergyWatch()
	EnergyWatchBar:StripTextures(true)
	US:SkinStatusBar(EnergyWatchStatusBar)
end

US:RegisterSkin(name, US.SkinEnergyWatch)