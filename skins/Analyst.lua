if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'AnalystSkin'
function AS:SkinAnalyst()
	AS:SkinFrame(EconomyFrame)
	EconomyFrame:SetHeight(450)
	EconomyFrame:SetWidth(364)
	EconomyFrameTitleFrame:ClearAllPoints()
	EconomyFrameTitleFrame:SetPoint('TOP', EconomyFrame, 'TOP', 0, -5)
	AS:SkinCloseButton(EconomyFrameCloseButton)
	AS:SkinFrame(EconomyFrameTopStats)
	AS:SkinFrame(EconomyFrameLeftStats)
	AS:SkinFrame(EconomyFrameRightStats)
	AS:SkinDropDownBox(EconomyFramePeriodDropDown)
	AS:SkinDropDownBox(EconomyFrameLeftStatsReportDropDown)
	AS:SkinDropDownBox(EconomyFrameRightStatsReportDropDown)
	AS:SkinCheckBox(EconomyFrameAllCharacters)
end

AS:RegisterSkin(name, AS.SkinAnalyst)