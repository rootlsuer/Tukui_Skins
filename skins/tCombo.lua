if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "tComboSkin"
function AS:SkintCombo(event)
	AS:SkinFrame(tComboPoints)
	AS:SkinFrame(tComboEnergyBar)
end

AS:RegisterSkin(name, AS.SkintCombo, "ADDON_LOADED", "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED")