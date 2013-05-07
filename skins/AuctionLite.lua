if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "AuctionLiteSkin"
function US:SkinAuctionLite(event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	US:SkinTab(AuctionFrameTab4)
	US:SkinTab(AuctionFrameTab5)
	US:SkinEditBox(BuyName)
	US:SkinEditBox(BuyQuantity)
	US:SkinButton(BuySearchButton)
	US:SkinButton(BuyBidButton)
	US:SkinButton(BuyBuyoutButton)
	US:SkinButton(BuyCancelSearchButton)
	US:SkinButton(BuyCancelAuctionButton)
	US:SkinButton(BuyScanButton)
	US:SkinNextPrevButton(BuyAdvancedButton)
	US:SkinNextPrevButton(SellRememberButton)
	US:SkinEditBox(SellStacks)
	US:SkinEditBox(SellSize)
	US:SkinEditBox(SellBidPriceGold)
	US:SkinEditBox(SellBidPriceSilver)
	US:SkinEditBox(SellBidPriceCopper)
	US:SkinEditBox(SellBuyoutPriceGold)
	US:SkinEditBox(SellBuyoutPriceSilver)
	US:SkinEditBox(SellBuyoutPriceCopper)
	US:SkinButton(SellCreateAuctionButton)
	US:UnregisterEvent(name, self, event)
end

US:RegisterSkin(name, US.SkinAuctionLite, "AUCTION_HOUSE_SHOW")