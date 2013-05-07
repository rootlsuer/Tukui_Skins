if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "OdysseySkin"
function US:SkinOdyssey()
	OdysseyMapsMenuScrollFrame:StripTextures(true)
	OdysseyFrameQuestDetailsSeries:StripTextures(true)
	OdysseyFrameSearchScrollFrame:StripTextures(true)
	OdysseyFramePortrait:Kill()
	US:SkinFrame(OdysseyFrame)
	US:SkinFrame(OdysseyFrameRealmSummaryScrollFrame)
	US:SkinFrame(OdysseyFrameQuestDB)
	US:SkinFrame(OdysseyFrameQuestDBScrollFrame)
	US:SkinFrame(OdysseyFrameQuestDetails)
	US:SkinFrame(OdysseyFrameZoneMaps)
	US:SkinScrollBar(OdysseyFrameQuestDBScrollFrameScrollBar)
	US:SkinScrollBar(OdysseyFrameRealmSummaryScrollFrameScrollBar)
	US:SkinScrollBar(OdysseyMapsMenuScrollFrameScrollBar)
	US:SkinEditBox(OdysseyFrame_SearchEditBox)
	US:SkinEditBox(OdysseyFrameQuestDB_MinLevel)
	US:SkinEditBox(OdysseyFrameQuestDB_MaxLevel)
	OdysseyFrame_ResetButton:Point("TOPLEFT", OdysseyFrame, "TOPLEFT", 55, -77)
	OdysseyFrameTab1:Point("TOPLEFT", OdysseyFrame, "BOTTOMLEFT", -5, 2)
	US:SkinButton(OdysseyFrame_ResetButton)
	US:SkinButton(OdysseyFrame_SearchButton)
	US:SkinButton(OdysseyFrameQuestDB_GetHistory)
	US:SkinCloseButton(OdysseyFrameCloseButton)
	US:SkinNextPrevButton(OdysseyFrameQuestDetailsGoBack)
	US:SkinNextPrevButton(OdysseyFrameQuestDetailsGoForward)
	US:SkinDropDownBox(OdysseyFrameRealmSummary_SelectContinent)
	US:SkinScrollBar(OdysseyFrameSearchScrollFrameScrollBar)
	for i = 1, 3 do
		US:SkinTab(_G["OdysseyFrameTab"..i])
		US:SkinFrame(_G["OdysseyTabQuestsMenuItem"..i])
	end
	for i = 1, 5 do
		US:SkinFrame(_G["OdysseyTabQuests_Sort"..i])
	end
	for i = 1, 15 do
		US:SkinFrame(_G["OdysseyTabMapsMenuItem"..i])
	end
	for i = 1, 4 do
		US:SkinFrame(_G["OdysseyTabSearchMenuItem"..i])
	end
	for i = 1, 10 do
		US:SkinBackdropFrame(_G["OdysseyFrameRealmSummaryEntry1Item"..i], true, true)
		US:SkinBackdropFrame(_G["OdysseyFrameRealmSummaryEntry2Item"..i], true, true)
		US:SkinBackdropFrame(_G["OdysseyFrameRealmSummaryEntry3Item"..i], true, true)
		US:SkinBackdropFrame(_G["OdysseyFrameRealmSummaryEntry4Item"..i], true, true)
		US:SkinBackdropFrame(_G["OdysseyFrameRealmSummaryEntry5Item"..i], true, true)
		US:SkinBackdropFrame(_G["OdysseyFrameRealmSummaryEntry6Item"..i], true, true)
		US:SkinBackdropFrame(_G["OdysseyFrameRealmSummaryEntry7Item"..i], true, true)
		US:SkinBackdropFrame(_G["OdysseyFrameRealmSummaryEntry8Item"..i], true, true)
	end
	US:SkinTooltip(OdyTooltip)
end

US:RegisterSkin(name, US.SkinOdyssey)