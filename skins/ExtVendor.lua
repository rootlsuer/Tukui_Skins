if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "ExtVendorSkin"
function US:SkinExtVendor()
	US:SkinFrame(MerchantFrame)
	US:SkinButton(MerchantFrameFilterButton)
	US:SkinBackdropFrame(MerchantFrameSellJunkButton)
	US:SkinEditBox(MerchantFrameSearchBox)

	for i = 1, 20 do
		local b = _G["MerchantItem"..i.."ItemButton"]
		local t = _G["MerchantItem"..i.."ItemButtonIconTexture"]
		local item_bar = _G["MerchantItem"..i]
		b:StripTextures()
		b:StyleButton(false)
		b:Point("TOPLEFT", item_bar, "TOPLEFT", 4, -4)
		t:SetTexCoord(.08, .92, .08, .92)
		t:ClearAllPoints()
		t:Point("TOPLEFT", 2, -2)
		t:Point("BOTTOMRIGHT", -2, 2)
		US:SkinFrame(item_bar)
		b:SetTemplate("Transparent", true)
	end
	MerchantFrame:HookScript("OnUpdate", function()
		for i = 1, 20 do
			if _G["MerchantItem"..i.."AltCurrencyFrame"] then
				_G["MerchantItem"..i.."AltCurrencyFrame"]:SetPoint("BOTTOMLEFT", _G["MerchantItem"..i.."NameFrame"], "BOTTOMLEFT", 3, 34)
			end
		end
	end)
	MerchantFrame:Width(690)
	ExtVendor_SellJunkPopup:SetTemplate("Transparent")
	US:SkinButton(ExtVendor_SellJunkPopupYesButton)
	US:SkinButton(ExtVendor_SellJunkPopupNoButton)
end

US:RegisterSkin(name, US.SkinExtVendor)