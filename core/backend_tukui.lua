if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
UISkinOptions = {}
local s = U.s
local c = U.c
local XS = {}
XS.skins = {}
XS.events = {}
XS.register = {}
U.x = XS
U.tuk = true
local Skins = U.Skins
XS.Init = function(self)
	if self.frame then return end -- In case this gets called twice as can sometimes happen with ElvUI

	local f = CreateFrame("Frame",nil)
	f:RegisterEvent("PET_BATTLE_CLOSE")
	f:RegisterEvent("PET_BATTLE_OPENING_START")
	self.frame = f
	for skin,alldata in pairs(self.register) do
		for _,data in pairs(alldata) do
			if IsAddOnLoaded(Skins[skin].addon) then
				self:RegisterSkin(skin,data.func,data.events)
			end
		end
	end
	for skin,funcs in pairs(XS.skins) do
		if U.CheckOption(skin) then
			for func,_ in pairs(funcs) do
				func(f,"PLAYER_ENTERING_WORLD")
			end
		end
	end
	f:SetScript("OnEvent", function(self,event)
		if event == "PET_BATTLE_CLOSE" then
			U.AddNonPetBattleFrames()
		elseif event == "PET_BATTLE_OPENING_START" then
			U.RemoveNonPetBattleFrames()
		end 
		for skin,funcs in pairs(XS.skins) do
			if U.CheckOption(skin) and XS.events[event] and XS.events[event][skin] then
				for func,_ in pairs(funcs) do
					func(f,event)
				end
			end
		end
	end)

	self.frame = f
end

XS.RegisterSkin = function(self,skinName,func,events)
    if not self.skins[skinName] then self.skins[skinName] = {} end
    self.skins[skinName][func] = true
    for event,_ in pairs(events) do
        if not self.events[event] then self.frame:RegisterEvent(event); self.events[event] = {} end
        self.events[event][skinName] = true
    end
end

XS.UnregisterEvent = function(self,skinName,event)
	if not self.events[event] then return end
	if not self.events[event][skinName] then return end
	self.events[event][skinName] = nil
	local found = false
	for skin,_ in pairs(self.events[event]) do
		if skin then
			found = true
			break
		end
	end
	if not found then
		self.frame:UnregisterEvent(event)
	end
end

s.CreatePopup["OLD_SKIN_PACKAGE"] = {
	question = "You have the old Tukui_UIPackages_Skins addon.  This addon replaces it and will conflict.  Press accept to disable this addon and reload your UI.",
	answer1 = ACCEPT,
	function1 = function() DisableAddOn("Tukui_UIPackages_Skins"); DisableAddOn("Tukui_ElvUI_Skins"); ReloadUI() end,
	timeout = 0,
	whileDead = 1,
}

local XSFrame = CreateFrame("Frame",nil)
XSFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
XSFrame:SetScript("OnEvent",function(self)
	XS:Init()
	UISetup()
	if IsAddOnLoaded("Tukui_UIPackages_Skins") or IsAddOnLoaded("Tukui_ElvUI_Skins") then s.ShowPopup("OLD_SKIN_PACKAGE") end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)

local DefaultSetSkin = CreateFrame("Frame")
	DefaultSetSkin:RegisterEvent( "PLAYER_ENTERING_WORLD" )
	DefaultSetSkin:SetScript( "OnEvent", function(self)
	if(UISkinOptions.RecountBackdrop == nil) then UISkinOptions.RecountBackdrop = "Enabled" end
	if(UISkinOptions.SkadaBackdrop == nil) then UISkinOptions.SkadaBackdrop = "Enabled" end
	if(UISkinOptions.EmbedOoC == nil) then UISkinOptions.EmbedOoC = "Disabled" end
	if(UISkinOptions.EmbedOmen == nil) then UISkinOptions.EmbedOmen = "Disabled" end
	if(UISkinOptions.EmbedTDPS == nil) then UISkinOptions.EmbedTDPS = "Disabled" end
	if(UISkinOptions.EmbedSkada == nil) then UISkinOptions.EmbedSkada = "Disabled" end
	if(UISkinOptions.EmbedRecount == nil) then UISkinOptions.EmbedRecount = "Disabled" end
	if(UISkinOptions.EmbedRO == nil) then UISkinOptions.EmbedRO = "Disabled" end
	--if(UISkinOptions.ColorTemplate == nil) then UISkinOptions.ColorTemplate = "ClassColor" end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)

