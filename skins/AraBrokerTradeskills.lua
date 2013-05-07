if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "AraBrokerTradeskillsSkin"
function US:SkinAraTradeskills()
	AraSkills:HookScript("OnUpdate", function(f) US:SkinFrame(f) end)
end

US:RegisterSkin(name, US.SkinAraTradeskills)