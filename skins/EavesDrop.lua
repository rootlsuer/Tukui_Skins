if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "EavesDropSkin"
function US:SkinEavesDrop()
	US:SkinFrame(EavesDropFrame)
	US:SkinFrame(EavesDropHistoryFrame)
	US:SkinTab(EavesDropTab)
	EavesDropTab.Backdrop:Point("TOPLEFT", 0, -5)
	EavesDropTab.Backdrop:Point("BOTTOMRIGHT", 0, 2)
	EavesDropTabText:ClearAllPoints()
	EavesDropTabText:SetPoint("CENTER", EavesDropTab, "CENTER", 0, -2)
	US:SkinButton(EavesDropHistoryFrameReset)
	US:SkinCloseButton(EavesDropHistoryFrameClose)
end
US:RegisterSkin(name, US.SkinEavesDrop)