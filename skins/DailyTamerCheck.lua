if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'DailyTamerCheckSkin'
function AS:SkinDailyTamerCheck()
	DailyTamerCheck_mainframe:HookScript('OnShow', function(self) AS:SkinFrame(self) end)
end

AS:RegisterSkin(name, AS.SkinDailyTamerCheck)