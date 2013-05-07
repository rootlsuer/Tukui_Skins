if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = 'ArhSkin'
function US:SkinArh()
	US:SkinFrame(Arh_MainFrame)
	US:SkinTooltip(Arh_Tooltip, true)
end

US:RegisterSkin(name, US.SkinArh)