if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2, ...))

local name = 'CombustionHelperSkin'
function AS:SkinCombustionHelper()
	CombustionFrame:CreateBackdrop()
	if combusettingstable then
		combusettingstable["bgcolornormal"] = AS.BackdropColor
		combusettingstable["edgecolornormal"] = AS.BackdropColor
	end
	CombuMBTrackerBorderFrame:Kill()
	hooksecurefunc('CombuBackdropBuild', function() CombustionFrame:SetTemplate('Transparent') end)
	hooksecurefunc('CombuMBTrackerBackdropBuild', function() CombuMBTrackerFrame:SetTemplate('Transparent') end)
end

AS:RegisterSkin(name, AS.SkinCombustionHelper)