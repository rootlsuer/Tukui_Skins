if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "BloodShieldTrackerSkin"
function US:SkinBloodShieldTracker()
	if not IsAddOnLoaded("Tukui") then
		US:SkinStatusBar(BloodShieldTracker_EstimateBar)
		US:SkinStatusBar(BloodShieldTracker_HealthBar)
		US:SkinStatusBar(BloodShieldTracker_ShieldBar)
		US:SkinStatusBar(BloodShieldTracker_EstimateBar)
		US:SkinStatusBar(BloodShieldTracker_BloodChargeBar)
		US:SkinStatusBar(BloodShieldTracker_TotalAbsorbsBar)
		US:SkinStatusBar(BloodShieldTracker_PWSBar)
		US:SkinStatusBar(BloodShieldTracker_IllumBar)
		US:SkinStatusBar(BloodShieldTracker_AMSBar)
		US:SkinStatusBar(BloodShieldTracker_PurgatoryBar)
	end
end

US:RegisterSkin(name, US.SkinBloodShieldTracker)