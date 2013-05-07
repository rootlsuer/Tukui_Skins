if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "WowLuaSkin"
function US:SkinWowLua()
	US:SkinFrame(WowLuaFrame)
	WowLuaFrameLineNumScrollFrame:StripTextures(True)
	WowLuaFrameResizeBar:StripTextures(True)
	WowLuaFrameResizeBar:Height(10)
	US:SkinCloseButton(WowLuaButton_Close)
	WowLuaButton_Close:Point("TOPRIGHT", WowLuaFrame, "TOPRIGHT", 0 , 0)
	US:SkinScrollBar(WowLuaFrameEditScrollFrameScrollBar)
	WowLuaButton_New:Point("LEFT", WowLuaFrameToolbar, "LEFT", 60, 0)

	WowLuaFrameEditFocusGrabber.bg1 = CreateFrame("Frame", nil, WowLuaFrameEditFocusGrabber)
	US:SkinBackdropFrame(WowLuaFrameEditFocusGrabber.bg1)
	WowLuaFrameEditFocusGrabber.bg1:Point("TOPLEFT", 0, 0)
	WowLuaFrameEditFocusGrabber.bg1:Point("BOTTOMRIGHT", 5, -5)

	WowLuaFrameResizeBar.bg1 = CreateFrame("Frame", nil, WowLuaFrameResizeBar)
	US:SkinFrame(WowLuaFrameResizeBar.bg1)
	WowLuaFrameResizeBar.bg1:Point("TOPLEFT", 6, -2)
	WowLuaFrameResizeBar.bg1:Point("BOTTOMRIGHT", -27, 0)

	WowLuaFrameCommand:StripTextures()
	WowLuaFrameCommand.bg1 = CreateFrame("Frame", nil, WowLuaFrameCommand)
	US:SkinBackdropFrame(WowLuaFrameCommand.bg1)
	WowLuaFrameCommand.bg1:Point("TOPLEFT", 0, -4)
	WowLuaFrameCommand.bg1:Point("BOTTOMRIGHT", -12, 2)
end

US:RegisterSkin(name, US.SkinWowLua)