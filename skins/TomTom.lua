if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "TomTomSkin"
function AS:SkinTomTom()
	AS:SkinFrame(TomTomBlock)
end

AS:RegisterSkin(name, AS.SkinTomTom)