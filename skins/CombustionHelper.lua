if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "CombustionHelperSkin"
function US:SkinCombustionHelper()
	US:SkinBackdropFrame(CombustionFrame, true)
	CombustionFrame:HookScript("OnUpdate", function(frame) frame:StripTextures() end)
	CombuMBTrackerBorderFrame:Kill()
	CombuMBTrackerFrame:HookScript("OnUpdate", function(frame) US:SkinFrame(frame) frame:SetPoint("BOTTOM", CombustionFrame, "TOP", 0, 4) end)
end

US:RegisterSkin(name, US.SkinCombustionHelper)