local SkinOptions = CreateFrame("Frame", "SkinOptions", UIParent)
	SkinOptions:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinOptions:SetScript("OnEvent", function(self)
	print("|cffC495DDTukui|r Skins by |cFFFF7D0AAzilroka|r - Version: |cff1784d1"..U.Version.."|r Loaded!")
	UIFont = c["media"].font
	UIFontSize = 12
	SkinOptions:Hide()
	U.SkinFrame(SkinOptions)
	SkinOptions:Point("CENTER", UIParent, "CENTER", 0, 0)
	SkinOptions:SetFrameStrata("DIALOG")
	SkinOptions:Width(550)
	SkinOptions:SetClampedToScreen(true)
	SkinOptions:SetMovable(true)
	SkinOptions.text = SkinOptions:CreateFontString(nil, "OVERLAY")
	SkinOptions.text:SetFont(UIFont, 14, "OUTLINE")
	SkinOptions.text:SetPoint("TOP", SkinOptions, 0, -6)
	SkinOptions.text:SetText("|cffC495DDTukui|r Skin Options - Version "..U.Version)
	SkinOptions:EnableMouse(true)
	SkinOptions:RegisterForDrag("LeftButton")
	SkinOptions:SetScript("OnDragStart", function(self) self:StartMoving() end)
	SkinOptions:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

	SkinOptions2 = CreateFrame("Frame", "SkinOptions2", UIParent)
	U.SkinFrame(SkinOptions2)
	SkinOptions2:Point("TOPLEFT", SkinOptions, "TOPLEFT", 0, 0)
	SkinOptions2:SetFrameStrata("DIALOG")
	SkinOptions2:Width(SkinOptions:GetWidth())
	SkinOptions2:SetClampedToScreen(true)
	SkinOptions2:SetMovable(true)
	SkinOptions2:EnableMouse(true)
	SkinOptions2:RegisterForDrag("LeftButton")
	SkinOptions2:Hide()
	SkinOptions2.text = SkinOptions2:CreateFontString(nil, "OVERLAY")
	SkinOptions2.text:SetFont(UIFont, 14, "OUTLINE")
	SkinOptions2.text:SetPoint("TOP", SkinOptions2, 0, -6)
	SkinOptions2.text:SetText("|cffC495DDTukui|r Module Options - Version "..U.Version)

	SkinOptions3 = CreateFrame("Frame", "SkinOptions3", UIParent)
	U.SkinFrame(SkinOptions3)
	SkinOptions3:Point("TOPLEFT", SkinOptions, "TOPLEFT", 0, 0)
	SkinOptions3:SetFrameStrata("DIALOG")
	SkinOptions3:Width(SkinOptions:GetWidth())
	SkinOptions3:SetClampedToScreen(true)
	SkinOptions3:SetMovable(true)
	SkinOptions3:EnableMouse(true)
	SkinOptions3:RegisterForDrag("LeftButton")
	SkinOptions3:Hide()
	SkinOptions3.text = SkinOptions3:CreateFontString(nil, "OVERLAY")
	SkinOptions3.text:SetFont(UIFont, 14, "OUTLINE")
	SkinOptions3.text:SetPoint("TOP", SkinOptions3, 0, -6)
	SkinOptions3.text:SetText("|cffC495DDTukui|r Embed Options - Version "..U.Version)

	SkinOptions1Button = CreateFrame("Button", "SkinOptions1Button", SkinOptions, "UIPanelButtonTemplate")
	SkinOptions1Button:SetPoint("TOP", SkinOptions, "BOTTOM", 0, -2)
	SkinOptions1Button:Size(100,24)
	U.SkinButton(SkinOptions1Button)
	SkinOptions1Button.text = SkinOptions1Button:CreateFontString(nil, "OVERLAY")
	SkinOptions1Button.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkinOptions1Button.text:SetPoint("CENTER", SkinOptions1Button, 0, 0)
	SkinOptions1Button.text:SetText("Skin Options")
	SkinOptions1Button:HookScript("OnClick", function()
			SkinOptions1Button:SetParent(SkinOptions)
			SkinOptions2Button:SetParent(SkinOptions)
			EmbedWindowSettingsButton:SetParent(SkinOptions)
			ApplySkinSettingsButton:SetParent(SkinOptions)
			SkinOptionsCloseButton:SetParent(SkinOptions)
			SkinOptions:Show()
			SkinOptions2:Hide()
			SkinOptions3:Hide()
	end)

	EmbedWindowSettingsButton = CreateFrame("Button", "EmbedWindowSettingsButton", SkinOptions, "UIPanelButtonTemplate")
	EmbedWindowSettingsButton:SetPoint("RIGHT", SkinOptions1Button, "LEFT", -2, 0)
	EmbedWindowSettingsButton:Size(100,24)
	U.SkinButton(EmbedWindowSettingsButton)
	EmbedWindowSettingsButton.text = EmbedWindowSettingsButton:CreateFontString(nil, "OVERLAY")
	EmbedWindowSettingsButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	EmbedWindowSettingsButton.text:SetPoint("CENTER", EmbedWindowSettingsButton, 0, 0)
	EmbedWindowSettingsButton.text:SetText("Embed Options")
	EmbedWindowSettingsButton:HookScript("OnClick", function()
			SkinOptions1Button:SetParent(SkinOptions3)
			SkinOptions2Button:SetParent(SkinOptions3)
			EmbedWindowSettingsButton:SetParent(SkinOptions3)
			ApplySkinSettingsButton:SetParent(SkinOptions3)
			SkinOptionsCloseButton:SetParent(SkinOptions3)
			SkinOptions:Hide()
			SkinOptions2:Hide()
			SkinOptions3:Show()
	end)

	ApplySkinSettingsButton = CreateFrame("Button", "ApplySkinSettingsButton", SkinOptions, "UIPanelButtonTemplate")
	ApplySkinSettingsButton:SetPoint("RIGHT", EmbedWindowSettingsButton, "LEFT", -2, 0)
	ApplySkinSettingsButton:Size(100,24)
	U.SkinButton(ApplySkinSettingsButton)
	ApplySkinSettingsButton.text = ApplySkinSettingsButton:CreateFontString(nil, "OVERLAY")
	ApplySkinSettingsButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	ApplySkinSettingsButton.text:SetPoint("CENTER", ApplySkinSettingsButton, 0, 0)
	ApplySkinSettingsButton.text:SetText("Apply Settings")
	ApplySkinSettingsButton:HookScript("OnClick", function() ReloadUI() end)

	SkinOptions2Button = CreateFrame("Button", "SkinOptions2Button", SkinOptions, "UIPanelButtonTemplate")
	SkinOptions2Button:SetPoint("RIGHT", SkinOptions1Button, "RIGHT", 102, 0)
	SkinOptions2Button:Size(100,24)
	U.SkinButton(SkinOptions2Button)
	SkinOptions2Button.text = SkinOptions2Button:CreateFontString(nil, "OVERLAY")
	SkinOptions2Button.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkinOptions2Button.text:SetPoint("CENTER", SkinOptions2Button, 0, 0)
	SkinOptions2Button.text:SetText("Module Options")
	SkinOptions2Button:HookScript("OnClick", function() 
			SkinOptions1Button:SetParent(SkinOptions2)
			SkinOptions2Button:SetParent(SkinOptions2)
			EmbedWindowSettingsButton:SetParent(SkinOptions2)
			ApplySkinSettingsButton:SetParent(SkinOptions2)
			SkinOptionsCloseButton:SetParent(SkinOptions2)
			SkinOptions:Hide()
			SkinOptions2:Show()
			SkinOptions3:Hide()
	end)

	SkinOptionsCloseButton = CreateFrame("Button", "SkinOptionsCloseButton", SkinOptions, "UIPanelButtonTemplate")
	SkinOptionsCloseButton:SetPoint("RIGHT", SkinOptions2Button, "RIGHT", 102, 0)
	SkinOptionsCloseButton:Size(100,24)
	U.SkinButton(SkinOptionsCloseButton)
	SkinOptionsCloseButton.text = SkinOptionsCloseButton:CreateFontString(nil, "OVERLAY")
	SkinOptionsCloseButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkinOptionsCloseButton.text:SetPoint("CENTER", SkinOptionsCloseButton, 0, 0)
	SkinOptionsCloseButton.text:SetText("Close Options")
	SkinOptionsCloseButton:HookScript("OnClick", function()
		SkinOptions1Button:SetParent(SkinOptions)
		SkinOptions2Button:SetParent(SkinOptions)
		EmbedWindowSettingsButton:SetParent(SkinOptions)
		ApplySkinSettingsButton:SetParent(SkinOptions)
		SkinOptionsCloseButton:SetParent(SkinOptions)
		SkinOptions:Hide()
		SkinOptions2:Hide()
		SkinOptions3:Hide()
	end)

	SkadaEmbedButton = CreateFrame("Button", "SkadaEmbedButton", SkinOptions3)
	SkadaEmbedButton:SetPoint("TOPLEFT", 12, -30)
	SkadaEmbedButton:Size(16)
	U.SkinBackdropFrame(SkadaEmbedButton)
	SkadaEmbedButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	SkadaEmbedButton.text = SkadaEmbedButton:CreateFontString(nil, "OVERLAY")
	SkadaEmbedButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkadaEmbedButton.text:SetPoint("LEFT", SkadaEmbedButton, "RIGHT", 10, 0)
	SkadaEmbedButton.text:SetText("Skada")
	if (U.CheckOption("EmbedSkada")) then SkadaEmbedButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedSkada")) then SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if not IsAddOnLoaded("Skada") then SkadaEmbedButton:Disable() SkadaEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
	SkadaEmbedButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedSkada")) then
			U.DisableOption("EmbedSkada")
			SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			EmbedSkada()
			U.EnableOption("EmbedSkada")
			U.DisableOption("EmbedRecount")
			U.DisableOption("EmbedRO")
			U.DisableOption("EmbedOmen")
			U.DisableOption("EmbedTDPS")
			SkadaEmbedButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

	RecountEmbedButton = CreateFrame("Button", "RecountEmbedButton", SkinOptions3)
	RecountEmbedButton:SetPoint("TOPLEFT", 12, -55)
	RecountEmbedButton:Size(16)
	U.SkinBackdropFrame(RecountEmbedButton)
	RecountEmbedButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	RecountEmbedButton.text = RecountEmbedButton:CreateFontString(nil, "OVERLAY")
	RecountEmbedButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	RecountEmbedButton.text:SetPoint("LEFT", RecountEmbedButton, "RIGHT", 10, 0)
	RecountEmbedButton.text:SetText("Recount")
	if (U.CheckOption("EmbedRecount")) then RecountEmbedButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedRecount")) then RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if not IsAddOnLoaded("Recount") then RecountEmbedButton:Disable() RecountEmbedButton:SetBackdropColor(0.77,0.7,0.34,1) end
	RecountEmbedButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedRecount")) then
			U.DisableOption("EmbedRecount")
			Recount:LockWindows(false)
			RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			EmbedRecount()
			U.EnableOption("EmbedRecount")
			U.DisableOption("EmbedSkada")
			U.DisableOption("EmbedRO")
			U.DisableOption("EmbedOmen")
			U.DisableOption("EmbedTDPS")
			RecountEmbedButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

	EmbedROButton = CreateFrame("Button", "EmbedROButton", SkinOptions3)
	EmbedROButton:SetPoint("TOPLEFT", 12, -80)
	EmbedROButton:Size(16)
	U.SkinBackdropFrame(EmbedROButton)
	EmbedROButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	EmbedROButton.text = EmbedROButton:CreateFontString(nil, "OVERLAY")
	EmbedROButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	EmbedROButton.text:SetPoint("LEFT", EmbedROButton, "RIGHT", 10, 0)
	EmbedROButton.text:SetText("Recount & Omen")
	if (U.CheckOption("EmbedRO")) then EmbedROButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedRO")) then EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if not IsAddOnLoaded("Omen") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) end
	if not IsAddOnLoaded("Recount") then EmbedROButton:Disable() EmbedROButton:SetBackdropColor(0.77,0.7,0.34,1) end
	EmbedROButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedRO")) then
			U.DisableOption("EmbedRO")
			EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			EmbedRecountOmen()
			U.EnableOption("EmbedRO")
			U.DisableOption("EmbedSkada")
			U.DisableOption("EmbedRecount")
			U.DisableOption("EmbedOmen")
			U.DisableOption("EmbedTDPS")
			EmbedROButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

	EmbedOmenButton = CreateFrame("Button", "EmbedOmenButton", SkinOptions3)
	EmbedOmenButton:SetPoint("TOPLEFT", 12, -105)
	EmbedOmenButton:Size(16)
	U.SkinBackdropFrame(EmbedOmenButton)
	EmbedOmenButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	EmbedOmenButton.text = EmbedOmenButton:CreateFontString(nil, "OVERLAY")
	EmbedOmenButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedOmenButton.text:SetText("Omen")
	EmbedOmenButton.text:SetPoint("LEFT", EmbedOmenButton, "RIGHT", 10, 0)
	if (U.CheckOption("EmbedOmen")) then EmbedOmenButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedOmen")) then EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if not IsAddOnLoaded("Omen") then EmbedOmenButton:Disable() EmbedOmenButton:SetBackdropColor(0.77,0.7,0.34,1) end
	EmbedOmenButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedOmen")) then
			U.DisableOption("EmbedOmen")
			EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			EmbedOmen()
			U.EnableOption("EmbedOmen")
			U.DisableOption("EmbedRO")
			U.DisableOption("EmbedSkada")
			U.DisableOption("EmbedRecount")
			U.DisableOption("EmbedTDPS")
			EmbedOmenButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

	EmbedTDPSButton = CreateFrame("Button", "EmbedTDPSButton", SkinOptions3)
	EmbedTDPSButton:SetPoint("TOPLEFT", 12, -130)
	EmbedTDPSButton:Size(16)
	U.SkinBackdropFrame(EmbedTDPSButton)
	EmbedTDPSButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	EmbedTDPSButton.text = EmbedTDPSButton:CreateFontString(nil, "OVERLAY")
	EmbedTDPSButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedTDPSButton.text:SetText("TinyDPS")
	EmbedTDPSButton.text:SetPoint("LEFT", EmbedTDPSButton, "RIGHT", 10, 0)
	if (U.CheckOption("EmbedTDPS")) then EmbedTDPSButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedTDPS")) then EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if not IsAddOnLoaded("TinyDPS") then EmbedTDPSButton:Disable() EmbedTDPSButton:SetBackdropColor(0.77,0.7,0.34,1) end
	EmbedTDPSButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedTDPS")) then
			U.DisableOption("EmbedTDPS")
			EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			EmbedTDPS()
			U.DisableOption("EmbedRO")
			U.DisableOption("EmbedSkada")
			U.DisableOption("EmbedRecount")
			U.DisableOption("EmbedOmen")
			U.EnableOption("EmbedTDPS")
			EmbedTDPSButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

	SkadaEmbedBackdropButton = CreateFrame("Button", "SkadaEmbedBackdropButton", SkinOptions3)
	SkadaEmbedBackdropButton:SetPoint("TOP", -68, -30)
	SkadaEmbedBackdropButton:Size(16)
	U.SkinBackdropFrame(SkadaEmbedBackdropButton)
	SkadaEmbedBackdropButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	SkadaEmbedBackdropButton.text = SkadaEmbedBackdropButton:CreateFontString(nil, "OVERLAY")
	SkadaEmbedBackdropButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	SkadaEmbedBackdropButton.text:SetPoint("LEFT", SkadaEmbedBackdropButton, "RIGHT", 10, 0)
	SkadaEmbedBackdropButton.text:SetText("Skada Backdrop")
	if (U.CheckOption("SkadaBackdrop")) then SkadaEmbedBackdropButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("SkadaBackdrop")) then SkadaEmbedBackdropButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if (not U.CheckOption("SkadaSkin")) or not IsAddOnLoaded("Skada") then SkadaEmbedBackdropButton:Disable() SkadaEmbedBackdropButton:SetBackdropColor(0.77,0.7,0.34,1) end
	SkadaEmbedBackdropButton:SetScript("OnClick", function()
		if (U.CheckOption("SkadaBackdrop")) then
			U.DisableOption("SkadaBackdrop")
			SkadaEmbedBackdropButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			U.EnableOption("SkadaBackdrop")
			SkadaEmbedBackdropButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

	RecountEmbedBackdropButton = CreateFrame("Button", "RecountEmbedBackdropButton", SkinOptions3)
	RecountEmbedBackdropButton:SetPoint("TOP", -68, -55)
	RecountEmbedBackdropButton:Size(16)
	U.SkinBackdropFrame(RecountEmbedBackdropButton)
	RecountEmbedBackdropButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	RecountEmbedBackdropButton.text = RecountEmbedBackdropButton:CreateFontString(nil, "OVERLAY")
	RecountEmbedBackdropButton.text:SetFont(UIFont, UIFontSize, "OUTLINE")
	RecountEmbedBackdropButton.text:SetPoint("LEFT", RecountEmbedBackdropButton, "RIGHT", 10, 0)
	RecountEmbedBackdropButton.text:SetText("Recount Backdrop")
	if (U.CheckOption("RecountBackdrop")) then RecountEmbedBackdropButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("RecountBackdrop")) then RecountEmbedBackdropButton:SetBackdropColor(0.68,0.14,0.14,1) end
	if (not U.CheckOption("RecountSkin")) or not IsAddOnLoaded("Recount") then RecountEmbedBackdropButton:Disable() RecountEmbedBackdropButton:SetBackdropColor(0.77,0.7,0.34,1) end
	RecountEmbedBackdropButton:SetScript("OnClick", function()
		if (U.CheckOption("RecountBackdrop")) then
			U.DisableOption("RecountBackdrop")
			RecountEmbedBackdropButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			U.EnableOption("RecountBackdrop")
			RecountEmbedBackdropButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

	EmbedOoCButton = CreateFrame("Button", "EmbedOoCButton", SkinOptions3)
	EmbedOoCButton:SetPoint("TOP", -68, -105)
	EmbedOoCButton:Size(16)
	U.SkinBackdropFrame(EmbedOoCButton)
	EmbedOoCButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	EmbedOoCButton.text = EmbedOoCButton:CreateFontString(nil, "OVERLAY")
	EmbedOoCButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedOoCButton.text:SetPoint("LEFT", EmbedOoCButton, "RIGHT", 10, 0)
	EmbedOoCButton.text:SetText("OoC Hide")
	if (U.CheckOption("EmbedOoC")) then EmbedOoCButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedOoC")) then EmbedOoCButton:SetBackdropColor(0.68,0.14,0.14,1) end
	EmbedOoCButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedOoC")) then
			U.DisableOption("EmbedOoC")
			EmbedOoCButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			U.EnableOption("EmbedOoC")
			EmbedOoCButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

	EmbedSexyCooldownButton = CreateFrame("Button", "EmbedSexyCooldownButton", SkinOptions3)
	EmbedSexyCooldownButton:SetPoint("TOPLEFT", 12, -155)
	EmbedSexyCooldownButton:Size(16)
	U.SkinBackdropFrame(EmbedSexyCooldownButton)
	EmbedSexyCooldownButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	EmbedSexyCooldownButton.text = EmbedSexyCooldownButton:CreateFontString(nil, "OVERLAY")
	EmbedSexyCooldownButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedSexyCooldownButton.text:SetPoint("LEFT", EmbedSexyCooldownButton, "RIGHT", 10, 0)
	EmbedSexyCooldownButton.text:SetText("SexyCooldown")
	if (U.CheckOption("EmbedSexyCooldown")) then EmbedSexyCooldownButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("EmbedSexyCooldown")) then EmbedSexyCooldownButton:SetBackdropColor(0.68,0.14,0.14,1) end
	EmbedSexyCooldownButton:SetScript("OnClick", function()
		if (U.CheckOption("EmbedSexyCooldown")) then
			U.DisableOption("EmbedSexyCooldown")
			EmbedSexyCooldownButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			U.EnableOption("EmbedSexyCooldown")
			EmbedSexyCooldownButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

	EmbedCoolLineButton = CreateFrame("Button", "EmbedCoolLineButton", SkinOptions3)
	EmbedCoolLineButton:SetPoint("TOPLEFT", 12, -180)
	EmbedCoolLineButton:Size(16)
	U.SkinBackdropFrame(EmbedCoolLineButton)
	EmbedCoolLineButton:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	EmbedCoolLineButton.text = EmbedCoolLineButton:CreateFontString(nil, "OVERLAY")
	EmbedCoolLineButton.text:SetFont(UIFont, 12, "OUTLINE")
	EmbedCoolLineButton.text:SetPoint("LEFT", EmbedCoolLineButton, "RIGHT", 10, 0)
	EmbedCoolLineButton.text:SetText("CoolLine")
	if (U.CheckOption("CoolLineEmbed")) then EmbedCoolLineButton:SetBackdropColor(0.11,0.66,0.11,1) end
	if (not U.CheckOption("CoolLineEmbed")) then EmbedCoolLineButton:SetBackdropColor(0.68,0.14,0.14,1) end
	EmbedCoolLineButton:SetScript("OnClick", function()
		if (U.CheckOption("CoolLineEmbed")) then
			U.DisableOption("CoolLineEmbed")
			EmbedCoolLineButton:SetBackdropColor(0.68,0.14,0.14,1)
		else
			U.EnableOption("CoolLineEmbed")
			EmbedCoolLineButton:SetBackdropColor(0.11,0.66,0.11,1)
		end
	end)

--Buttons
	SkinOptionsButton = CreateFrame("Button", "SkinOptionsButton", GameMenuFrame, "GameMenuButtonTemplate")
	SkinOptionsButton:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -1)
	SkinOptionsButton:Size(GameMenuButtonLogout:GetWidth(),GameMenuButtonLogout:GetHeight())
	U.SkinButton(SkinOptionsButton)
	SkinOptionsButton.text = SkinOptionsButton:CreateFontString(nil, "OVERLAY")
	SkinOptionsButton.text:SetFont(UIFont, 12)
	SkinOptionsButton.text:SetPoint("CENTER", SkinOptionsButton, 0, 0)
	SkinOptionsButton.text:SetText("Skins")
	SkinOptionsButton:HookScript("OnClick", function() SkinOptions:Show() HideUIPanel(GameMenuFrame) end)
	GameMenuButtonLogout:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -38)
	GameMenuFrame:Height(GameMenuFrame:GetHeight() + 26)
	if IsAddOnLoaded("stAddonmanager") then 
		GameMenuFrame:HookScript("OnShow",function()
		SkinOptionsButton:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -23)
		GameMenuButtonLogout:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -60)
		end)
	end
