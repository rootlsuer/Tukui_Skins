if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "MRTSkin"
function US:SkinMRT()
	US:SkinFrame(MRT_GUIFrame)
	US:SkinFrame(MRT_GUI_FourRowDialog)
	US:SkinCloseButton(MRT_GUIFrame_CloseButton)
	US:SkinButton(MRT_GUIFrame_RaidLog_Export_Button)
	US:SkinButton(MRT_GUIFrame_RaidLog_Delete_Button)
	US:SkinButton(MRT_GUIFrame_RaidLog_ExportNormal_Button)
	US:SkinButton(MRT_GUIFrame_RaidLog_ExportHeroic_Button)
	US:SkinButton(MRT_GUIFrame_RaidBosskills_Add_Button)
	US:SkinButton(MRT_GUIFrame_RaidBosskills_Delete_Button)
	US:SkinButton(MRT_GUIFrame_RaidBosskills_Export_Button)
	US:SkinButton(MRT_GUIFrame_RaidAttendees_Add_Button)
	US:SkinButton(MRT_GUIFrame_RaidAttendees_Delete_Button)
	US:SkinButton(MRT_GUIFrame_TakeSnapshot_Button)
	US:SkinButton(MRT_GUIFrame_StartNewRaid_Button)
	US:SkinButton(MRT_GUIFrame_MakeAttendanceCheck_Button)
	US:SkinButton(MRT_GUIFrame_EndCurrentRaid_Button)
	US:SkinButton(MRT_GUIFrame_ResumeLastRaid_Button)
	US:SkinButton(MRT_GUIFrame_BossLoot_Add_Button)
	US:SkinButton(MRT_GUIFrame_BossLoot_Modify_Button)
	US:SkinButton(MRT_GUIFrame_BossLoot_Delete_Button)
	US:SkinButton(MRT_GUIFrame_BossAttendees_Add_Button)
	US:SkinButton(MRT_GUIFrame_BossAttendees_Delete_Button)
	US:SkinButton(MRT_GUI_FourRowDialog_OKButton)
	US:SkinButton(MRT_GUI_FourRowDialog_CancelButton)
	for i = 1, 6 do
		US:SkinFrame(_G["ScrollTable"..i])
		_G["ScrollTable"..i.."ScrollFrameScrollBar"]:StripTextures(true)
		US:SkinScrollBar(_G["ScrollTable"..i.."ScrollFrameScrollBar"])
	end
	US:SkinTooltip(MRT_GUI_ItemTT)
	US:SkinTooltip(MRT_GUI_TT)
end

US:RegisterSkin(name, US.SkinMRT)