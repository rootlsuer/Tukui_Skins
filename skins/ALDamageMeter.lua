if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "ALDamageMeterSkin"
function AS:SkinALDamageMeter()
	AS:SkinFrame(alDamageMeterFrame.bg)
end

AS:RegisterSkin(name, AS.SkinALDamageMeter)