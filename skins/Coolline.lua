if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "CoolLineSkin"
function US:SkinCoolLine()
	CoolLineDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	CoolLineDB.border  = "None"
	CoolLine.updatelook()
	US:SkinBackdropFrame(CoolLine)
	CoolLine.Backdrop:SetAllPoints(CoolLine)
	CoolLine.Backdrop:CreateShadow()
	US:RegisterForPetBattleHide(CoolLine)
	if US:CheckOption("EmbedCoolLine") then

		local function OnShow()
			CoolLine:Point('BOTTOM', US.ActionBar4, 'TOP', 0, 1)
			CoolLine:SetHeight(ActionButton1:GetHeight())
			CoolLine:SetWidth(US.ActionBar4:GetWidth())
		end

		local function OnHide()
			CoolLine:Point('BOTTOM', US.ActionBar1, 'TOP', 0, 1)
			CoolLine:SetHeight(ActionButton1:GetHeight())
			CoolLine:SetWidth(US.ActionBar1:GetWidth())
		end

		if not CoolLineDB.vertical then
			if US.ActionBar4:IsShown() then
				OnShow()
			else
				OnHide()
			end
			US.ActionBar4:HookScript("OnShow", OnShow)
			US.ActionBar4:HookScript("OnHide", OnHide)
		end
	end
end

US:RegisterSkin(name, US.SkinCoolLine)