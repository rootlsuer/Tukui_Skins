if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "BuyEmAllSkin"
function US:SkinBuyEmAll()
	US:SkinFrame(BuyEmAllFrame)
	US:SkinButton(BuyEmAllStackButton)
	US:SkinButton(BuyEmAllMaxButton)
	US:SkinButton(BuyEmAllCancelButton)
	US:SkinButton(BuyEmAllOkayButton)
end

US:RegisterSkin(name, US.SkinBuyEmAll)