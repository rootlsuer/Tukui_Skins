if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "AnalystSkin"
function US:SkinAnalyst()
	US:SkinFrame(EconomyFrame)
	EconomyFrame:SetHeight(450)
	EconomyFrame:SetWidth(364)
	EconomyFrameTitleFrame:ClearAllPoints()
	EconomyFrameTitleFrame:SetPoint("TOP", EconomyFrame, "TOP", 0, -5)
	US:SkinCloseButton(EconomyFrameCloseButton)
	US:SkinFrame(EconomyFrameTopStats)
	US:SkinFrame(EconomyFrameLeftStats)
	US:SkinFrame(EconomyFrameRightStats)
	US:SkinDropDownBox(EconomyFramePeriodDropDown)
	US:SkinDropDownBox(EconomyFrameLeftStatsReportDropDown)
	US:SkinDropDownBox(EconomyFrameRightStatsReportDropDown)
	US:SkinCheckBox(EconomyFrameAllCharacters)
end

US:RegisterSkin(name, US.SkinAnalyst)