if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "GuildMemberInfo_TradeSkillsSkin"
function AS:SkinGuildMemberInfo_TradeSkills()
	AS:SkinFrame(GMIFrame)
	AS:SkinIconButton(GMItsButton1)
	AS:SkinIconButton(GMItsButton2)
	AS:SkinTexture(GMItsIcon1)
	AS:SkinTexture(GMItsIcon2)
end

AS:RegisterSkin(name, AS.SkinGuildMemberInfo_TradeSkills)