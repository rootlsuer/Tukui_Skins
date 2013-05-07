if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "VengeanceStatusSkin"
function US:SkinVengeanceStatus()
	US:SkinStatusBar(VengeanceStatus_StatusBar)
end

US:RegisterSkin(name, US.SkinVengeanceStatus)