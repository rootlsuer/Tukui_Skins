if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "PartyXPSkin"
function US:SkinPartyXP()
	_PartyXP_CreateBarGroup = PartyXP_CreateBarGroup
	PartyXP_CreateBarGroup = function(p)
		local bar = _PartyXP_CreateBarGroup(p)
			US:SkinFrame(bar.frame)
			US:SkinStatusBar(bar)
			US:SkinStatusBar(bar.restedbar)
			US:SkinStatusBar(bar.questbar)
			bar.text:SetFont([[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]], 12, 'OUTLINE')
		return bar
	end
end

US:RegisterSkin(name, US.SkinOvale)