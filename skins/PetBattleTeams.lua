if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "PetBattleTeamsSkin"
function US:SkinPetBattleTeams()
	US:Delay(6, function()
		US:SkinFrame(PetBattleTeamFrame)
		US:SkinScrollBar(PetBattleTeamsScrollFrameScrollBar)

		PetBattleTeamsTooltip:HookScript("OnShow", function(self)
			self.Icon:SetTexCoord(0.12, 0.88, 0.12, 0.88)
			self.rarityGlow:SetTexture(nil)
			self.Background:SetTexture(nil)
			self.BorderTop:SetTexture(nil)
			self.BorderTopLeft:SetTexture(nil)
			self.BorderTopRight:SetTexture(nil)
			self.BorderLeft:SetTexture(nil)
			self.BorderRight:SetTexture(nil)
			self.BorderBottom:SetTexture(nil)
			self.BorderBottomRight:SetTexture(nil)
			self.BorderBottomLeft:SetTexture(nil)
			US:SkinFrame(self, false, true)
		end)
	end)
end

US:RegisterSkin(name, US.SkinPetBattleTeams)