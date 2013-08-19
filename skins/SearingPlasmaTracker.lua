if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'SearingPlasmaTrackerSkin'
function AS:SkinSearingPlasmaTracker()
	AS:SkinFrame(SearingPlasmaTrackerFrame)
end

AS:RegisterSkin(name, AS.SkinSearingPlasmaTracker)