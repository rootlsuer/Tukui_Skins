if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "DresserSkin"
function US:SkinDresser()
	US:SkinButton(DresserButton1)
	US:SkinButton(DresserButton2)
	US:SkinButton(DresserButton3)
	US:SkinButton(DresserButton4)
	DresserButton1:ClearAllPoints()
	DresserButton1:Point("BOTTOMLEFT", DressUpFrame, "BOTTOMLEFT", 138, 79)
	DresserButton2:ClearAllPoints()
	DresserButton2:Point("BOTTOMLEFT", DressUpFrame, "BOTTOMLEFT", 96, 79)
	DresserButton3:ClearAllPoints()
	DresserButton3:Point("BOTTOMLEFT", DressUpFrame, "BOTTOMLEFT", 54, 79)
	DresserButton4:ClearAllPoints()
	DresserButton4:Point("BOTTOMLEFT", DressUpFrame, "BOTTOMLEFT", 12, 79)
	DresserButton1:Size(38, 22)
	DresserButton2:Size(38, 22)
	DresserButton3:Size(38, 22)
	DresserButton4:Size(38, 22)
end

US:RegisterSkin(name, US.SkinDresser)