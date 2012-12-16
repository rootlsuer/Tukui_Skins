if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local addon = select(1,...)
local U = unpack(select(2,...))

U.Version = GetAddOnMetadata(addon,"Version")

U.Skins = {
	["ACPSkin"] = {
		["buttonText"] = "Addon Control Panel",
		["addon"] = "ACP",
	},
	["AdiBagsSkin"] = {
		["buttonText"] = "AdiBags",
		["addon"] = "AdiBags",
	},
	["AltoholicSkin"] = {
		["addon"] = "Altoholic",
	},
	["AraBrokerGuildFriendsSkin"] = {
		["buttonText"] = "Ara Broker Guild Friends",
		["addon"] = "Ara_Broker_Guild_Friends",
	},
	["ArchySkin"] = {
		["addon"] = "Archy",
	},
	['ArhSkin'] = {
		["buttonText"] = "ArchaeologyHelper",
		["addon"] = "Arh",
	},
	["ArkInventorySkin"] = {
		["addon"] = "ArkInventory",
	},
	["AtlasLootSkin"] = {
		["buttonText"] = "AtlasLoot",
		["addon"] = "AtlasLoot_Loader",
	},
	["ATSWSkin"] = {
		["addon"] = "AdvancedTradeSkillWindow",
	},
	["AuctionatorSkin"] = {
		["addon"] = "Auctionator",
	},
	["AuctioneerSkin"] = {
		["buttonText"] = "Auctioneer",
		["addon"] = "Auc-Advanced"
	},
	["AuctionLiteSkin"] = {
		["addon"] = "AuctionLite",
	},
	["BagnonSkin"] = {
		["addon"] = "Bagnon",
	},
	["BGDefenderSkin"] = {
		["addon"] = "BGDefender",
	},
	["BigBrotherSkin"] = {
		["addon"] = "BigBrother"
	},
	["BigWigsSkin"] = {
		["addon"] = "BigWigs",
	},
	["BPTSkin"] = {
		["buttonText"] = "Balance Power Tracker",
		["addon"] = "BalancePowerTracker"
	},
	["BuyEmAllSkin"] = {
		["addon"] = "BuyEmAll",
	},
	["ChocolateBarSkin"] = {
		["addon"] = "ChocolateBar",
	},
	["CliqueSkin"] = {
		["addon"] = "Clique",
	},
	["CombustionHelperSkin"] = {
		["addon"] = "CombustionHelper",
	},
	["CoolLineSkin"] = {
		["addon"] = "CoolLine",
	},
	["CritlineSkin"] = {
		["addon"] = "Critline",
	},
	["DBMSkin"] = {
		["buttonText"] = "DBM",
		["addon"] = "DBM-Core",
	},
	["DresserSkin"] = {
		["addon"] = "Dresser",
	},
	["EasyMailSkin"] = {
		["addon"] = "EasyMail",
	},
	["EnergyWatchSkin"] = {
		["addon"] = "EnergyWatch",
	},
	["ExaminerSkin"] = {
		["addon"] = "Examiner",
	},
	["ExtVendorSkin"] = {
		["buttonText"] = "Extended Vendor",
		["addon"] = "ExtVendor",
	},
	["FactionizerSkin"] = {
		["addon"] = "Factionizer",
	},
	["FlightMapSkin"] = {
		["addon"] = "FlightMap",
	},
	["GupPetSkin"] = {
		["addon"] = "GupPet",
	},
	["HealiumSkin"] = {
		["addon"] = "Healium",
	},
	["IncomingSkin"] = {
		["addon"] = "Incoming",
	},
	["InspectEquipSkin"] = {
		["addon"] = "InspectEquip",
	},
	["KarniCrapSkin"] = {
		["buttonText"] = "Karni's Crap Filter",
		["addon"] = "KarniCrap",
	},
	["LightheadedSkin"] = {
		["addon"] = "Lightheaded",
	},
	["LinkWranglerSkin"] = {
		["addon"] = "LinkWrangler",
	},
	["LootCouncilLiteSkin"] = {
		["buttonText"] = "LootCouncilLite",
		["addon"] = "LootCouncil_Lite",
	},
	["MageNuggetsSkin"] = {
		["addon"] = "MageNuggets",
	},
	["MasterLootManagerRemixSkin"] = {
		["addon"] = "MasterLootManagerRemix",
	},
	["MinimalArchaeologySkin"] = {
		["addon"] = "MinimalArchaeology",
	},
	["MogItSkin"] = {
		["addon"] = "MogIt",
	},
	["MoveAnythingSkin"] = {
		["addon"] = "MoveAnything",
	},
	["MRTSkin"] = {
		["buttonText"] = "Mizus Raid Tracker",
		["addon"] = "MizusRaidTracker",
	},
	["MyRolePlaySkin"] = {
		["addon"] = "MyRolePlay",
	},
	["NumerationSkin"] = {
		["addon"] = "Numeration",
	},
	["OdysseySkin"] = {
		["addon"] = "Odyssey",
	},
	["OgriLazySkin"] = {
		["addon"] = "Ogri'Lazy",
	},
	["OmenSkin"] = {
		["addon"] = "Omen",
	},
	["OneClickEnchantScrollSkin"] = {
		["addon"] = "OneClickEnchantScroll",
	},
	["OutfitterSkin"] = {
		["addon"] = "Outfitter",
	},
	["PetBattleTeamsSkin"] = {
		["addon"] = "PetBattleTeams",
	},
	--["PoisonerSkin"] = {
	--	["addon"] = "Poisoner",
	--},
	["PoMTrackerSkin"] = {
		["addon"] = "PoMTracker",
	},
	["PostalSkin"] = {
		["addon"] = "Postal",
	},
	["QuartzSkin"] = {
		["addon"] = "Quartz",
	},
	["QuestCompletistSkin"] = {
		["addon"] = "QuestCompletist",
	},
	["QuestItemBarSkin"] = {
		["addon"] = "QuestItemBar",
	},
	["RaidInviteOrganizerSkin"] = {
		["buttonText"] = "Raid Invite Organizer",
		["addon"] = "RaidInviteOrganizer",
	},
	["RaidBuffStatusSkin"] = {
		["buttonText"] = "Raid Buff Status",
		["addon"] = "RaidBuffStatus",
	},
	--["RavenSkin"] = {
	--	["addon"] = "Raven",
	--},
	["RecountSkin"] = {
		["addon"] = "Recount",
	},
	["ReforgenatorSkin"] = {
		["addon"] = "Reforgenator",
	},
	["SearingPlasmaTrackerSkin"] = {
		["buttonText"] = "Searing Plasma Tracker",
		["addon"] = "SearingPlasmaTracker",
	},
	["SexyCooldownSkin"] = {
		["buttonText"] = "SexyCooldown 2",
		["addon"] = "SexyCooldown2",
	},
	["ShieldMonitorSkin"] = {
		["buttonText"] = "Shield Monitor",
		["addon"] = "shieldmonitor",
	},
	["SkadaSkin"] = {
		["addon"] = "Skada",
	},
	["SkilletSkin"] = {
		["addon"] = "Skillet",
	},
	["SoundtrackSkin"] = {
		["addon"] = "Soundtrack",
	},
	["SpineCounterSkin"] = {
		["buttonText"] = "Spine Blood Counter",
		["addon"] = "SpineCounter",
	},
	["SpySkin"] = {
		["addon"] = "Spy",
	},
	["SwatterSkin"] = {
		["buttonText"] = "Swatter",
		["addon"] = "!Swatter",
	},
	["tComboSkin"] = {
		["buttonText"] = "Tukui Combo",
		["addon"] = "tCombo",
	},
	["TellMeWhenSkin"] = {
		["addon"] = "TellMeWhen",
	},
	["TinyDPSSkin"] = {
		["addon"] = "TinyDPS",
	},
	["TitanPanelSkin"] = {
		["buttonText"] = "TitanPanel",
		["addon"] = "Titan",
	},
	["TomTomSkin"] = {
		["addon"] = "TomTom",
	},
	["TradeSkillDWSkin"] = {
		["addon"] = "TradeSkillDW",
	},
	["VengeanceStatusSkin"] = {
		["addon"] = "VengeanceStatus",
	},
	["WhollySkin"] = {
		["addon"] = "Wholly",
	},
	["WowLuaSkin"] = {
		["addon"] = "WowLua",
	},
	["WoWProSkin"] = {
		["addon"] = "WowPro",
	},
	["xMerchantSkin"] = {
		["addon"] = "xMerchant",
	},
	["ZygorSkin"] = {
		["buttonText"] = "Zygor",
		["addon"] = "ZygorGuidesViewer",
	},
--DO NOT REMOVE THESE
	["DBMSkinHalf"] = {
		["buttonText"] = "DBM Half-Bar Skin",
		["addon"] = "DBM-Core",
		["ui"] = "ElvUI",
	},
	["CLCProtSkin"] = {
		["buttonText"] = "CLCProt Icons",
		["addon"] = "CLCProt",
		["ui"] = "ElvUI",
	},
	["CLCRetSkin"] = {
		["buttonText"] = "CLCRet Icons",
		["addon"] = "CLCRet",
		["ui"] = "ElvUI",
	},
	["PowerAurasIconsSkin"] = {
		["buttonText"] = "PowerAuras Icons",
		["addon"] = "PowerAuras",
		["ui"] = "ElvUI",
	},
	["WeakAurasSkin"] = {
		["buttonText"] = "WeakAuras Icons",
		["addon"] = "WeakAuras",
		["ui"] = "ElvUI",
	},
--
}