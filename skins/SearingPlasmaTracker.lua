if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "SearingPlasmaTrackerSkin"
function US:SkinSearingPlasmaTracker()
	US:SkinFrame(SearingPlasmaTrackerFrame)
end

US:RegisterSkin(name, US.SkinSearingPlasmaTracker)