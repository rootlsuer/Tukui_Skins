if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = 'xMerchantSkin'
function US:SkinxMerchant()
	US:SkinCheckBox(NuuhMerchantFrameTooltipSearching)
	US:SkinFrameD(NuuhMerchantFrameSearch)
	US:SkinScrollBar(NuuhMerchantScrollFrameScrollBar)
end

US:RegisterSkin(name, US.SkinxMerchant)