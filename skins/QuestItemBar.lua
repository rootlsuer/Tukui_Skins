if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "QuestItemBarSkin"
function US:SkinQuestItemBar()
	hooksecurefunc(QuestItemBar,"LibQuestItem_Update", function()
		for i = 1, 99 do
			if _G["QuestItemBarButton"..i] then US:SkinIconButton(_G["QuestItemBarButton"..i], true, true, true) end
		end
		QuestItemBar:UpdateBar()
	end)
end

US:RegisterSkin(name, US.SkinQuestItemBar)