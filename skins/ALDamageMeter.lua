if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "ALDamageMeterSkin"
function US:SkinALDamageMeter()
	US:SkinFrame(alDamageMeterFrame.bg)
end

US:RegisterSkin(name, US.SkinALDamageMeter)