if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "SymbiosisTipSkin"
function US:SkinSymbiosisTip()
	US:SkinTooltip(SymbiosisTip)
end

US:RegisterSkin(name, US.SkinSymbiosisTip)