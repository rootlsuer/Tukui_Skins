if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "CorkSkin"
function AS:SkinCork()
	AS:SkinBackdropFrame(Corkboard, true)
	Corkboard:HookScript("OnUpdate", function(frame) frame:StripTextures() end)
end

AS:RegisterSkin(name, AS.SkinCork)