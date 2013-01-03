if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "MiscFixes"

local function MiscFixes(self)
local s = U.s
local c = U.c

	if IsAddOnLoaded("Numeration") and U.CheckOption("NumerationSkin") then
		U.SkinFrame(NumerationFrame, false, true)
	end

	if IsAddOnLoaded("Critline") and U.CheckOption("CritlineSkin") then
		U.SkinBackdropFrame(Critline.display, true)
		Critline.display.backdrop:SetFrameStrata("BACKGROUND")
	end	

	if IsAddOnLoaded("InspectEquip") and U.CheckOption("InspectEquipSkin") then
		U.SkinFrame(InspectEquip_InfoWindow)
		U.SkinCloseButton(InspectEquip_InfoWindow_CloseButton)
	end
	UISetup()
	if UIMinimap then Minimap:SetMaskTexture(c["media"].blank) end

	if IsAddOnLoaded("TomTom") and (U.CheckOption("TomTomSkin")) then
		if TomTomBlock then
			U.SkinFrame(TomTomBlock)
		end
	end

	if IsAddOnLoaded("SymbiosisTip") then
		U.SkinTooltip(SymbiosisTip)
	end

	if IsAddOnLoaded("VengeanceStatus") and (U.CheckOption("VengeanceStatusSkin")) then
		U.SkinStatusBar(VengeanceStatus_StatusBar)
	end
	
	if IsAddOnLoaded("PetJournalEnhanced") then LoadAddOn("Blizzard_PetJournal") PetJournal:HookScript("OnShow", function() PJEUniquePetCount:StripTextures() end) end
	
	if IsAddOnLoaded("FlightMapEnhanced") then
		U.SkinBackdropFrame(FlightMapEnhancedTaxiChoice, true)
		U.SkinCloseButton(FlightMapEnhancedTaxiChoice.CloseButton)
		U.SkinScrollBar(FlightMapEnhancedTaxiChoiceContainerScrollBar)
		FlightMapEnhancedTaxiChoice:HookScript("OnShow", function()
			for i = 1, 34 do
				if _G["FlightMapEnhancedTaxiChoiceContainerButton"..i] then _G["FlightMapEnhancedTaxiChoiceContainerButton"..i]:StripTextures() end
			end
		end)
		hooksecurefunc("FlightMapEnhancedTaxiChoiceButton_OnEnter", function() GameTooltip:Show() end)
	end
	
	LoadAddOn("acb_CastBar")
	if IsAddOnLoaded("acb_CastBar") then
		U.SkinBackdropFrame(AzCastBarPluginPlayer)
		U.SkinBackdropFrame(AzCastBarPluginTarget)
		U.SkinBackdropFrame(AzCastBarPluginFocus)
		U.SkinBackdropFrame(AzCastBarPluginMirror)
		U.SkinBackdropFrame(AzCastBarPluginPet)
	end

	if IsAddOnLoaded("BloodShieldTracker") and not IsAddOnLoaded("Tukui") then
		U.SkinStatusBar(BloodShieldTracker_EstimateBar)
		U.SkinStatusBar(BloodShieldTracker_HealthBar)
		U.SkinStatusBar(BloodShieldTracker_ShieldBar)
		U.SkinStatusBar(BloodShieldTracker_EstimateBar)
		U.SkinStatusBar(BloodShieldTracker_BloodChargeBar)
		U.SkinStatusBar(BloodShieldTracker_TotalAbsorbsBar)
		U.SkinStatusBar(BloodShieldTracker_PWSBar)
		U.SkinStatusBar(BloodShieldTracker_IllumBar)
		U.SkinStatusBar(BloodShieldTracker_AMSBar)
		U.SkinStatusBar(BloodShieldTracker_PurgatoryBar)
	end

	if IsAddOnLoaded("AffDots") then	
		U.SkinBackdropFrame(AffDotsTarget)
	end

	if IsAddOnLoaded("GuildMemberInfo_TradeSkills") then
		U.SkinFrame(GMIFrame)
		U.SkinIconButton(GMItsButton1, true)
		U.SkinIconButton(GMItsButton2, true)
		GMItsIcon1:SetTexCoord(0.12, 0.88, 0.12, 0.88)
		GMItsIcon2:SetTexCoord(0.12, 0.88, 0.12, 0.88)
	end
	
	if IsAddOnLoaded("ShieldBars") then
		hooksecurefunc(ShieldBars, "DisplayShields", function()
			for i = 1, 20 do
				if _G["ShieldBarsStatusBar"..i.."Frame"] then U.SkinFrame(_G["ShieldBarsStatusBar"..i.."Frame"], false, true) end
			end
		end)
	end

	if IsAddOnLoaded("Analyst") then
		U.SkinFrame(EconomyFrame)
		EconomyFrame:SetHeight(450)
		EconomyFrame:SetWidth(364)
		EconomyFrameTitleFrame:ClearAllPoints()
		EconomyFrameTitleFrame:SetPoint("TOP", EconomyFrame, "TOP", 0, -5)
		U.SkinCloseButton(EconomyFrameCloseButton)
		U.SkinFrame(EconomyFrameTopStats)
		U.SkinFrame(EconomyFrameLeftStats)
		U.SkinFrame(EconomyFrameRightStats)
		U.SkinDropDownBox(EconomyFramePeriodDropDown)
		U.SkinDropDownBox(EconomyFrameLeftStatsReportDropDown)
		U.SkinDropDownBox(EconomyFrameRightStatsReportDropDown)
		U.SkinCheckBox(EconomyFrameAllCharacters)
	end

	if IsAddOnLoaded("EveryGoldToBanker") then
		U.SkinFrame(EveryGoldToBankerCalculator)
		U.SkinFrame(SettingFrame)
		U.SkinEditBox(AmountEditBox)
		AmountEditBox:Height(22)
		U.SkinEditBox(ReceiverEditBox)
		ReceiverEditBox:Height(22)
		U.SkinEditBox(DefaultAmountEditBox)
		DefaultAmountEditBox:Height(22)
		U.SkinEditBox(DefaultReceiverEditBox)
		DefaultReceiverEditBox:Height(22)
		U.SkinButton(CheckButton)
		U.SkinButton(SendButton)
		U.SkinButton(SettingButton)
		U.SkinButton(DoneSettingButton)
		TitleFrame:StripTextures()
		AmountFrame:StripTextures()
		ResponseFrame:StripTextures()
		ReceiverFrame:StripTextures()
		DefaultAmountFrame:StripTextures()
		DefaultReceiverFrame:StripTextures()
	end

	if IsAddOnLoaded("Cork") then
		U.SkinBackdropFrame(Corkboard, true)
		Corkboard:HookScript("OnUpdate", function(self) self:StripTextures() end)
	end
	
	if IsAddOnLoaded("EavesDrop") then
		U.SkinFrame(EavesDropFrame)
		U.SkinFrame(EavesDropHistoryFrame)
		U.SkinTab(EavesDropTab)
		EavesDropTab.backdrop:Point("TOPLEFT", 0, -5)
		EavesDropTab.backdrop:Point("BOTTOMRIGHT", 0, 2)
		EavesDropTabText:ClearAllPoints()
		EavesDropTabText:SetPoint("CENTER", EavesDropTab, "CENTER", 0, -2)
		U.SkinButton(EavesDropHistoryFrameReset)
		U.SkinCloseButton(EavesDropHistoryFrameClose)
	end
	
	LoadAddOn("Blizzard_TradeSkillUI")
	if IsAddOnLoaded("DoubleWideTradeSkills") then
		TradeSkillListScrollFrame:StripTextures()
		TradeSkillFrame:SetTemplate("Transparent")
		U.SkinStatusBar(TradeSkillRankFrame)
	end
	
	--TrainAll
	LoadAddOn("Blizzard_TrainerUI")
	ClassTrainerFrame:HookScript("OnShow", function()
		if ClassTrainerTrainAllButton then
			U.SkinFrame(ClassTrainerTrainAllButton,"Default")
			U.SkinFrame(ClassTrainerTrainButton,"Default")
		end
	end)
end

U.RegisterSkin(name,MiscFixes)