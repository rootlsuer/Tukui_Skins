if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "tComboSkin"
function US:SkintCombo(event)
	US:SkinFrame(tComboPoints)
	US:SkinFrame(tComboEnergyBar)
end

US:RegisterSkin(name, US.SkintCombo, "ADDON_LOADED", "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED")