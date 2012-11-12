local U = unpack(select(2,...))

local name = 'tComboSkin'
local function SkintCombo(self)
	cDelay(1,function()
		if tComboPoints then
			tComboPoints:SetTemplate("Transparent")
		end
		if tComboEnergyBar then
			tComboEnergyBar:SetTemplate("Transparent")
		end
	end)
end
U.RegisterSkin(name,SkintCombo)