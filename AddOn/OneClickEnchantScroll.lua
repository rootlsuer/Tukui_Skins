if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'OneClickEnchantScrollSkin'
function AS:SkinOneClickEnchantScroll()
	AS:SkinButton(TradeSkillCreateScrollButton, true)
	TradeSkillCreateScrollButton:ClearAllPoints()
	TradeSkillCreateScrollButton:Point('RIGHT', TradeSkillCreateButton, 'LEFT', -2, 0)
end

AS:RegisterSkin(name, AS.SkinOneClickEnchantScroll)