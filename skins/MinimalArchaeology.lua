if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "MinimalArchaeologySkin"
function US:SkinMinimalArchaeology()
	US:SkinFrame(MinArchMain)
	US:SkinStatusBar(MinArchMainSkillBar)
	MinArchMainSkillBar:Point("TOP", MinArchMain, "TOP", 2, -24)
	MinArchMainSkillBar:Width(253)
	US:Desaturate(MinArchMainButtonOpenADI)
	US:Desaturate(MinArchMainButtonOpenHist)
	US:Desaturate(MinArchMainButtonOpenArch)
	US:SkinCloseButton(MinArchMainButtonClose)
	MinArchMainButtonOpenADI:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", -66, -1)
	MinArchMainButtonOpenHist:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", -46, -1)
	MinArchMainButtonOpenArch:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", -26, -1)
	MinArchMainButtonClose:Point("TOPRIGHT", MinArchMain, "TOPRIGHT", 2, 2)
	US:SkinFrame(MinArchDigsites)
	US:SkinCloseButton(MinArchDigsitesButtonClose)
	US:SkinFrame(MinArchHist)
	US:SkinCloseButton(MinArchHistButtonClose)

	for i = 1, 12 do
		US:SkinStatusBar(_G["MinArchMainArtifactBar"..i])
		_G["MinArchMainArtifactBar"..i]:SetStatusBarColor(1.0, 0.4, 0)
		US:SkinButton(_G["MinArchMainArtifactBar"..i.."ButtonSolve"])
		_G["MinArchMainArtifactBar"..i.."ButtonSolve"]:SetHeight(17)
		_G["MinArchMainArtifactBar"..i.."ButtonSolve"]:SetPoint("TOPLEFT", _G["MinArchMainArtifactBar"..i], "TOPRIGHT", 5, 2)
		US:SkinCheckBox(_G["MinArchOptionPanelHideArtifact"..i])
		US:SkinCheckBox(_G["MinArchOptionPanelFragmentCap"..i])
		if _G["MinArchOptionPanelUseKeystones"..i] then US:SkinCheckBox(_G["MinArchOptionPanelUseKeystones"..i]) end
	end

	local checkbox = {
		"MinArchOptionPanelMiscOptionsHideMinimap",
		"MinArchOptionPanelMiscOptionsDisableSound",
		"MinArchOptionPanelMiscOptionsStartHidden",
		"MinArchOptionPanelMiscOptionsHideAfter",
		"MinArchOptionPanelMiscOptionsWaitForSolve",
	}

	for _,boxes in pairs(checkbox) do
		US:SkinCheckBox(boxes)
	end

	US:SkinSlideBar(MinArchOptionPanelFrameScaleSlider)
	MinArchOptionPanelFrameScaleSliderLow:ClearAllPoints()
	MinArchOptionPanelFrameScaleSliderLow:SetPoint("BOTTOMLEFT", MinArchOptionPanelFrameScale, "BOTTOMLEFT", 3, 3)
	MinArchOptionPanelFrameScaleSliderHigh:ClearAllPoints()
	MinArchOptionPanelFrameScaleSliderHigh:SetPoint("BOTTOMRIGHT", MinArchOptionPanelFrameScale, "BOTTOMRIGHT", -3, 3)

	US:SkinFrame(MinArchMainButtonOpenADI,"Default")
	MinArchMainButtonOpenADI:SetNormalTexture("")
	MinArchMainButtonOpenADI:SetPushedTexture("")
	MinArchMainButtonOpenADI:SetHighlightTexture("")
	MinArchMainButtonOpenADI:SetSize(14, 14)
	MinArchMainButtonOpenADI:ClearAllPoints()

	US:SkinFrame(MinArchMainButtonOpenHist,"Default")
	MinArchMainButtonOpenHist:SetNormalTexture("")
	MinArchMainButtonOpenHist:SetPushedTexture("")
	MinArchMainButtonOpenHist:SetHighlightTexture("")
	MinArchMainButtonOpenHist:SetSize(14, 14)
	MinArchMainButtonOpenHist:ClearAllPoints()

	US:SkinFrame(MinArchMainButtonOpenArch,"Default")
	MinArchMainButtonOpenArch:SetNormalTexture("")
	MinArchMainButtonOpenArch:SetPushedTexture("")
	MinArchMainButtonOpenArch:SetHighlightTexture("")
	MinArchMainButtonOpenArch:SetSize(14, 14)
	MinArchMainButtonOpenArch:ClearAllPoints()

	MinArchMainButtonOpenArch.text = MinArchMainButtonOpenArch:CreateFontString(nil, "OVERLAY")
	MinArchMainButtonOpenArch.text:SetFont(US.Font, US.DataTextFontSize, "OUTLINE")
	MinArchMainButtonOpenArch.text:SetPoint("CENTER", 2, 1)
	MinArchMainButtonOpenArch.text:SetText("A")
	MinArchMainButtonOpenHist.text = MinArchMainButtonOpenHist:CreateFontString(nil, "OVERLAY")
	MinArchMainButtonOpenHist.text:SetFont(US.Font, US.DataTextFontSize, "OUTLINE")
	MinArchMainButtonOpenHist.text:SetPoint("CENTER", 2, 1)
	MinArchMainButtonOpenHist.text:SetText("H")
	MinArchMainButtonOpenADI.text = MinArchMainButtonOpenADI:CreateFontString(nil, "OVERLAY")
	MinArchMainButtonOpenADI.text:SetFont(US.Font, US.DataTextFontSize, "OUTLINE")
	MinArchMainButtonOpenADI.text:SetPoint("CENTER", 2, 1)
	MinArchMainButtonOpenADI.text:SetText("D")

	MinArchMainButtonOpenADI:Point("RIGHT", MinArchMainButtonOpenHist, "LEFT", -3, 0)
	MinArchMainButtonOpenHist:Point("RIGHT", MinArchMainButtonOpenArch, "LEFT", -3, 0)
	MinArchMainButtonOpenArch:Point("BOTTOMRIGHT", MinArchMain, "BOTTOMRIGHT", -6, 3)
	US:SkinFrame(MinArchOptionPanelHideArtifact)
	US:SkinFrame(MinArchOptionPanelFragmentCap)
	US:SkinFrame(MinArchOptionPanelUseKeystones)
	US:SkinFrame(MinArchOptionPanelMiscOptions)
	US:SkinFrame(MinArchOptionPanelFrameScale)
end

US:RegisterSkin(name, US.SkinMinimalArchaeology)