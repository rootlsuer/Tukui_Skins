if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "BPTSkin"
function US:SkinBPT()
	if US.MyClass ~= "DRUID" then return end
	BalancePowerTracker_Options.global.enabled = true
	BalancePowerTracker.CheckAll()
	US:SkinFrame(BalancePowerTracker_Eclipse_Bar_Frame, false, true)
	US:SkinFrame(BalancePowerTracker_SolarEclipseIcon, false, true)
	US:SkinFrame(BalancePowerTracker_LunarEclipseIcon, false, true)
	hooksecurefunc(BalancePowerTracker.modules.eclipse_bar, "ReDraw", function() BalancePowerTracker_Eclipse_Bar_Frame:SetTemplate("Transparent") end)
end

US:RegisterSkin(name, US.SkinBPT)