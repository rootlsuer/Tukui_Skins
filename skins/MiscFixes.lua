local U = unpack(select(2,...))
local MiscFixes = CreateFrame("Frame")
	MiscFixes:RegisterEvent("PLAYER_ENTERING_WORLD")
	local s = U.s
	local c = U.c 
	MiscFixes:SetScript("OnEvent", function(self)
	if TukuiMinimap then Minimap:SetMaskTexture(c["media"].blank) end
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
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	end
end)