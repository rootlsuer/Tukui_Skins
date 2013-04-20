if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "AltoholicSkin"
local function SkinAltoholic()
	U.SkinTooltip(AltoTooltip)
	AltoholicFramePortrait:Kill()
	U.SkinFrame(AltoholicFrame)
	U.SkinFrame(AltoMsgBox)
	U.SkinButton(AltoMsgBoxYesButton)
	U.SkinButton(AltoMsgBoxNoButton)
	U.SkinCloseButton(AltoholicFrameCloseButton)
	U.SkinEditBox(AltoholicFrame_SearchEditBox)
	U.SkinButton(AltoholicFrame_ResetButton)
	U.SkinButton(AltoholicFrame_SearchButton)
	AltoholicFrameTab1:Point("TOPLEFT", AltoholicFrame, "BOTTOMLEFT", -5, 2)
	AltoholicFrame_ResetButton:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 25, -77)
	AltoholicFrame_SearchEditBox:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 37, -56)
	AltoholicFrame_ResetButton:Size(85, 24)
	AltoholicFrame_SearchButton:Size(85, 24)
	AltoholicFrame_SearchEditBox:Size(175, 15)

	local function LoadSkinSummary()
		U.SkinFrame(AltoholicFrameSummary)
		U.SkinFrame(AltoholicFrameBagUsage)
		U.SkinFrame(AltoholicFrameSkills)
		U.SkinFrame(AltoholicFrameActivity)
		U.SkinScrollBar(AltoholicFrameSummaryScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicFrameBagUsageScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicFrameSkillsScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicFrameActivityScrollFrameScrollBar)
		U.SkinDropDownBox(AltoholicTabSummary_SelectLocation)
		AltoholicTabSummary_SelectLocation:Width(200)
		AltoholicFrameSummaryScrollFrame:StripTextures(true)
		AltoholicFrameBagUsageScrollFrame:StripTextures(true)
		AltoholicFrameSkillsScrollFrame:StripTextures(true)
		AltoholicFrameActivityScrollFrame:StripTextures(true)
		for i = 1, 4 do
			U.SkinButton(_G["AltoholicTabSummaryMenuItem"..i], true)
		end
		for i = 1, 8 do
			U.SkinButton(_G["AltoholicTabSummary_Sort"..i], true)
		end
		for i = 1, 7 do
			U.SkinTab(_G["AltoholicFrameTab"..i], true)
		end
	end
	
	local function LoadSkinCharacters()
		U.SkinFrame(AltoholicFrameContainers)
		U.SkinFrame(AltoholicFrameRecipes)
		U.SkinFrame(AltoholicFrameQuests)
		U.SkinFrame(AltoholicFrameGlyphs)
		U.SkinFrame(AltoholicFrameMail)
		U.SkinFrame(AltoholicFrameSpellbook)
		U.SkinFrame(AltoholicFramePets)
		U.SkinFrame(AltoholicFrameAuctions)
		U.SkinScrollBar(AltoholicFrameContainersScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicFrameQuestsScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicFrameRecipesScrollFrameScrollBar)
		U.SkinDropDownBox(AltoholicFrameTalents_SelectMember)
		U.SkinDropDownBox(AltoholicTabCharacters_SelectRealm)
		U.SkinNextPrevButton(AltoholicFrameSpellbookPrevPage)
		U.SkinNextPrevButton(AltoholicFrameSpellbookNextPage)
		U.SkinNextPrevButton(AltoholicFramePetsNormalPrevPage)
		U.SkinNextPrevButton(AltoholicFramePetsNormalNextPage)
		U.SkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateLeftButton)
		U.SkinRotateButton(AltoholicFramePetsNormal_ModelFrameRotateRightButton)
		U.SkinButton(AltoholicTabCharacters_Sort1)
		U.SkinButton(AltoholicTabCharacters_Sort2)
		U.SkinButton(AltoholicTabCharacters_Sort3)
		AltoholicFrameContainersScrollFrame:StripTextures(true)
		AltoholicFrameQuestsScrollFrame:StripTextures(true)
		AltoholicFrameRecipesScrollFrame:StripTextures(true)
		for i = 1, 14 do
			U.SkinBackdropFrame(_G["AltoholicFrameContainersEntry1Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameContainersEntry2Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameContainersEntry3Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameContainersEntry4Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameContainersEntry5Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameContainersEntry6Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameContainersEntry7Item"..i], true, true)
		end
	end

	local function LoadSkinAchievements()
		U.SkinBackdropFrame(AltoholicFrameAchievements, true)
		AltoholicFrameAchievementsScrollFrame:StripTextures(true)
		AltoholicAchievementsMenuScrollFrame:StripTextures(true)
		U.SkinScrollBar(AltoholicFrameAchievementsScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicAchievementsMenuScrollFrameScrollBar)
		U.SkinDropDownBox(AltoholicTabAchievements_SelectRealm)
		AltoholicTabAchievements_SelectRealm:Point("TOPLEFT", AltoholicFrame, "TOPLEFT", 205, -57)

		for i = 1, 15 do
			U.SkinButton(_G["AltoholicTabAchievementsMenuItem"..i], true)
		end

		for i = 1, 10 do
			U.SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry1Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry2Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry3Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry4Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry5Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry6Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry7Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameAchievementsEntry8Item"..i], true, true)
		end
	end

	local function LoadSkinAgenda()
		U.SkinFrame(AltoholicFrameCalendarScrollFrame)
		U.SkinFrame(AltoholicTabAgendaMenuItem1)
		U.SkinScrollBar(AltoholicFrameCalendarScrollFrameScrollBar)
		U.SkinNextPrevButton(AltoholicFrameCalendar_NextMonth)
		U.SkinNextPrevButton(AltoholicFrameCalendar_PrevMonth)
		U.SkinButton(AltoholicTabAgendaMenuItem1, true)

		for i = 1, 14 do
			U.SkinFrame(_G["AltoholicFrameCalendarEntry"..i])
		end
	end

	local function LoadSkinGrids()
		AltoholicFrameGridsScrollFrame:StripTextures(true)
		U.SkinBackdropFrame(AltoholicFrameGrids)
		U.SkinScrollBar(AltoholicFrameGridsScrollFrameScrollBar)
		U.SkinDropDownBox(AltoholicTabGrids_SelectRealm)
		U.SkinDropDownBox(AltoholicTabGrids_SelectView)

		for i = 1, 10 do
			U.SkinBackdropFrame(_G["AltoholicFrameGridsEntry1Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGridsEntry2Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGridsEntry3Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGridsEntry4Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGridsEntry5Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGridsEntry6Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGridsEntry7Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGridsEntry8Item"..i], true, true)
		end
	end

	local function LoadSkinGuild()
		U.SkinFrame(AltoholicFrameGuildMembers)
		U.SkinFrame(AltoholicFrameGuildBank)
		U.SkinScrollBar(AltoholicFrameGuildMembersScrollFrameScrollBar)
		AltoholicFrameGuildMembersScrollFrame:StripTextures(true)

		for i = 1, 2 do
			U.SkinButton(_G["AltoholicTabGuildMenuItem"..i])
		end

		for i = 1, 14 do
			U.SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry1Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry2Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry3Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry4Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry5Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry6Item"..i], true, true)
			U.SkinBackdropFrame(_G["AltoholicFrameGuildBankEntry7Item"..i], true, true)
		end

		for i = 1, 19 do
			U.SkinBackdropFrame(_G["AltoholicFrameGuildMembersItem"..i], true, true)
		end

		for i = 1, 5 do
			U.SkinButton(_G["AltoholicTabGuild_Sort"..i])
		end
	end

	local function LoadSkinSearch()
		U.SkinBackdropFrame(AltoholicFrameSearch, true)
		AltoholicFrameSearchScrollFrame:StripTextures(true)
		AltoholicSearchMenuScrollFrame:StripTextures(true)
		U.SkinScrollBar(AltoholicFrameSearchScrollFrameScrollBar)
		U.SkinScrollBar(AltoholicSearchMenuScrollFrameScrollBar)
		U.SkinDropDownBox(AltoholicTabSearch_SelectRarity)
		U.SkinDropDownBox(AltoholicTabSearch_SelectSlot)
		U.SkinDropDownBox(AltoholicTabSearch_SelectLocation)
		AltoholicTabSearch_SelectRarity:Size(125, 32)
		AltoholicTabSearch_SelectSlot:Size(125, 32)
		AltoholicTabSearch_SelectLocation:Size(175, 32)
		U.SkinEditBox(_G["AltoholicTabSearch_MinLevel"])
		U.SkinEditBox(_G["AltoholicTabSearch_MaxLevel"])

		for i = 1, 15 do
			U.SkinButton(_G["AltoholicTabSearchMenuItem"..i])
		end

		for i = 1, 8 do
			U.SkinButton(_G["AltoholicTabSearch_Sort"..i])
		end
	end

	U.A.SkinFuncs["Altoholic_Summary"] = LoadSkinSummary
	U.A.SkinFuncs["Altoholic_Characters"] = LoadSkinCharacters
	U.A.SkinFuncs["Altoholic_Achievements"] = LoadSkinAchievements
	U.A.SkinFuncs["Altoholic_Agenda"] = LoadSkinAgenda
	U.A.SkinFuncs["Altoholic_Grids"] = LoadSkinGrids
	U.A.SkinFuncs["Altoholic_Guild"] = LoadSkinGuild
	U.A.SkinFuncs["Altoholic_Search"] = LoadSkinSearch
end

U.RegisterSkin(name, SkinAltoholic)