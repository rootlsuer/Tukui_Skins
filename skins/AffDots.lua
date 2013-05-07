if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "AffDotsSkin"
function US:SkinAffDots()
	US:SkinBackdropFrame(AffDotsTarget)
end

US:RegisterSkin(name, US.SkinAffDots)