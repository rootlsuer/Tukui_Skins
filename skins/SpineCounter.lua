if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "SpineCounterSkin"
function AS:SkinSpineCounter()
	AS:SkinFrame(SCOutput)
end

AS:RegisterSkin(name, AS.SkinSpineCounter)