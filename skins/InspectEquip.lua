if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "InspectEquipSkin"
function AS:SkinInspectEquip()
	AS:SkinFrame(InspectEquip_InfoWindow)
	AS:SkinCloseButton(InspectEquip_InfoWindow_CloseButton)
end

AS:RegisterSkin(name, AS.SkinInspectEquip)