if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "FlightMapSkin"
local function SkinFM()
	U.SkinStatusBar(FlightMapTimesFrame)
	FlightMapTimesText:ClearAllPoints()
	FlightMapTimesText:SetPoint("CENTER", FlightMapTimesFrame, "CENTER", 0, 0)
end

U.RegisterSkin(name, SkinFM)