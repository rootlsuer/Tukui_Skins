if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "MiscFixes"
function US:MiscFixes(event, addon)

	if addon == "Blizzard_PetJournal" and IsAddOnLoaded("PetJournalEnhanced") then
		PetJournal:HookScript("OnShow", function() PJEUniquePetCount:StripTextures() end)
	end

	if IsAddOnLoaded("acb_CastBar") then
		US:SkinBackdropFrame(AzCastBarPluginPlayer)
		US:SkinBackdropFrame(AzCastBarPluginTarget)
		US:SkinBackdropFrame(AzCastBarPluginFocus)
		US:SkinBackdropFrame(AzCastBarPluginMirror)
		US:SkinBackdropFrame(AzCastBarPluginPet)
	end

	if IsAddOnLoaded("DoubleWideTradeSkills") then
		TradeSkillListScrollFrame:StripTextures()
		US:SkinFrame(TradeSkillFrame)
		US:SkinStatusBar(TradeSkillRankFrame)
	end

	if addon == "Blizzard_TradeSkillUI" and IsAddOnLoaded("Auctionator") then 
		TradeSkillFrame:HookScript("OnShow", function() US:SkinButton(Auctionator_Search, true) end)
	end

	if addon == "Blizzard_TrainerUI" and IsAddOnLoaded("TrainAll") then
		ClassTrainerFrame:HookScript("OnShow", function()
			US:SkinFrame(ClassTrainerTrainAllButton,"Default")
			US:SkinFrame(ClassTrainerTrainButton,"Default")
		end)
	end
end

US:RegisterSkin(name, US.MiscFixes, "ADDON_LOADED")