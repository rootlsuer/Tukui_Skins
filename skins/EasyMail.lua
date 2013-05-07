if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "EasyMailSkin"
function US:SkinEasyMail(event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	MailFrame:Size(360,440)
	US:SkinButton(EasyMail_CheckAllButton)
	US:SkinButton(EasyMail_CheckPageButton)
	US:SkinButton(EasyMail_GetAllButton)
	US:SkinButton(EasyMail_AttButton)
	US:SkinButton(EasyMail_ForwardButton)
	US:SkinNextPrevButton(EasyMail_MailButton)

	for i = 1, 7 do
		US:SkinCheckBox(_G["EasyMail_CheckButton"..i])
	end

	EasyMail_ForwardButton:Point("RIGHT", OpenMailReplyButton, "LEFT", -2, 0)
	InboxTooMuchMail:Point("TOPLEFT", MailFrame, "TOPLEFT", 4, -10)
	InboxPrevPageButton:Point("BOTTOMLEFT", InboxFrame, "BOTTOMLEFT", 42, 100)
	InboxNextPageButton:Point("LEFT", InboxPrevPageButton, "RIGHT", 215, 0)
	EasyMail_CheckAllButton:Point("TOPLEFT", InboxFrame, "TOPLEFT", 42, -45)
	EasyMail_CheckPageButton:Point("LEFT", EasyMail_CheckAllButton, "RIGHT", 4, 0)
	EasyMail_GetAllButton:Point("LEFT", EasyMail_CheckPageButton, "RIGHT", 4, 0)
	EasyMail_MailButton:Point("TOPLEFT", SendMailNameEditBox, "TOPRIGHT", 4, 2)
	EasyMail_MailButton:Size(22)
	EasyMail_MailDropdownBackdrop:SetTemplate("Transparent")
	OpenMailCancelButton:Point("BOTTOMRIGHT", OpenMailFrame, "BOTTOMRIGHT", -3, 3)
	hooksecurefunc("OpenMail_Update", function()
		EasyMail_AttButton:ClearAllPoints()
		EasyMail_AttButton:Point("TOP", OpenMailScrollFrame, "BOTTOM", 13, -5)
	end)
	for i = 1, 7 do	
		local t = _G["MailItem"..i.."ExpireTime"]
		if t then
			t:ClearAllPoints()
			t:Point("TOPRIGHT", -10, -4)
		end				
	end
	US:UnregisterEvent(name, self, event)
end

US:RegisterSkin(name, US.SkinEasyMail, "MAIL_SHOW")