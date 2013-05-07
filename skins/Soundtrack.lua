if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "SoundtrackSkin"
function US:SkinSoundtrack()
	local frames = {
		"SoundtrackFrame",
		"SoundtrackFrameEventList",
		"SoundtrackFrameTrackList",
		"SoundtrackFrame_AssignedFrame",
		"SoundtrackReportFrame",
	}

	local buttons = {
		"SoundtrackFrame_CloseButton",
		"SoundtrackFrameCopyCopiedTracksButton",
		"SoundtrackFramePasteCopiedTracksButton",
		"SoundtrackFrameClearCopiedTracksButton",
		"SoundtrackFrameMoveUp",
		"SoundtrackFrameMoveDown",
		"SoundtrackFrameClearButton",
		"SoundtrackFrameAllButton",
		"SoundtrackFrameDeleteTargetButton",
		"SoundtrackFrameAddBossTargetButton",
		"SoundtrackFrameAddWorldBossTargetButton",
		"SoundtrackFrameRemoveZoneButton",
		"SoundtrackFrameAddZoneButton",
		"SoundtrackFrameDeletePetBattlesTargetButton",
		"SoundtrackFrameAddPetBattlesTargetButton",
		"SoundtrackFrameDeleteCustomEventButton",
		"SoundtrackFrameAddCustomEventButton",
		"SoundtrackFrameEditCustomEventButton",
		"SoundtrackFrameDeletePlaylistButton",
		"SoundtrackFrameAddPlaylistButton",
		"SoundtrackFrame_LoadProject",
		"SoundtrackFrame_RemoveProject",
		"SoundtrackReportFrame_Say",
		"SoundtrackReportFrame_Party",
		"SoundtrackReportFrame_Guild",
		"SoundtrackReportFrame_Whisper",
		"SoundtrackReportFrame_Channel",
		"SoundtrackReportFrame_Cancel",
	}

	local cboxes = {
		"SoundtrackFrame_EnableMinimapButton",
		"SoundtrackFrame_ShowPlaybackControls",
		"SoundtrackFrame_LockPlaybackControls",
		"SoundtrackFrame_ShowTrackInformation",
		"SoundtrackFrame_LockNowPlayingFrame",
		"SoundtrackFrame_ShowDefaultMusic",
		"SoundtrackFrame_HidePlaybackButtons",
		"SoundtrackFrame_AutoAddZones",
		"SoundtrackFrame_AutoEscalateBattleMusic",
		"SoundtrackFrame_YourEnemyLevelOnly",
		"SoundtrackFrame_LoopMusic",
		"SoundtrackFrame_EnableMusic",
		"SoundtrackFrame_EnableZoneMusic",
		"SoundtrackFrame_EnableBattleMusic",
		"SoundtrackFrame_EnableMiscMusic",
		"SoundtrackFrame_EnableCustomMusic",
		"SoundtrackFrame_EnableDebugMode",
		"SoundtrackFrame_ShowEventStack",
		"SoundtrackFrameTrackButton1CheckBox",
		"SoundtrackFrameTrackButton2CheckBox",
		"SoundtrackFrameTrackButton3CheckBox",
		"SoundtrackFrameTrackButton4CheckBox",
		"SoundtrackFrameTrackButton5CheckBox",
		"SoundtrackFrameTrackButton6CheckBox",
		"SoundtrackFrameTrackButton7CheckBox",
		"SoundtrackFrameTrackButton8CheckBox",
		"SoundtrackFrameTrackButton9CheckBox",
		"SoundtrackFrameTrackButton10CheckBox",
		"SoundtrackFrameTrackButton11CheckBox",
		"SoundtrackFrameTrackButton12CheckBox",
		"SoundtrackFrameTrackButton13CheckBox",
		"SoundtrackFrameTrackButton14CheckBox",
		"SoundtrackFrameTrackButton15CheckBox",
		"SoundtrackAssignedTrackButton1CheckBox",
		"SoundtrackAssignedTrackButton2CheckBox",
		"SoundtrackAssignedTrackButton3CheckBox",
		"SoundtrackAssignedTrackButton4CheckBox",
		"SoundtrackAssignedTrackButton5CheckBox",
		"SoundtrackAssignedTrackButton6CheckBox",
	}

	for _, object in pairs(frames) do
		if _G[object] then
			US:SkinFrame(_G[object])
		end
	end

	for _, object in pairs(buttons) do
		if _G[object] then
			US:SkinButton(_G[object])
		end
	end

	for _, object in pairs(cboxes) do
		if _G[object] then
			US:SkinCheckBox(_G[object])
		end
	end

	for i = 1, 10 do
		US:SkinTab(_G["SoundtrackFrameTab"..i])
	end

	SoundtrackFrameTab1:SetPoint("TOPLEFT", SoundtrackFrame, "BOTTOMLEFT", 10, 2)
	SoundtrackFrame_CloseButton:SetPoint("BOTTOMRIGHT", SoundtrackFrame, "BOTTOMRIGHT", -15, 5)

	US:SkinCloseButton(SoundtrackFrame_TopCloseButton)
	US:SkinStatusBar(SoundtrackFrame_StatusBarTrack)
	SoundtrackFrame_StatusBarTrackBorder:Kill()
	US:SkinStatusBar(SoundtrackFrame_StatusBarEvent)
	SoundtrackFrame_StatusBarEventBorder:Kill()
	SoundtrackFrame_TrackFilter:StripTextures()
	SoundtrackFrame_TrackFilter:SetHeight(18)
	US:SkinEditBox(SoundtrackFrame_TrackFilter)
	US:SkinBackdropFrame(NowPlayingTextFrame)
	US:SkinScrollBar(SoundtrackFrameTrackScrollFrameScrollBar)
	US:SkinScrollBar(SoundtrackFrameAssignedTracksScrollFrameScrollBar)
	US:SkinScrollBar(SoundtrackFrameEventScrollFrameScrollBar)
	US:SkinDropDownBox(SoundtrackFrame_ColumnHeaderNameDropDown)
	US:SkinDropDownBox(SoundtrackFrame_PlaybackButtonsLocationDropDown)
	US:SkinDropDownBox(SoundtrackFrame_BattleCooldownDropDown)
	US:SkinDropDownBox(SoundtrackFrame_LowHealthPercentDropDown)
	US:SkinDropDownBox(SoundtrackFrame_SilenceDropDown)
	US:SkinDropDownBox(SoundtrackFrame_ProjectDropDown)
	US:SkinBackdropFrame(SoundtrackControlFrame)
	US:SkinStatusBar(SoundtrackControlFrame_StatusBarTrack)
	SoundtrackControlFrame_StatusBarTrackBorder:Kill()
	US:SkinStatusBar(SoundtrackControlFrame_StatusBarEvent)
	SoundtrackControlFrame_StatusBarEventBorder:Kill()
	US:SkinEditBox(SoundtrackReportFrame_WhisperEditBox)
	US:SkinEditBox(SoundtrackReportFrame_ChannelEditBox)
	
	US:SkinTooltip(SoundtrackTooltip)
	NowPlayingTextFrame:Show()
	NowPlayingTextFrame:Hide()
	NowPlayingTextFrame:Size(200, 40)
end

US:RegisterSkin(name, US.SkinSoundtrack)