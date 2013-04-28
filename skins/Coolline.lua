if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "CoolLineSkin"
local function SkinCoolLine(self)
	CoolLineDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	CoolLineDB.border  = "None"
	CoolLine.updatelook()
	U.SkinBackdropFrame(CoolLine)
	CoolLine.backdrop:SetAllPoints(CoolLine)
	CoolLine.backdrop:CreateShadow()
	U.RegisterForPetBattleHide(CoolLine)
	if U.CheckOption("EmbedCoolLine") then
		if not CoolLineDB.vertical then
			U.ActionBar2:HookScript("OnShow", function() 
				CoolLine:Point('BOTTOM', U.ActionBar2, 'TOP', 0, 1)
				CoolLine:SetHeight(ActionButton1:GetHeight())
				CoolLine:SetWidth(U.ActionBar2:GetWidth())
			end)
			U.ActionBar2:HookScript("OnHide", function() 
				CoolLine:Point('BOTTOM', U.ActionBar1, 'TOP', 0, 1)
				CoolLine:SetHeight(ActionButton1:GetHeight())
				CoolLine:SetWidth(U.ActionBar1:GetWidth())
			end)
		end
		CoolLine.updatelook()
	end
end

U.RegisterSkin(name, SkinCoolLine)