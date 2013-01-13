if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "MiscFixes"
local function MiscFixes()

	if IsAddOnLoaded("PetJournalEnhanced") then LoadAddOn("Blizzard_PetJournal") PetJournal:HookScript("OnShow", function() PJEUniquePetCount:StripTextures() end) end
	
	LoadAddOn("acb_CastBar")
	if IsAddOnLoaded("acb_CastBar") then
		U.SkinBackdropFrame(AzCastBarPluginPlayer)
		U.SkinBackdropFrame(AzCastBarPluginTarget)
		U.SkinBackdropFrame(AzCastBarPluginFocus)
		U.SkinBackdropFrame(AzCastBarPluginMirror)
		U.SkinBackdropFrame(AzCastBarPluginPet)
	end

	LoadAddOn("Blizzard_TradeSkillUI")
	if IsAddOnLoaded("DoubleWideTradeSkills") then
		TradeSkillListScrollFrame:StripTextures()
		U.SkinFrame(TradeSkillFrame)
		U.SkinStatusBar(TradeSkillRankFrame)
	end
	
	--TrainAll
	LoadAddOn("Blizzard_TrainerUI")
	ClassTrainerFrame:HookScript("OnShow", function()
		if ClassTrainerTrainAllButton then
			U.SkinFrame(ClassTrainerTrainAllButton,"Default")
			U.SkinFrame(ClassTrainerTrainButton,"Default")
		end
	end)
end

U.RegisterSkin(name,MiscFixes)