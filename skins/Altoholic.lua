if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "AltoholicSkin"
function US:SkinAltoholic(event, addon)
	if event == "PLAYER_ENTERING_WORLD" then
		US:SkinTooltip(AltoTooltip)
		AltoholicFramePortrait:Kill()
		US:SkinFrame(AltoholicFrame)
		US:SkinFrame(AltoMsgBox)
		US:SkinButton(AltoMsgBoxYesButton)
		US:SkinButton(AltoMsgBoxNoButton)
		US:SkinCloseButton(AltoholicFrameCloseButton)
		US:SkinEditBox(AltoholicFrame_SearchEditBox)
		US:SkinButton(AltoholicFrame_ResetButton)
		US:SkinButton(AltoholicFrame_SearchButton)
		AltoholicFrameTab1:Point("TOPLEFT", AltoholicFrame, "BOTTOMLEFT", -5, 2)
		AltoholicFrame_ResetButton:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 25, -77)
		AltoholicFrame_SearchEditBox:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 37, -56)
		AltoholicFrame_ResetButton:Size(85, 24)
		AltoholicFrame_SearchButton:Size(85, 24)
		AltoholicFrame_SearchEditBox:Size(175, 15)
	end

	if addon == "Altoholic_Summary" then
		US:SkinFrame(AltoholicFrameSummary)
		US:SkinFrame(AltoholicFrameBagUsage)
		US:SkinFrame(AltoholicFrameSkills)
		US:SkinFrame(AltoholicFrameActivity)
		US:SkinScrollBar(AltoholicFrameSummaryScrollFrameScrollBar)
		US:SkinScrollBar(AltoholicFrameBagUsageScrollFrameScrollBar)
		US:SkinScrollBar(AltoholicFrameSkillsScrollFrameScrollBar)
		US:SkinScrollBar(AltoholicFrameActivityScrollFrameScrollBar)
		US:SkinDropDownBox(AltoholicTabSummary_SelectLocation)
		AltoholicTabSummary_SelectLocation:Width(200)
		AltoholicFrameSummaryScrollFrame:StripTextures(true)
		AltoholicFrameBagUsageScrollFrame:StripTextures(true)
		AltoholicFrameSkillsScrollFrame:StripTextures(true)
		AltoholicFrameActivityScrollFrame:StripTextures(true)
		for i = 1, 4 do
			US:SkinButton(_G["AltoholicTabSummaryMenuItem"..i], true)
		end
		for i = 1, 8 do
			US:SkinButton(_G["AltoholicTabSummary_Sort"..i], true)
		end
		for i = 1, 7 do
			US:SkinTab(_G["AltoholicFrameTab"..i], true)
		end
	end
	
	if addon == "Altoholic_Characters" then
		US:SkinFrame(AltoholicFrameContainers)
		US:SkinFrame(AltoholicFrameRecipes)
		US:SkinFrame(AltoholicFrameQuests)
		US:SkinFrame(AltoholicFrameGlyphs)
		US:SkinFrame(AltoholicFrameMail)
		US:SkinFrame(AltoholicFrameSpellbook)
		US:SkinFrame(AltoholicFramePets)
		US:SkinFrame(AltoholicFrameAuctions)
		US:SkinScrollBar(AltoholicFrameContainersScrollFrameScrollBar)
		US:SkinScrollBar(AltoholicFrameQuestsScrollFrameScrollBar)
		US:SkinScrollBar(AltoholicFrameRecipesScrollFrameScrollBar)
		US:SkinDropDownBox(AltoholicFrameTalents_SelectMember)
		US:SkinDropDownBox(AltoholicTabCharacters_SelectRealm)
		US:SkinNextPrevButton(AltoholicFrameSpellbookPrevPage)
		US:SkinNextPrevButton(AltoholicFrameSpellbookNextPage)
		US:SkinNextPrevButton(AltoholicFramePetsNormalPrevPage)
		US:SkinNextPrevButton(AltoholicFramePetsNormalNextPage)
		US:SkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateLeftButton)
		US:SkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateRightButton)
		US:SkinButton(AltoholicTabCharacters_Sort1)
		US:SkinButton(AltoholicTabCharacters_Sort2)
		US:SkinButton(AltoholicTabCharacters_Sort3)
		AltoholicFrameContainersScrollFrame:StripTextures(true)
		AltoholicFrameQuestsScrollFrame:StripTextures(true)
		AltoholicFrameRecipesScrollFrame:StripTextures(true)
		for i = 1, 14 do
			US:SkinBackdropFrame(_G["AltoholicFrameContainersEntry1Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameContainersEntry2Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameContainersEntry3Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameContainersEntry4Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameContainersEntry5Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameContainersEntry6Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameContainersEntry7Item"..i], true, true)
		end
	end

	if addon == "Altoholic_Achievements" then
		US:SkinBackdropFrame(AltoholicFrameAchievements, true)
		AltoholicFrameAchievementsScrollFrame:StripTextures(true)
		AltoholicAchievementsMenuScrollFrame:StripTextures(true)
		US:SkinScrollBar(AltoholicFrameAchievementsScrollFrameScrollBar)
		US:SkinScrollBar(AltoholicAchievementsMenuScrollFrameScrollBar)
		US:SkinDropDownBox(AltoholicTabAchievements_SelectRealm)
		AltoholicTabAchievements_SelectRealm:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 205, -57)

		for i = 1, 15 do
			US:SkinButton(_G["AltoholicTabAchievementsMenuItem"..i], true)
		end

		for i = 1, 10 do
			US:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry1Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry2Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry3Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry4Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry5Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry6Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry7Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry8Item"..i], true, true)
		end
	end

	if addon == "Altoholic_Agenda" then
		US:SkinFrame(AltoholicFrameCalendarScrollFrame)
		US:SkinFrame(AltoholicTabAgendaMenuItem1)
		US:SkinScrollBar(AltoholicFrameCalendarScrollFrameScrollBar)
		US:SkinNextPrevButton(AltoholicFrameCalendar_NextMonth)
		US:SkinNextPrevButton(AltoholicFrameCalendar_PrevMonth)
		US:SkinButton(AltoholicTabAgendaMenuItem1, true)

		for i = 1, 14 do
			US:SkinFrame(_G["AltoholicFrameCalendarEntry"..i])
		end
	end

	if addon == "Altoholic_Grids" then
		AltoholicFrameGridsScrollFrame:StripTextures(true)
		US:SkinBackdropFrame(AltoholicFrameGrids)
		US:SkinScrollBar(AltoholicFrameGridsScrollFrameScrollBar)
		US:SkinDropDownBox(AltoholicTabGrids_SelectRealm)
		US:SkinDropDownBox(AltoholicTabGrids_SelectView)

		for i = 1, 10 do
			US:SkinBackdropFrame(_G["AltoholicFrameGridsEntry1Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGridsEntry2Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGridsEntry3Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGridsEntry4Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGridsEntry5Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGridsEntry6Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGridsEntry7Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGridsEntry8Item"..i], true, true)
		end
	end

	if addon == "Altoholic_Guild" then
		US:SkinFrame(AltoholicFrameGuildMembers)
		US:SkinFrame(AltoholicFrameGuildBank)
		US:SkinScrollBar(AltoholicFrameGuildMembersScrollFrameScrollBar)
		AltoholicFrameGuildMembersScrollFrame:StripTextures(true)

		for i = 1, 2 do
			US:SkinButton(_G["AltoholicTabGuildMenuItem"..i])
		end

		for i = 1, 14 do
			US:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry1Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry2Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry3Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry4Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry5Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry6Item"..i], true, true)
			US:SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry7Item"..i], true, true)
		end

		for i = 1, 19 do
			US:SkinBackdropFrame(_G["AltoholicFrameGuildMembersItem"..i], true, true)
		end

		for i = 1, 5 do
			US:SkinButton(_G["AltoholicTabGuild_Sort"..i])
		end
	end

	if addon == "Altoholic_Search" then
		US:SkinBackdropFrame(AltoholicFrameSearch, true)
		AltoholicFrameSearchScrollFrame:StripTextures(true)
		AltoholicSearchMenuScrollFrame:StripTextures(true)
		US:SkinScrollBar(AltoholicFrameSearchScrollFrameScrollBar)
		US:SkinScrollBar(AltoholicSearchMenuScrollFrameScrollBar)
		US:SkinDropDownBox(AltoholicTabSearch_SelectRarity)
		US:SkinDropDownBox(AltoholicTabSearch_SelectSlot)
		US:SkinDropDownBox(AltoholicTabSearch_SelectLocation)
		AltoholicTabSearch_SelectRarity:Size(125, 32)
		AltoholicTabSearch_SelectSlot:Size(125, 32)
		AltoholicTabSearch_SelectLocation:Size(175, 32)
		US:SkinEditBox(_G["AltoholicTabSearch_MinLevel"])
		US:SkinEditBox(_G["AltoholicTabSearch_MaxLevel"])

		for i = 1, 15 do
			US:SkinButton(_G["AltoholicTabSearchMenuItem"..i])
		end

		for i = 1, 8 do
			US:SkinButton(_G["AltoholicTabSearch_Sort"..i])
		end
	end
end

US:RegisterSkin(name, US.SkinAltoholic, "ADDON_LOADED")