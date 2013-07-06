if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "CoolLineSkin"
function AS:SkinCoolLine()
	CoolLineDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	CoolLineDB.border  = "None"
	CoolLine.updatelook()
	AS:SkinBackdropFrame(CoolLine)
	CoolLine.backdrop:SetAllPoints(CoolLine)
	CoolLine.backdrop:CreateShadow()
	AS:RegisterForPetBattleHide(CoolLine)
	if AS:CheckOption("EmbedCoolLine") then
		local function OnShow()
			CoolLine:Point('BOTTOM', AS.ActionBar4, 'TOP', 0, 1)
			CoolLine:SetHeight(ActionButton1:GetHeight())
			CoolLine:SetWidth(AS.ActionBar4:GetWidth())
		end

		local function OnHide()
			CoolLine:Point('BOTTOM', AS.ActionBar1, 'TOP', 0, 1)
			CoolLine:SetHeight(ActionButton1:GetHeight())
			CoolLine:SetWidth(AS.ActionBar1:GetWidth())
		end

		if not CoolLineDB.vertical then
			if AS.ActionBar4:IsShown() then
				OnShow()
			else
				OnHide()
			end
			AS.ActionBar4:HookScript("OnShow", OnShow)
			AS.ActionBar4:HookScript("OnHide", OnHide)
		end
	end
end

AS:RegisterSkin(name, AS.SkinCoolLine)