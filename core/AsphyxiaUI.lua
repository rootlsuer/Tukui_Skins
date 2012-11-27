function ColorAsphyxiaUI()
	local AsphyxiaUIFrames = {
		"AsphyxiaUIDataBar1_Panel",
		"AsphyxiaUIDataBar2_Panel",
		"AsphyxiaUIDataBar3_Panel",
		"AsphyxiaUIDataBar4_Panel",
		"TukuiPlayer_Reputation.backdrop",
		"TukuiPlayer_Experience.backdrop",
		"AsphyxiaUISplitBarLeft",
		"AsphyxiaUISplitBarRight",
		"AsphyxiaUIInfoCenterLeft",
		"AsphyxiaUIInfoCenter",
		"AsphyxiaUIInfoCenterRight",
		"AsphyxiaUIRightBar",
		"AsphyxiaUITimeWatch",
		"AsphyxiaUILocationPanelZoneText",
		"AsphyxiaUIStanceBarBorder",
		"AsphyxiaUIControlPanelExtraBackground",
		"AsphyxiaUIControlPanelExtraBackgroundHeader",
		"AsphyxiaUIControlPanelActionbarBackground",
		"AsphyxiaUIControlPanelActionbarBackgroundHeader",
		"AsphyxiaUIAddOnManagerBackground",
		"AsphyxiaUIAddOnManagerBackgroundHeader",
		"TukuiXCoordsPanel",
		"TukuiYCoordsPanel",
		"AsphyxiaUILayoutSwitchIcon",
	}

	for _, object in pairs(AsphyxiaUIFrames) do
		if _G[object] then cUpdateColor(_G[object]) end
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
		"TukuiToggle1",
		"TukuiToggle2",
		"TukuiToggle3",
		"TukuiToggle4",
		"TukuiToggle5",
		"TukuiToggle6",
	}

	for _, object in pairs(AsphyxiaUIButtons) do
		if _G[object] then
			cUpdateColor(_G[object])
			_G[object]:HookScript("OnEnter", TSSetModifiedBackdrop)
			_G[object]:HookScript("OnLeave", TSSetOriginalBackdrop)
		end
	end
	for i = 4, 5 do
		_G["TukuiToggle"..i]:HookScript("OnUpdate", function(self) cUpdateColor(self) end)
	end

	cColorScrollBar(AsphyxiaUIAddOnManagerBackgroundScrollFrameScrollBar)
end