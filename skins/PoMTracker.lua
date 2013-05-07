if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "PoMTrackerSkin"
function US:SkinPoMTracker()
	US:SkinFrame(PoMOptionFrame)
	US:SkinCloseButton(PoMOptionFrame_CloseButton)
	US:SkinBackdropFrame(pomtracker1)
	pomtracker1:Size(85,15)
	pomtracker2:ClearAllPoints()
	pomtracker2:Point("TOP", pomtracker1, "BOTTOM", 0, -5)
	US:SkinBackdropFrame(pomtracker2)
	US:SkinBackdropFrame(pomtracker3)
	pomtracker3:ClearAllPoints()
	pomtracker3:Point("TOP", pomtrackerstatusBar, "BOTTOM", 0, -5)
	pomtracker3:Height(15)
	US:SkinButton(pomtracker3_Button1)
	pomtrackerstatusBar:ClearAllPoints()
	pomtrackerstatusBar:Point("TOP", pomtracker2, "BOTTOM", 0, -5)
	US:SkinStatusBar(pomtrackerstatusBar)

	for i = 1,6 do
		US:SkinCheckBox(_G["PoMOptionFrame_CheckButton"..i])
	end
	pomtracker2:HookScript("OnUpdate", function() pomtrackerstatusBar:Width(pomtracker2:GetWidth()) pomtracker3:Width(pomtracker2:GetWidth()) end)
end

US:RegisterSkin(name, US.SkinPoMTracker)