if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'PartyXPSkin'
function AS:SkinPartyXP()
	_PartyXP_CreateBarGroup = PartyXP_CreateBarGroup
	PartyXP_CreateBarGroup = function(p)
		local bar = _PartyXP_CreateBarGroup(p)
			AS:SkinFrame(bar.frame)
			AS:SkinStatusBar(bar)
			AS:SkinStatusBar(bar.restedbar)
			AS:SkinStatusBar(bar.questbar)
			bar.text:SetFont([[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]], 12, 'OUTLINE')
		return bar
	end
end

AS:RegisterSkin(name, AS.SkinOvale)