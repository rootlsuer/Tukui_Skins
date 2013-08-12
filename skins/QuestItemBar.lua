if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "QuestItemBarSkin"
function AS:SkinQuestItemBar()
	hooksecurefunc(QuestItemBar,"LibQuestItem_Update", function()
		for i = 1, 99 do
			if _G["QuestItemBarButton"..i] then AS:SkinIconButton(_G["QuestItemBarButton"..i], true) end
		end
		QuestItemBar:UpdateBar()
	end)
end

AS:RegisterSkin(name, AS.SkinQuestItemBar)