if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "CritlineSkin"
local function SkinCritline()
	U.SkinBackdropFrame(Critline.display, true)
	Critline.display.Backdrop:SetFrameStrata("BACKGROUND")
end

U.RegisterSkin(name, SkinCritline)