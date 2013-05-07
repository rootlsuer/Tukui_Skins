if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "FlightMapEnhancedSkin"
function US:SkinFlightMapEnhanced()
	US:SkinBackdropFrame(FlightMapEnhancedTaxiChoice, true)
	US:SkinCloseButton(FlightMapEnhancedTaxiChoice.CloseButton)
	US:SkinScrollBar(FlightMapEnhancedTaxiChoiceContainerScrollBar)
	FlightMapEnhancedTaxiChoice:HookScript("OnShow", function()
		for i = 1, 34 do
			if _G["FlightMapEnhancedTaxiChoiceContainerButton"..i] then _G["FlightMapEnhancedTaxiChoiceContainerButton"..i]:StripTextures() end
		end
	end)
	hooksecurefunc("FlightMapEnhancedTaxiChoiceButton_OnEnter", function() GameTooltip:Show() end)
end

US:RegisterSkin(name, US.SkinFlightMapEnhanced)