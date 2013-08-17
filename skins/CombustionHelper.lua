if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "CombustionHelperSkin"
function AS:SkinCombustionHelper()
	AS:SkinBackdropFrame(CombustionFrame)
	CombustionFrame:HookScript("OnUpdate", function(frame) frame:StripTextures() end)
	CombuMBTrackerBorderFrame:Kill()
	CombuMBTrackerFrame:HookScript("OnUpdate", function(frame) AS:SkinFrame(frame) frame:SetPoint("BOTTOM", CombustionFrame, "TOP", 0, 4) end)
end

AS:RegisterSkin(name, AS.SkinCombustionHelper)