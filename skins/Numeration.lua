if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "NumerationSkin"
function AS:SkinNumeration()
	AS:SkinFrame(NumerationFrame)
end

AS:RegisterSkin(name, AS.SkinNumeration)