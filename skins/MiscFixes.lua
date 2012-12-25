if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "MiscFixes"

local function MiscFixes(self)
local s = U.s
local c = U.c

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
	UISetup()
	if UIMinimap then Minimap:SetMaskTexture(c["media"].blank) end

	if IsAddOnLoaded("TomTom") and (U.CheckOption("TomTomSkin")) then
		if TomTomBlock then
			U.SkinFrame(TomTomBlock)
		end
	end

	if IsAddOnLoaded("SymbiosisTip") then
		U.SkinTooltip(SymbiosisTip)
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

	if IsAddOnLoaded("BloodShieldTracker") and not IsAddOnLoaded("Tukui") then
		U.SkinStatusBar(BloodShieldTracker_EstimateBar)
		U.SkinStatusBar(BloodShieldTracker_HealthBar)
		U.SkinStatusBar(BloodShieldTracker_ShieldBar)
		U.SkinStatusBar(BloodShieldTracker_EstimateBar)
		U.SkinStatusBar(BloodShieldTracker_BloodChargeBar)
		U.SkinStatusBar(BloodShieldTracker_TotalAbsorbsBar)
		U.SkinStatusBar(BloodShieldTracker_PWSBar)
		U.SkinStatusBar(BloodShieldTracker_IllumBar)
		U.SkinStatusBar(BloodShieldTracker_AMSBar)
		U.SkinStatusBar(BloodShieldTracker_PurgatoryBar)
	end
	if IsAddOnLoaded("GuildMemberInfo_TradeSkills") then
		U.SkinFrame(GMIFrame)
		U.SkinIconButton(GMItsButton1, true)
		U.SkinIconButton(GMItsButton2, true)
		GMItsIcon1:SetTexCoord(0.12, 0.88, 0.12, 0.88)
		GMItsIcon2:SetTexCoord(0.12, 0.88, 0.12, 0.88)
	end
end

U.RegisterSkin(name,MiscFixes)