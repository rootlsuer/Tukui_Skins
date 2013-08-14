if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "ALDamageMeterSkin"
function AS:SkinALDamageMeter()
	alDamageMeterFrame.bg:Kill()
	AS:SkinBackdropFrame(alDamageMeterFrame, 'Transparent')
end

AS:RegisterSkin(name, AS.SkinALDamageMeter)