if not IsAddOnLoaded("ExtVendor") then return end
local U = unpack(select(2,...))
local name = "ExtVendorSkin"
local function SkinExtVendor(self)
	local s = U.s
	local c = U.c
	U.SkinFrame(MerchantFrame)
	U.SkinButton(MerchantFrameFilterButton)
	U.SkinButton(MerchantFrameSellJunkButton)

	for i = 1, 20 do
		local b = _G["MerchantItem"..i.."ItemButton"]
		local t = _G["MerchantItem"..i.."ItemButtonIconTexture"]
		local item_bar = _G["MerchantItem"..i]
		item_bar:StripTextures(true)
		b:StripTextures()
		b:StyleButton(false)
		b:Point("TOPLEFT", item_bar, "TOPLEFT", 4, -4)
		t:SetTexCoord(.08, .92, .08, .92)
		t:ClearAllPoints()
		t:Point("TOPLEFT", 2, -2)
		t:Point("BOTTOMRIGHT", -2, 2)
		item_bar:CreateBackdrop("Transparent")
		b:SetTemplate("Transparent", true)
	end
	MerchantFrame:Width(690)
	ExtVendor_SellJunkPopup:SetTemplate("Transparent")
	U.SkinButton(ExtVendor_SellJunkPopupYesButton)
	U.SkinButton(ExtVendor_SellJunkPopupNoButton)
end

U.RegisterSkin(name,SkinExtVendor)

