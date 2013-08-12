if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "FlightMapSkin"
function AS:SkinFlightMap()
	AS:SkinStatusBar(FlightMapTimesFrame)
	FlightMapTimesText:ClearAllPoints()
	FlightMapTimesText:SetPoint("CENTER", FlightMapTimesFrame, "CENTER", 0, 0)
end

AS:RegisterSkin(name, AS.SkinFlightMap)