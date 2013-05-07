if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "SpineCounterSkin"
function US:SkinSpineCounter()
	US:SkinFrame(SCOutput)
end

US:RegisterSkin(name, US.SkinSpineCounter)