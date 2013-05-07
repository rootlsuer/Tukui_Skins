if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "ShieldMonitorSkin"
function US:SkinShieldMonitor()
	US:SkinFrame(shieldmonitor_Frame,"Default")
	shieldmonitor_Frame:HookScript("OnShow", function(self)	US:SkinFrame(self, "Default", true) end)
	shieldmonitor_Frame:RegisterEvent("UNIT_AURA")
	shieldmonitor_Frame:HookScript("OnEvent", function(self) US:SkinFrame(self, "Default", true)	end)
	shieldmonitor_Frame:SetSize(209, 20)
	shieldmonitor_Bar:SetStatusBarTexture(US.NormTex)
	shieldmonitor_Bar:ClearAllPoints()
	shieldmonitor_Bar:SetInside()

	local IconBorder = CreateFrame("Frame", "ShieldIconBorder", shieldmonitor_Frame)
	US:SkinFrame(IconBorder,"Default")
	IconBorder:SetSize(20, 20)
	IconBorder:SetPoint("RIGHT", shieldmonitor_Frame, "LEFT", -3, 0)
	shieldmonitor_FrameIcon1:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	shieldmonitor_FrameIcon1:ClearAllPoints()
	shieldmonitor_FrameIcon1:SetParent(IconBorder)
	shieldmonitor_FrameIcon1:SetInside()
	shieldmonitor_BarText:SetFont(US.Font, 12, "OUTLINE")
	shieldmonitor_BarText:SetPoint("CENTER", shieldmonitor_Bar, "CENTER", 0, 0)
	shieldmonitor_FrameDuration:SetFont(US.Font, 12, "OUTLINE")
	shieldmonitor_FrameDuration:SetParent(shieldmonitor_Bar)
	shieldmonitor_FrameDuration:ClearAllPoints()
	shieldmonitor_FrameDuration:SetPoint("RIGHT", shieldmonitor_Frame, "RIGHT", -2, 0)
end

US:RegisterSkin(name, US.SkinShieldMonitor)