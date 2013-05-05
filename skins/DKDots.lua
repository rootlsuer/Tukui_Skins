if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "DKDotsSkin"
local function SkinDKDots()
	U.SkinBackdropFrame(DKDotsTarget)
end

U.RegisterSkin(name, SkinDKDots)