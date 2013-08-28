if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'xMerchantSkin'
function AS:SkinxMerchant()
	AS:SkinCheckBox(NuuhMerchantFrameTooltipSearching)
	NuuhMerchantFrame:StripTextures(true)
	AS:SkinFrame(NuuhMerchantFrameSearch, 'Default')
	AS:SkinScrollBar(NuuhMerchantScrollFrameScrollBar)
	for i = 1, 10, 1 do
		AS:SkinTexture(_G['NuuhMerchantFrame'..i].icon)
	end
end

AS:RegisterSkin(name, AS.SkinxMerchant)