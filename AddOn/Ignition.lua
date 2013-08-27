if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'IgnitionSkin'
function AS:SkinIgnition()
	ignTimeBar:StripTextures(true)
	AS:SkinBackdropFrame(uiIgnitionFrame, true)
end

AS:RegisterSkin(name, AS.SkinIgnition)