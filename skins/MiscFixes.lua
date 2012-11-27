local U = unpack(select(2,...))
local MiscFixes = CreateFrame("Frame")
	MiscFixes:RegisterEvent("PLAYER_ENTERING_WORLD")
	local s = U.s
	local c = U.c 
	MiscFixes:SetScript("OnEvent", function(self)
	if IsAddOnLoaded("Numeration") and U.CheckOption("NumerationSkin") then
		U.SkinFrame(NumerationFrame, true)
	end
	if IsAddOnLoaded("Critline") and U.CheckOption("CritlineSkin") then
		U.SkinBackdropFrame(Critline.display, true)
		Critline.display.backdrop:SetFrameStrata("BACKGROUND")
	end	
	if IsAddOnLoaded("InspectEquip") and U.CheckOption("InspectEquipSkin") then
		U.SkinFrame(InspectEquip_InfoWindow)
		U.SkinCloseButton(InspectEquip_InfoWindow_CloseButton)
	end
	if TukuiMinimap then Minimap:SetMaskTexture(c["media"].blank) end
	if IsAddOnLoaded("TomTom") and (U.CheckOption("TomTomSkin")) then
		if TomTomBlock then
			U.SkinFrame(TomTomBlock)
		end
	end
	if IsAddOnLoaded("SymbiosisTip") then
		SymbiosisTip:HookScript("OnShow", function(self) self:SetTemplate("Transparent") cUpdateColor(self) end)
	end
	if IsAddOnLoaded("VengeanceStatus") and (U.CheckOption("VengeanceStatusSkin")) then
			U.SkinStatusBar(VengeanceStatus_StatusBar)
	end
	
	LoadAddOn("acb_CastBar")
	if IsAddOnLoaded("acb_CastBar") then
		U.SkinBackdropFrame(AzCastBarPluginPlayer)
		U.SkinBackdropFrame(AzCastBarPluginTarget)
		U.SkinBackdropFrame(AzCastBarPluginFocus)
		U.SkinBackdropFrame(AzCastBarPluginMirror)
		U.SkinBackdropFrame(AzCastBarPluginPet)
	end
end)