--Overlord Red (0.68,0.14,0.14)
--VIP Green (0.11,0.66,0.11)
--Grey (0.8,0.8,0.8)
--Premium Brown (0.77,0.7,0.34,1)
--ElvUI Blue (0.24,0.54,0.78,1)
--Donor Purple (0.6,0,0.86,1)
--Mod Orange (0.83,0.55,0,1)
	local function CreateButton(name,buttonText,addon,option,x,y,skinOptions2)
		local button = CreateFrame("Button", name, skinOptions2 and SkinOptions2 or SkinOptions)
		local yOffset = -30 - (25*(y-1))
		local xTable = {
			[1] = { point = "TOPLEFT", offset = 12 },
			[2] = { point = "TOPLEFT", offset = 200 },
			[3] = { point = "TOPLEFT", offset = 388 },
			[4] = { point = "TOPLEFT", offset = 576 },
		}
		button:SetPoint(xTable[x].point, xTable[x].offset, yOffset)
		button:Size(16)
		U.SkinBackdropFrame(button)
		button:SetBackdrop({bgFile = c.media.normTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0, insets = { left = 0, right = 0, top = 0, bottom = 0 }});

		button.text = button:CreateFontString(nil, "OVERLAY")
		button.text:SetFont(UIFont, UIFontSize, "OUTLINE")
		button.text:SetPoint("LEFT", button, "RIGHT", 10, 0)
		button.text:SetText(buttonText)
		if (UISkinOptions[option] == "Enabled") then button:SetBackdropColor(0.6,0,0.86,1) end
		if (UISkinOptions[option] == "Disabled") then button:SetBackdropColor(0.68,0.14,0.14,1) end
		button:HookScript("OnClick", function()
			if (UISkinOptions[option] == "Enabled") then
				UISkinOptions[option] = "Disabled"
				button:SetBackdropColor(0.68,0.14,0.14,1)
			else
				UISkinOptions[option] = "Enabled"
				button:SetBackdropColor(0.6,0,0.86,1)
			end
		end)
	end
	
	local function pairsByKeys (t, f)
      local a = {}
      for n in pairs(t) do table.insert(a, n) end
      table.sort(a, f)
      local i = 0      -- iterator variable
      local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
      end
      return iter
    end
    local curX,curY,maxY=1,1,24
	for skin,options in pairsByKeys(Skins) do
		local addon = options.addon
		local buttonText = options.buttonText or addon
		if options.hide ~= "True" then
			if IsAddOnLoaded(addon) then
				if UISkinOptions[skin] == nil then UISkinOptions[skin] = "Enabled" end
				CreateButton(string.format('%sButton',skin),buttonText,addon,skin,curX,curY)
				SkinOptions:Height(110+(curY*20))
				SkinOptions2:Height(110+(curY*20))
				SkinOptions3:Height(110+(curY*20))
				curY = curY + 1
				if curY > maxY then
					curX = curX + 1
					curY = 1
				end
			end
		end
	end

	local Skins2 = {
		["DBMSkinHalf"] = {
			["buttonText"] = "DBM Half-Bar Skin",
			["addon"] = "DBM-Core"
		},
		["CLCProtSkin"] = {
			["buttonText"] = "CLCProt Icons",
			["addon"] = "CLCProt"
		},
		["CLCRetSkin"] = {
			["buttonText"] = "CLCRet Icons",
			["addon"] = "CLCRet"
		},
		["WeakAurasSkin"] = {
			["buttonText"] = "WeakAuras Icons",
			["addon"] = "WeakAuras"
		},
	}

	curY = 1
	for skin,options in pairsByKeys(Skins2) do
		local addon = nil
		local buttonText = options.buttonText
		CreateButton(string.format('%sButton',skin),buttonText,addon,skin,1,curY,true)
		curY = curY + 1
	end

	self:UnregisterEvent("PLAYER_ENTERING_WORLD")

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

SLASH_SKINOPTIONSWINDOW1 = '/skinoptions';
function SlashCmdList.SKINOPTIONSWINDOW(msg, editbox)
	if SkinOptions:IsVisible() then
		SkinOptions:Hide()
		print("Skin Control Panel is now |cffff2020Hidden|r.");
	else
		SkinOptions:Show()
		print("Skin Control Panel is now |cff00ff00Shown|r.");
	end
end

end)