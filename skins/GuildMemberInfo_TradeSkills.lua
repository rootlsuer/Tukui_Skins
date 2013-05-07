if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "GuildMemberInfo_TradeSkillsSkin"
function US:SkinGuildMemberInfo_TradeSkills()
	US:SkinFrame(GMIFrame)
	US:SkinIconButton(GMItsButton1, true)
	US:SkinIconButton(GMItsButton2, true)
	GMItsIcon1:SetTexCoord(0.12, 0.88, 0.12, 0.88)
	GMItsIcon2:SetTexCoord(0.12, 0.88, 0.12, 0.88)
end

US:RegisterSkin(name, US.SkinGuildMemberInfo_TradeSkills)