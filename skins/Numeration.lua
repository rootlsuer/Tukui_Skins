if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "NumerationSkin"
function US:SkinNumeration()
	US:SkinFrame(NumerationFrame)
end

US:RegisterSkin(name, US.SkinNumeration)