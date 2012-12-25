function ColorAsphyxiaUI()
	local AsphyxiaUIFrames = {
		"AsphyxiaUIDataBar1_Panel",
		"AsphyxiaUIDataBar2_Panel",
		"AsphyxiaUIDataBar3_Panel",
		"AsphyxiaUIDataBar4_Panel",
		"AsphyxiaUIDataBarDataBarToggle",
		"AsphyxiaUIInfoPanelLeft",
		"AsphyxiaUIInfoPanelRight",
		"AsphyxiaUIInfoPanelCenter",
		"AsphyxiaUIActionBar1",
		"AsphyxiaUIActionBar2",
		"AsphyxiaUIActionBar3",
		"AsphyxiaUIActionBar4",
		"AsphyxiaUIActionBar5",
		"AsphyxiaUIActionBar6",
		"AsphyxiaUIActionBar1",
		"AsphyxiaUIChatBackgroundLeft",
		"AsphyxiaUIChatBackgroundRight",
		"AsphyxiaUIActionBarRightBar",
		"AsphyxiaUIActionBarSplitBarLeft",
		"AsphyxiaUIActionBarSplitBarRight",
		"AsphyxiaUIMinimapTimewatch",
		"AsphyxiaUIMinimapHelpButton",
		"AsphyxiaUIMinimapVersionButton",
		"AsphyxiaUIMinimap",
		"AsphyxiaUIMinimapToggleButton",
		"AsphyxiaUILocationPanelZoneText",
		"AsphyxiaUIStanceBarBorder",
		"AsphyxiaUIControlPanelExtraBackground",
		"AsphyxiaUIControlPanelExtraBackgroundHeader",
		"AsphyxiaUIControlPanelActionbarBackground",
		"AsphyxiaUIControlPanelActionbarBackgroundHeader",
		"AsphyxiaUIAddOnManagerBackground",
		"AsphyxiaUIAddOnManagerBackgroundHeader",
		"AsphyxiaUIXCoordsPanel",
		"AsphyxiaUIYCoordsPanel",
		"AsphyxiaUILayoutSwitchIcon",
	}

	for _, object in pairs(AsphyxiaUIFrames) do
		if _G[object] then cUpdateColor(_G[object]) end
	end

	local AsphyxiaUIBackdrops = {
		"oUF_Player_Reputation",
		"oUF_Player_Experience",
		"StanceButton1",
		"StanceButton2",
		"StanceButton3",
		"StanceButton4",
		"StanceButton5",
	}

	for _, object in pairs(AsphyxiaUIBackdrops) do
		if _G[object] then cUpdateColor(_G[object].backdrop) end
	end

	local AsphyxiaUIButtons = {
		"AsphyxiaUIReloadUIButton",
		"AsphyxiaUIControlPanelButton",
		"AsphyxiaUIResetUIButton",
		"AsphyxiaUIControlPanelExtraBackgroundCloseButton",
		"AsphyxiaUIControlPanelButtonsButtons1",
		"AsphyxiaUIControlPanelButtonsButtons2",
		"AsphyxiaUIControlPanelButtonsButtons3",
		"AsphyxiaUIControlPanelButtonsButtons4",
		"AsphyxiaUIControlPanelButtonsButtons5",
		"AsphyxiaUIControlPanelButtonsButtons6",
		"AsphyxiaUIControlPanelActionbarBackgroundCloseButton",
		"AsphyxiaUIAddOnManagerCloseButton",
		"AsphyxiaUIAddOnManagerSaveButton",
		"AsphyxiaUIToggle1",
		"AsphyxiaUIToggle2",
		"AsphyxiaUIToggle3",
		"AsphyxiaUIToggle4",
		"AsphyxiaUIToggle5",
		"AsphyxiaUIToggle6",
		"AsphyxiaUIToggle7",
		"AsphyxiaUIToggle8",
		"AsphyxiaUIToggle9",
		"AsphyxiaUIToggle10",
		"AsphyxiaUIToggle11",
		"AsphyxiaUIToggle12",
		"AsphyxiaUIToggle13",
		"AsphyxiaUIToggle14",
		"AsphyxiaUIToggle15",
	}

	for _, object in pairs(AsphyxiaUIButtons) do
		if _G[object] then
			cUpdateColor(_G[object])
			_G[object]:HookScript("OnEnter", TSSetModifiedBackdrop)
			_G[object]:HookScript("OnLeave", TSSetOriginalBackdrop)
		end
	end
	for i = 1, 15 do
		_G["AsphyxiaUIToggle"..i]:HookScript("OnUpdate", function(self) cUpdateColor(self) end)
	end

	cColorScrollBar(AsphyxiaUIAddOnManagerBackgroundScrollFrameScrollBar)

	for i = 1, 12 do
		if _G["MultiBarBottomRightButton"..i] then cUpdateColor(_G["MultiBarBottomRightButton"..i].backdrop) end
		if _G["MultiBarBottomLeftButton"..i] then cUpdateColor(_G["MultiBarBottomLeftButton"..i].backdrop) end
		if _G["MultiBarRightButton"..i] then cUpdateColor(_G["MultiBarRightButton"..i].backdrop) end
		if _G["MultiBarLeftButton"..i] then cUpdateColor(_G["MultiBarLeftButton"..i].backdrop) end
		if _G["ActionButton"..i] then cUpdateColor(_G["ActionButton"..i].backdrop) end
		if _G["PetActionButton"..i] then cUpdateColor(_G["PetActionButton"..i].backdrop) end
	end

	local function RecolorBuffs()
		for i = 1, 99 do
			if _G["AsphyxiaUIAurasPlayerBuffsAuraButton"..i] then
				cUpdateColor(_G["AsphyxiaUIAurasPlayerBuffsAuraButton"..i])

				if _G["AsphyxiaUIAurasPlayerBuffsAuraButton"..i].Holder then
					cUpdateColor(_G["AsphyxiaUIAurasPlayerBuffsAuraButton"..i].Holder)
				end
			end
		end
	end
	if not TSBuffColorer then
		TSBuffColorer = CreateFrame("Frame", "TSBuffColorer", UIParent)
		TSBuffColorer:RegisterEvent("UNIT_AURA")
		TSBuffColorer:SetScript("OnEvent", RecolorBuffs)
	end

end