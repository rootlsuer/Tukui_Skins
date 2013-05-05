if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "InboxMailBagSkin"
local function SkinInboxMailBag(self, event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	InboxMailbagFrame:StripTextures()
	U.SkinEditBox(InboxMailbagFrameItemSearchBox)
	U.SkinCheckBox(InboxMailbagFrameItemGroupStacksCheckBox)
	U.SkinTab(MailFrameTab3)
	for i = 1, 99 do
		local name = _G["InboxMailbagFrameItem"..i]
		if not name then return end
		U.SkinIconButton(name, true, true)
	end
end

U.RegisterSkin(name, SkinInboxMailBag, "MAIL_SHOW")