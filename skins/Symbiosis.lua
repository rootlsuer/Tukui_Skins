if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'SymbiosisTipSkin'
function AS:SkinSymbiosisTip()
	AS:SkinTooltip(SymbiosisTip)
end

AS:RegisterSkin(name, AS.SkinSymbiosisTip)