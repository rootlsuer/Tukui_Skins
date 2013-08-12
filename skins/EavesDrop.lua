if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "EavesDropSkin"
function AS:SkinEavesDrop()
	AS:SkinFrame(EavesDropFrame)
	AS:SkinFrame(EavesDropHistoryFrame)
	AS:SkinTab(EavesDropTab)
	EavesDropTab.backdrop:Point("TOPLEFT", 0, -5)
	EavesDropTab.backdrop:Point("BOTTOMRIGHT", 0, 2)
	EavesDropTabText:ClearAllPoints()
	EavesDropTabText:SetPoint("CENTER", EavesDropTab, "CENTER", 0, -2)
	AS:SkinButton(EavesDropHistoryFrameReset)
	AS:SkinCloseButton(EavesDropHistoryFrameClose)
end
AS:RegisterSkin(name, AS.SkinEavesDrop)