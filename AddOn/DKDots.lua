if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'DKDotsSkin'
function AS:SkinDKDots()
	AS:SkinBackdropFrame(DKDotsTarget)
end

AS:RegisterSkin(name, AS.SkinDKDots)