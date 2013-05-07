if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "RaidInviteOrganizerSkin"
function US:SkinRaidInviteOrganizer()
	US:SkinFrame(RIO_MainFrame)
	US:SkinFrame(RIO_GuildMemberFrame)
	US:SkinFrame(RIO_CodeWordsContainer)
	RIO_SliderContainer:StripTextures(True)
	US:SkinScrollBar(RIO_GuildSlider)
	US:SkinCloseButton(RIO_CloseButtonThing)
	US:SkinButton(RIO_SelectAll)
	US:SkinButton(RIO_SelectNone)
	US:SkinButton(RIO_SendMassInvites)
	US:SkinButton(RIO_SaveCodeWordList)
	US:SkinButton(RIO_ToggleCodewordInvites)
	US:SkinCheckBox(RIO_ShowOfflineBox)
	US:SkinCheckBox(RIO_GuildMessageAtStart)
	US:SkinCheckBox(RIO_NotifyWhenTimerDone)
	US:SkinCheckBox(RIO_OnlyGuildMembers)
	US:SkinCheckBox(RIO_AlwaysInviteListen)
	US:SkinCheckBox(RIO_ShowMinimapIconConfig)
	US:SkinCheckBox(RIO_AutoSet25manBox)
	US:SkinCheckBox(RIO_AutoSetDifficultyBox)
	US:SkinCheckBox(RIO_AutoSetMasterLooter)

	RIO_MainFrameTab1:Point("TOPLEFT", RIO_MainFrame, "BOTTOMLEFT", -5, 2)
	RIO_MainFrameTab2:Point("LEFT", RIO_MainFrameTab1, "RIGHT", -2, 0)
	RIO_MainFrameTab3:Point("LEFT", RIO_MainFrameTab2, "RIGHT", -2, 0)

	for i = 1, 3 do
		US:SkinTab(_G["RIO_MainFrameTab"..i])
	end

	for i = 1, 10 do
		US:SkinCheckBox(_G["RIO_ShowRank"..i])
	end
end

US:RegisterSkin(name, US.SkinRaidInviteOrganizer)