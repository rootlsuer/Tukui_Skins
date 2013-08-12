if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "AffDotsSkin"
function AS:SkinAffDots()
	AS:SkinBackdropFrame(AffDotsTarget)
end

AS:RegisterSkin(name, AS.SkinAffDots)