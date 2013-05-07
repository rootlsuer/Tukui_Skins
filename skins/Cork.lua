if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "CorkSkin"
function US:SkinCork()
	US:SkinBackdropFrame(Corkboard, true)
	Corkboard:HookScript("OnUpdate", function(frame) frame:StripTextures() end)
end

US:RegisterSkin(name, US.SkinCork)