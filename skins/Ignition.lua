if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "IgnitionSkin"
function US:SkinIgnition()
	ignTimeBar:StripTextures(true)
	US:SkinBackdropFrame(uiIgnitionFrame, true)
end

US:RegisterSkin(name, US.SkinIgnition)