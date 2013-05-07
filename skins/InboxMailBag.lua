if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "InboxMailBagSkin"
function US:SkinInboxMailBag(event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	InboxMailbagFrame:StripTextures()
	US:SkinEditBox(InboxMailbagFrameItemSearchBox)
	US:SkinCheckBox(InboxMailbagFrameItemGroupStacksCheckBox)
	US:SkinTab(MailFrameTab3)
	for i = 1, 99 do
		local name = _G["InboxMailbagFrameItem"..i]
		if not name then return end
		US:SkinIconButton(name, true, true)
	end
	US:UnregisterEvent(name, self, event)
end

US:RegisterSkin(name, US.SkinInboxMailBag, "MAIL_SHOW")