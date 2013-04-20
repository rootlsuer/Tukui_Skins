if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "EnergyWatchSkin"
local function SkinEnergyWatch(self)
	EnergyWatchBar:StripTextures(true)
	U.SkinStatusBar(EnergyWatchStatusBar)
end

U.RegisterSkin(name, SkinEnergyWatch)