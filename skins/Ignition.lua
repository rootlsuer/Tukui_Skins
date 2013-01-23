if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "IgnitionSkin"
local function SkinIgnition(self)
	local borders = {
		ignTopBorder,
		ignTopLeftBorder,
		ignLeftBorder,
		ignBottomLeftBorder,
		ignTopRightBorder,
		ignRightBorder,
		ignBottomRightBorder,
		ignBottomBorder
	}
	for _, border in pairs(borders) do
		border:Hide()
	end	

	U.SkinBackdropFrame(uiIgnitionFrame, true)
end
U.RegisterSkin(name,SkinIgnition)