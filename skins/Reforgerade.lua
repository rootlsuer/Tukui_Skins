if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "ReforgeradeSkin"
function US:SkinReforgerade()
	US:SkinFrame(ReforgeradeInputFrame.frame)
	US:SkinButton(ReforgeCompareButton)
	US:SkinButton(ReforgeItButton)
	US:SkinCloseButton(ReforgeradeCloseButton)
	US:SkinScrollBar(ExportScrollScrollBar)
	ExportScroll:CreateBackdrop()
	ExportScrollScrollBar:SetPoint("TOPLEFT", ExportScroll, "TOPRIGHT", 4, -15)
	US:SkinTooltip(ReforgeradeTooltip)
end

US:RegisterSkin(name, US.SkinReforgerade)