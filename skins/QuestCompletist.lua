if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "QuestCompletistSkin"
function US:SkinQuestCompletist()
	local tooltips = {
		"qcMapTooltip",
		"qcQuestInformationTooltip",
		"qcToastTooltip",
		"qcQuestReputationTooltip",
		"qcNewDataAlertTooltip",
		"qcMutuallyExclusiveAlertTooltip",
	}

	for _, object in pairs(tooltips) do
		if _G[object] then
			_G[object]:SetFrameStrata("DIALOG")
			US:SkinTooltip(_G[object])
		end
	end

	US:SkinFrame(qcQuestCompletistUI)
	qcQuestCompletistUI:Size(360,450)
	US:SkinEditBox(qcSearchBox)
	US:SkinButton(qcOptionsButton)
	US:SkinButton(qcCategoryDropdownButton)
	US:SkinCloseButton(qcXButton)
	US:SkinSlideBar(qcMenuSlider, 16)
	qcMenuSlider:Point("TOPLEFT", qcQuestCompletistUI, "TOPLEFT", 303, -90)
	qcMenuSlider:Height(256)
end

US:RegisterSkin(name, US.SkinQuestCompletist)