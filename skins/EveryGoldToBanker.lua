if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "EveryGoldToBankerSkin"
function US:SkinEveryGoldToBanker()
	US:SkinFrame(EveryGoldToBankerCalculator)
	US:SkinFrame(SettingFrame)
	US:SkinEditBox(AmountEditBox)
	AmountEditBox:Height(22)
	US:SkinEditBox(ReceiverEditBox)
	ReceiverEditBox:Height(22)
	US:SkinEditBox(DefaultAmountEditBox)
	DefaultAmountEditBox:Height(22)
	US:SkinEditBox(DefaultReceiverEditBox)
	DefaultReceiverEditBox:Height(22)
	US:SkinButton(CheckButton)
	US:SkinButton(SendButton)
	US:SkinButton(SettingButton)
	US:SkinButton(DoneSettingButton)
	TitleFrame:StripTextures()
	AmountFrame:StripTextures()
	ResponseFrame:StripTextures()
	ReceiverFrame:StripTextures()
	DefaultAmountFrame:StripTextures()
	DefaultReceiverFrame:StripTextures()
end

US:RegisterSkin(name, US.SkinEveryGoldToBanker)