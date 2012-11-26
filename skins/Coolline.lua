local U = unpack(select(2,...))
local name = "CoolLineSkin"
local c = U.c
local s = U.s

local function SkinCoolLine(self)
	CoolLineDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	CoolLineDB.border  = "None"
	CoolLine.updatelook()
	U.SkinBackdropFrame(CoolLine)
	CoolLine.backdrop:SetOutside(CoolLine)
	CoolLine.backdrop:CreateShadow()
	if U.CheckOption("CoolLineEmbed") then
		if not CoolLineDB.vertical then
			CoolLine:SetPoint("BOTTOMRIGHT", InvTukuiActionBarBackground, "TOPRIGHT", -2, 4)
			CoolLine:SetPoint("BOTTOMLEFT", InvTukuiActionBarBackground, "TOPLEFT", 2, 4)
		else
			print("Sorry will not embed a vertical frame.")
		end
	end
end

U.RegisterSkin(name,SkinCoolLine)