local U = unpack(select(2,...))

local name = 'xMerchantSkin'
local function SkinxMerchant(self)

	U.SkinCheckBox(xMerchantFrameTooltipSearching)
	U.SkinFrameD(xMerchantFrameSearch)
	U.SkinScrollBar(xMerchantScrollFrameScrollBar)

end

U.RegisterSkin(name, SkinxMerchant)