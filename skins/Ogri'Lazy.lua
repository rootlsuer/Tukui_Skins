if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "OgriLazySkin"
function US:SkinOgriLazy()
	US:SkinFrame(Relic_View)
	US:SkinCloseButton(Relic_ViewCloseButton)
end

US:RegisterSkin(name, US.SkinOgriLazy)