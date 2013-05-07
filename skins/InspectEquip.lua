if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "InspectEquipSkin"
function US:SkinInspectEquip()
	US:SkinFrame(InspectEquip_InfoWindow)
	US:SkinCloseButton(InspectEquip_InfoWindow_CloseButton)
end

US:RegisterSkin(name, US.SkinInspectEquip)