if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local s = U.s
local c = U.c 
function ColorTukui()
	local TukuiFrames = {
		"TukuiLineToABLeft",
		"TukuiLineToABLeftAlt",
		"TukuiLineToABRight",
		"TukuiLineToABRightAlt",
		"TukuiChatBackgroundLeft",
		"TukuiCubeLeft",
		"TukuiInfoLeft",
		"TukuiInfoLeftLineVertical",
		"TukuiTabsLeftBackground",
		"TukuiChatBackgroundRight",
		"TukuiInfoRight",
		"TukuiCubeRight",
		"TukuiInfoRightLineVertical",
		"TukuiTabsRightBackground",
		"TukuiPetBar",
		"TukuiLineToPetActionBarBackground",
		"TukuiMinimapStatsLeft",
		"TukuiMinimapStatsRight",
		"TukuiMinimap",
		"TukuiInfoLeftBattleGround",
		"TukuiBags",
		"CombatLogQuickButtonFrame_Custom",
		"TukuiBar5ButtonBottom",
		"TukuiBar5ButtonTop",
		"TukuiButtonCF1",
		"RaidBuffReminder",
		"BNToastFrame",
		}

	local GameTooltips = {
		"TukuiTooltip",
		"GameTooltip",
		"ShoppingTooltip1",
		"ShoppingTooltip2",
		"ShoppingTooltip3",
		"WorldMapTooltip",
		"WorldMapCompareTooltip1",
		"WorldMapCompareTooltip2",
		"GameTooltip",
		"ItemRefTooltip",
		}

	local TukuiUFPanels = {
		"TukuiPlayer",
		"TukuiTarget",
		"TukuiTargetTarget",
		"TukuiPet",
		}

	for _, object in pairs(TukuiUFPanels) do
		if _G[object] then cUpdateColor(_G[object].panel) end
	end

	for _, object in pairs(TukuiFrames) do
		if _G[object] then cUpdateColor(_G[object]) end
	end

	for _, object in pairs(GameTooltips) do
		cUpdateColor(_G[object])
		_G[object]:HookScript("OnShow", TSSetStyle)
	end

	for i = 1, 6 do
		cUpdateColor(_G["TukuiBar"..i])
		if _G["TukuiBar"..i.."Button"] then cUpdateColor(_G["TukuiBar"..i.."Button"]) end
		if _G["StaticPopup"..i] then cUpdateColor(_G["StaticPopup"..i]) end
		if _G["StaticPopup1Button"..i] then cUpdateColor(_G["StaticPopup1Button"..i]) _G["StaticPopup1Button"..i]:HookScript("OnEnter", TSSetModifiedBackdrop) _G["StaticPopup1Button"..i]:HookScript("OnLeave", TSSetOriginalBackdrop) end
		if _G["StaticPopup2Button"..i] then cUpdateColor(_G["StaticPopup2Button"..i]) _G["StaticPopup2Button"..i]:HookScript("OnEnter", TSSetModifiedBackdrop) _G["StaticPopup2Button"..i]:HookScript("OnLeave", TSSetOriginalBackdrop) end
		if _G["StaticPopup3Button"..i] then cUpdateColor(_G["StaticPopup3Button"..i]) _G["StaticPopup3Button"..i]:HookScript("OnEnter", TSSetModifiedBackdrop) _G["StaticPopup3Button"..i]:HookScript("OnLeave", TSSetOriginalBackdrop) end
		if _G["StanceButton"..i] then cUpdateColor(_G["StanceButton"..i].backdrop) end
	end

	for i = 1, 12 do
		if _G["MultiBarBottomRightButton"..i] then cUpdateColor(_G["MultiBarBottomRightButton"..i].backdrop) end
		if _G["MultiBarBottomLeftButton"..i] then cUpdateColor(_G["MultiBarBottomLeftButton"..i].backdrop) end
		if _G["MultiBarRightButton"..i] then cUpdateColor(_G["MultiBarRightButton"..i].backdrop) end
		if _G["MultiBarLeftButton"..i] then cUpdateColor(_G["MultiBarLeftButton"..i].backdrop) end
		if _G["ActionButton"..i] then cUpdateColor(_G["ActionButton"..i].backdrop) end
		if _G["PetActionButton"..i] then cUpdateColor(_G["PetActionButton"..i].backdrop) end
	end

	local function RecolorBuffs()
		for i = 1, 99 do
			if _G["TukuiAurasPlayerBuffsAuraButton"..i] then
				cUpdateColor(_G["TukuiAurasPlayerBuffsAuraButton"..i])

				if _G["TukuiAurasPlayerBuffsAuraButton"..i].Holder then
					cUpdateColor(_G["TukuiAurasPlayerBuffsAuraButton"..i].Holder)
				end
			end
		end
	end
	if not TSBuffColorer then
		TSBuffColorer = CreateFrame("Frame", "TSBuffColorer", UIParent)
		TSBuffColorer:RegisterEvent("UNIT_AURA")
		TSBuffColorer:SetScript("OnEvent", RecolorBuffs)
	end
	if not TSTooltipColor then
		local TSTooltipColor = CreateFrame("Frame")
		TSTooltipColor:RegisterEvent("PLAYER_ENTERING_WORLD")
		TSTooltipColor:RegisterEvent("ADDON_LOADED")
		TSTooltipColor:SetScript("OnEvent", function()
			if FrameStackTooltip then
				FrameStackTooltip:HookScript("OnShow", function(self) cUpdateColor(self) end)
			end
			if EventTraceTooltip then
				EventTraceTooltip:HookScript("OnShow", function(self) cUpdateColor(self) end)
			end
		end)
	end

