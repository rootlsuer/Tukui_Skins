if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "CritlineSkin"
function US:SkinCritline()
	US:SkinBackdropFrame(Critline.display, true)
	Critline.display.Backdrop:SetFrameStrata("BACKGROUND")
end

US:RegisterSkin(name, US.SkinCritline)