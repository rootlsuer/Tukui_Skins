if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "BigBrotherSkin"
function US:SkinBigBrother()
	BigBrother:ToggleBuffWindow()
	US:SkinFrame(BigBrother_BuffWindow)
	US:SkinCloseButton(BigBrother_BuffWindow.CloseButton)
	US:SkinButton(BigBrother_BuffWindow.LeftButton)
	BigBrother_BuffWindow.LeftButton:FontString("text", US.PixelFont, US.DataTextFontSize, "MONOCHROMEOUTLINE")
	BigBrother_BuffWindow.LeftButton.text:SetText("<")
	BigBrother_BuffWindow.LeftButton.text:SetPoint("CENTER", 1, 1)
	US:SkinButton(BigBrother_BuffWindow.RightButton)
	BigBrother_BuffWindow.RightButton:FontString("text", US.PixelFont, US.DataTextFontSize, "MONOCHROMEOUTLINE")
	BigBrother_BuffWindow.RightButton.text:SetText(">")
	BigBrother_BuffWindow.RightButton.text:SetPoint("CENTER", 1, 1)
	BigBrother:ToggleBuffWindow()
end

US:RegisterSkin(name, US.SkinBigBrother)