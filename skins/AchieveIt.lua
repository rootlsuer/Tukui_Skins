if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "AchieveItSkin"
local function SkinAchieveIt(self, event)
  if event == "PLAYER_ENTERING_WORLD" then return end

	if IsAddOnLoaded("Blizzard_AchievementUI") then
		AchievementFrame:HookScript("OnShow", function(self)
			for i=1, 20 do
				local frame = _G["AchievementFrameCategoriesContainerButton"..i]
				local lastframe = _G["AchievementFrameCategoriesContainerButton"..i-1]
				
				frame:StripTextures()
				frame:StyleButton()				
			end
		end)
		S:HandleButton(AchieveIt_Locate_Button)
		AchieveIt_Locate_Button:ClearAllPoints()
		AchieveIt_Locate_Button:SetPoint("TOPLEFT", AchievementFrame, 250, 5)
  end
end

U.RegisterSkin(name, SkinAchieveIt, "ADDON_LOADED")
