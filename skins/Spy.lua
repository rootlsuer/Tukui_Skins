if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "SpySkin"
function US:SkinSpy()
	US:SkinFrame(Spy_MainWindow)
	US:SkinFrame(Spy_AlertWindow)
	US:SkinCloseButton(Spy_MainWindow.CloseButton)
	US:Desaturate(Spy_MainWindow.ClearButton)
	US:Desaturate(Spy_MainWindow.LeftButton)
	US:Desaturate(Spy_MainWindow.RightButton)
	Spy_AlertWindow:Point("TOP", UIParent, "TOP", 0, -130)
end

US:RegisterSkin(name, US.SkinSpy)