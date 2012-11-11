if not (IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) then return end
local U = unpack(select(2,...))
local MiscFixes = CreateFrame("Frame")
	MiscFixes:RegisterEvent("PLAYER_ENTERING_WORLD")
	MiscFixes:RegisterEvent("PLAYER_REGEN_ENABLED")
	MiscFixes:RegisterEvent("PLAYER_REGEN_DISABLED")
	local s = U.s
	local c = U.c 
	MiscFixes:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_REGEN_ENABLED" or event == "PLAYER_REGEN_DISABLED" then
		if IsAddOnLoaded("tCombo") then
			if (tComboPoints and not tComboPoints.skinned) then 
				tComboPoints.skinned = true
				tComboPoints:SetTemplate("Transparent")
				tComboEnergyBar:SetTemplate("Transparent")
			end
		end
		self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	else
	if TukuiMinimap then Minimap:SetMaskTexture(c["media"].blank) end
	if U.elv then
		if IsAddOnLoaded("stAddonManager") then
			GameMenuFrame:HookScript("OnShow", function() if GameMenuButtonAddons then U.SkinButton(GameMenuButtonAddons) end end)
		end
	end
	if IsAddOnLoaded("TomTom") and (U.CheckOption("TomTomSkin")) then
		if TomTomBlock then
			TomTomBlock:SetTemplate("Transparent")
		end
	end
	if IsAddOnLoaded("SymbiosisTip") then
		SymbiosisTip:HookScript("OnShow", function(self) self:SetTemplate("Transparent") end)
	end
	if IsAddOnLoaded("VengeanceStatus") and (U.CheckOption("VengeanceStatusSkin")) then
			U.SkinStatusBar(VengeanceStatus_StatusBar)
	end
	
	LoadAddOn("acb_CastBar")
	if IsAddOnLoaded("acb_CastBar") then
		AzCastBarPluginPlayer:StripTextures() AzCastBarPluginPlayer:CreateBackdrop()
		AzCastBarPluginTarget:StripTextures() AzCastBarPluginTarget:CreateBackdrop()
		AzCastBarPluginFocus:StripTextures() AzCastBarPluginFocus:CreateBackdrop()
		AzCastBarPluginMirror:StripTextures() AzCastBarPluginMirror:CreateBackdrop()
		AzCastBarPluginPet:StripTextures() AzCastBarPluginPet:CreateBackdrop()
	end

	if (U.CheckOption("AzilSettings")) then
		if TukuiPlayer_Experience then
			TukuiPlayer_Experience:ClearAllPoints()
			TukuiPlayer_Experience:Point('BOTTOM', InvTukuiActionBarBackground, 'TOP', 0, 4)
			TukuiPlayer_Experience:Height(8)
			TukuiPlayer_Experience:SetFrameStrata("BACKGROUND")
		end
		if TukuiPlayer_Reputation then
			TukuiPlayer_Reputation:ClearAllPoints()
			TukuiPlayer_Reputation:Point('BOTTOM', InvTukuiActionBarBackground, 'TOP', 0, 4)
			TukuiPlayer_Reputation:Height(8)
			TukuiPlayer_Reputation:SetFrameStrata("BACKGROUND")
		end
		if (select(2, UnitClass("player")) == "ROGUE") then
			TukuiStance:SetParent(TukuiUIHider)
		end
	end
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end
end)


-----------------------------------------
-- Loot auto confirm
-----------------------------------------

local LootConfirmer = CreateFrame("Frame")
LootConfirmer:RegisterEvent("PLAYER_ENTERING_WORLD");
LootConfirmer:RegisterEvent("CONFIRM_DISENCHANT_ROLL");
LootConfirmer:RegisterEvent("CONFIRM_LOOT_ROLL");
LootConfirmer:RegisterEvent("LOOT_OPENED");
LootConfirmer:SetScript("OnEvent",
	function(self, event, ...)
		if (U.CheckOption("LootConfirmer")) then
		if event == "PLAYER_ENTERING_WORLD" then
			StaticPopupDialogs["CONFIRM_LOOT_ROLL"] = nil
			--StaticPopupDialogs["LOOT_BIND"] = nil
		elseif event == "CONFIRM_LOOT_ROLL" or event == "CONFIRM_DISENCHANT_ROLL" then
			local arg1, arg2 = ...;
			ConfirmLootRoll(arg1, arg2);
		elseif event == "LOOT_OPENED" then
			cnt = GetNumLootItems()
			if cnt == 0 then
				CloseLoot()
			else
				for slot = 1, cnt do
					ConfirmLootSlot(slot)
				end
			end
		end
	end
end)
local ChatLootIcons = CreateFrame("Frame")
ChatLootIcons:RegisterEvent("PLAYER_ENTERING_WORLD");
ChatLootIcons:SetScript("OnEvent", function() 
	if (U.CheckOption("ChatLootIcons")) then
		EnableLootIcons()
	else
		DisableLootIcons()
	end
end)

local function AddLootIcons(self, event, message, ...)
	local _, fontSize = GetChatWindowInfo(self:GetID())
	local function IconForLink(link)
		local texture = GetItemIcon(link)
		return "\124T" .. texture .. ":" .. fontSize .. "\124t" .. link
	end
	message = message:gsub("(\124c%x+\124Hitem:.-\124h\124r)", IconForLink)
	return false, message, ...
end

function EnableLootIcons()
	ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", AddLootIcons)
end

function DisableLootIcons()
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_LOOT", AddLootIcons)
end

--Minimap Button Skinning thanks to Sinaris

if IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("SinarisUI") then return end

local buttons = {
	"QueueStatusMinimapButton",
	"MiniMapTrackingButton",
	"MiniMapMailFrame",
	"HelpOpenTicketButton",
	"ElvConfigToggle",
	"DBMMinimapButton",
	"ZygorGuidesViewerMapIcon",
}

local function SkinButton(frame)
	local s = U.s
	if(frame:GetObjectType() ~= "Button") then return end

	for i, buttons in pairs(buttons) do
		if(frame:GetName() ~= nil) then
			if(frame:GetName():match(buttons)) then return end
			for z = 1,999 do
				if _G["GatherMatePin"..z] then return end
			end
		end
	end

	frame:SetPushedTexture(nil)
	frame:SetHighlightTexture(nil)
	frame:SetDisabledTexture(nil)
	frame:Size(24)

	for i = 1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if(region:GetObjectType() == "Texture") then
			local tex = region:GetTexture()

			if(tex and (tex:find("Border") or tex:find("Background") or tex:find("AlphaMask"))) then
				region:SetTexture(nil)
			else
				region:ClearAllPoints()
				region:Point("TOPLEFT", frame, "TOPLEFT", 2, -2)
				region:Point("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
				region:SetTexCoord( 0.1, 0.9, 0.1, 0.9 )
				region:SetDrawLayer( "ARTWORK" )
				if(frame:GetName() == "PS_MinimapButton") then
					region.SetPoint = s.dummy
				end
			end
		end
	end

	frame:SetTemplate("Default")
end

local UISkinMinimapButtons = CreateFrame("Frame")
UISkinMinimapButtons:RegisterEvent("PLAYER_ENTERING_WORLD")
UISkinMinimapButtons:SetScript("OnEvent", function(self, event)
	if (not U.CheckOption("UISkinMinimap")) then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	for i = 1, Minimap:GetNumChildren() do
		SkinButton(select(i, Minimap:GetChildren()))
	end

	self = nil
end )