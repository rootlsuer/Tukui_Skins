if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = 'tComboSkin'
local function SkintCombo(self, event)
	U.SkinFrame(tComboPoints)
	U.SkinFrame(tComboEnergyBar)
end

U.RegisterSkin(name, SkintCombo,"ADDON_LOADED","PLAYER_REGEN_ENABLED","PLAYER_REGEN_DISABLED")