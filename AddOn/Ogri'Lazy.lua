if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'OgriLazySkin'
function AS:SkinOgriLazy()
	AS:SkinFrame(Relic_View)
	AS:SkinCloseButton(Relic_ViewCloseButton)
end

AS:RegisterSkin(name, AS.SkinOgriLazy)