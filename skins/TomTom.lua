if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'TomTomSkin'
function AS:SkinTomTom()
	if TomTomBlock then
		AS:SkinFrame(TomTomBlock)
	end
end

AS:RegisterSkin(name, AS.SkinTomTom)