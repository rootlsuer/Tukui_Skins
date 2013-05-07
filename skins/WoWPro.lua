if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "WoWProSkin"
function US:SkinWoWPro()
	US:SkinFrame(Titlebar)
	US:SkinBackdropFrame(WoWPro.MainFrame)
	US:SkinTooltip(_G["Mouseover Note Tooltip"])
end

US:RegisterSkin(name, US.SkinWoWPro)