end

TSBorderColor = function(self)
	local GMF = GetMouseFocus()
	local unit = (select(2, self:GetUnit())) or (GMF and GMF:GetAttribute("unit"))
		
	local reaction = unit and UnitReaction(unit, "player")
	local player = unit and UnitIsPlayer(unit)
	local tapped = unit and UnitIsTapped(unit)
	local tappedbyme = unit and UnitIsTappedByPlayer(unit)
	local connected = unit and UnitIsConnected(unit)
	local dead = unit and UnitIsDead(unit)
	local r, g, b

	if player then
		local class = select(2, UnitClass(unit))
		local c = s.UnitColor.class[class]
		r, g, b = c[1], c[2], c[3]
		self:SetBackdropBorderColor(r, g, b)
		if healthBar then
			healthBarBG:SetBackdropBorderColor(r, g, b)
			healthBar:SetStatusBarColor(r, g, b)
		end
	elseif reaction then
		local c = s.UnitColor.reaction[reaction]
		r, g, b = c[1], c[2], c[3]
		self:SetBackdropBorderColor(r, g, b)
		if healthBar then
			healthBarBG:SetBackdropBorderColor(r, g, b)
			healthBar:SetStatusBarColor(r, g, b)
		end
	else
		local _, link = self:GetItem()
		local quality = link and select(3, GetItemInfo(link))
		if quality and quality >= 2 then
			local r, g, b = GetItemQualityColor(quality)
			self:SetBackdropBorderColor(r, g, b)
		else
			if UISkinOptions.ColorTemplate == "ClassColor" then
				local color = RAID_CLASS_COLORS[U.ccolor]
				self:SetBackdropBorderColor(color.r, color.g, color.b)
				if healthBar then
					healthBarBG:SetBackdropBorderColor(color.r, color.g, color.b)
					healthBar:SetStatusBarColor(color.r, color.g, color.b)
				end
			else
				self:SetBackdropBorderColor(unpack(c["media"].bordercolor))
				if healthBar then
					healthBarBG:SetBackdropBorderColor(unpack(C["media"].bordercolor))
					healthBar:SetStatusBarColor(unpack(C["media"].bordercolor))
				end
			end
		end
	end
end

TSSetStyle = function(self)
	self:SetTemplate("Default")
	TSBorderColor(self)
end