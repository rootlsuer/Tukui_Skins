local U = unpack(select(2,...))

local name = 'tComboSkin'
local function SkintCombo(self)
	cDelay(1,function()
		tComboPoints:SetTemplate("Transparent")
		tComboEnergyBar:SetTemplate("Transparent")
	end)
end
U.RegisterSkin(name,SkintCombo)