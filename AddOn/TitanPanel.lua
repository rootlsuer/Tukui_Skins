if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'TitanPanelSkin'
function AS:SkinTitanPanel()
	AS:SkinFrame(Titan_Bar__Display_Bar, 'Default')
	AS:SkinFrame(Titan_Bar__Display_Bar2, 'Default')
	AS:SkinFrame(Titan_Bar__Display_AuxBar, 'Default')
	AS:SkinFrame(Titan_Bar__Display_AuxBar2, 'Default')
end

AS:RegisterSkin(name, AS.SkinTitanPanel)