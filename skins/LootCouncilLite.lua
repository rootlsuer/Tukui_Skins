if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "LootCouncilLiteSkin"
function US:SkinLootCouncilLite()
	US:SkinFrame(RankFrame)
	US:SkinDropDownBox(RankDropDown)
	US:SkinButton(RankAcceptButton)
	US:SkinButton(RankCancelButton)
	US:SkinFrame(MainFrame)
	US:SkinFrame(EntryFrame)
	US:SkinFrame(LCTestFrame)
	US:SkinButton(CloseButton)
	US:SkinButton(RunTestButton)
	US:SkinButton(TestCancelButton)
	US:SkinButton(AbortButton)
	for i = 1,40 do
		if _G["EntryFrameEntry"..i.."AgainstButton"] then US:SkinCloseButton(_G["EntryFrameEntry"..i.."AgainstButton"]) end
		if _G["EntryFrameEntry"..i.."ForButton"] then US:Desaturate(_G["EntryFrameEntry"..i.."ForButton"]) end
		if _G["EntryFrameEntry"..i.."CancelButton"] then US:Desaturate(_G["EntryFrameEntry"..i.."CancelButton"]) end
	end
end

US:RegisterSkin(name, US.SkinLootCouncilLite)