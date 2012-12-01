local U = unpack(select(2,...))
local s = U.s
local c = U.c
local EmbeddingWindow = CreateFrame("Frame", "EmbeddingWindow", UIParent)
	UIFont = c["media"].font
	EmbeddingWindow:Hide()
	EmbeddingWindow:RegisterEvent("PLAYER_ENTERING_WORLD")
	EmbeddingWindow:RegisterEvent("PLAYER_REGEN_DISABLED")
	EmbeddingWindow:RegisterEvent("PLAYER_REGEN_ENABLED")
	EmbeddingWindow:RegisterEvent("PLAYER_ENTER_COMBAT")
	EmbeddingWindow:RegisterEvent("PLAYER_LEAVE_COMBAT")
	EmbeddingWindow:SetScript("OnEvent", function(self, event)

if event == "PLAYER_ENTERING_WORLD" then
	UISetup()
	EmbedWindowResize()

	ChatBackgroundRight:SetFrameStrata("Background")
	ChatBackgroundLeft:SetFrameStrata("Background")
	TabsRightBackground:SetParent(ChatBackgroundRight)
	TabsLeftBackground:SetParent(ChatBackgroundLeft)
	if ChatFrame4Tab:IsShown() then ChatFrame4Hide = True end
	EmbedToggleButton = CreateFrame("Button", "EmbedToggleButton", UIParent)
	U.SkinButton(EmbedToggleButton)
	EmbedToggleButton:Size(InfoRight:GetHeight()-4)
	EmbedToggleButton:FontString("text", c["media"].pixelfont, 14, "MONOCHROMEOUTLINE")
	EmbedToggleButton.text:SetText(">")
	EmbedToggleButton.text:SetPoint("CENTER", 2, 2)
	EmbedToggleButton:Point("RIGHT", InfoRight, "RIGHT", -2, 0)
	EmbedToggleButton:RegisterForClicks("LeftButtonDown", "RightButtonDown");
	UIFrameFadeOut(EmbedToggleButton, 0.2, EmbedToggleButton:GetAlpha(), 0)
	EmbedToggleButton:SetScript("OnClick", function(self, btn)
		if btn == 'LeftButton' then
		if IsAddOnLoaded("Tukui_ChatTweaks") and (ChatTweaksOptions.ChatHider == "Enabled") then
			if ChatBackgroundRight then
				if InfoRight.Faded then
					InfoRight.Faded = nil
					if not DuffedUI then UIFrameFadeIn(InfoRight, 0.2, InfoRight:GetAlpha(), 1) end
					UIFrameFadeIn(ChatBackgroundRight, 0.2, ChatBackgroundRight:GetAlpha(), 1)
				else
					InfoRight.Faded = true
					UIFrameFadeOut(ChatBackgroundRight, 0.2, ChatBackgroundRight:GetAlpha(), 0)
					if not DuffedUI then UIFrameFadeOut(InfoRight, 0.2, InfoRight:GetAlpha(), 0) end
				end
			end
		end
			else
				if ChatFrame4Hide then
					if ChatFrame4Tab:IsShown() then
						ChatFrame4Tab:Hide()
					else
						ChatFrame4Tab:Show()
					end
				end
				if (U.CheckOption("EmbedRecount","Recount")) or (U.CheckOption("EmbedRO")) then
					ToggleFrame(Recount_MainWindow)
				end
				if (U.CheckOption("EmbedSkada","Skada")) then
					Skada:ToggleWindow()
				end
				if (U.CheckOption("EmbedOmen","Omen")) or (U.CheckOption("EmbedRO")) then
					if OmenBarList:IsShown() then
						OmenBarList:Hide()
					else
						OmenBarList:Show()
					end
				end
				if (U.CheckOption("EmbedTDPS","TinyDPS")) then
					if tdpsFrame:IsShown() then
						tdpsFrame:Hide()
					else
						tdpsFrame:Show()
					end
				end
			end
		end)
		LeftChatToggleButton = CreateFrame("Button", "LeftChatToggleButton", UIParent)
		U.SkinButton(LeftChatToggleButton)
		LeftChatToggleButton:Size(InfoRight:GetHeight()-4)
		LeftChatToggleButton:FontString("text", c["media"].pixelfont, 14, "MONOCHROMEOUTLINE")
		LeftChatToggleButton.text:SetText("<")
		LeftChatToggleButton.text:SetPoint("CENTER", 2, 2)
		LeftChatToggleButton:Point("LEFT", InfoLeft, "LEFT", 2, 0)
		LeftChatToggleButton:RegisterForClicks("LeftButtonDown", "RightButtonDown");
		UIFrameFadeOut(LeftChatToggleButton, 0.2, LeftChatToggleButton:GetAlpha(), 0)
		LeftChatToggleButton:SetScript("OnClick", function(self, btn)
			if btn == 'LeftButton' then
			if IsAddOnLoaded("Tukui_ChatTweaks") and (ChatTweaksOptions.ChatHider == "Enabled") then
				if ChatBackgroundLeft then
					if InfoLeft.Faded then
						InfoLeft.Faded = nil
						if not DuffedUI then UIFrameFadeIn(InfoLeft, 0.2, InfoLeft:GetAlpha(), 1) end
						UIFrameFadeIn(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 1)
						UIFrameFadeIn(ChatBackgroundLeft, 0.2, ChatBackgroundLeft:GetAlpha(), 1)
					else
						InfoLeft.Faded = true
						if not DuffedUI then UIFrameFadeOut(InfoLeft, 0.2, InfoLeft:GetAlpha(), 0) end
						UIFrameFadeOut(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 0)
						UIFrameFadeOut(ChatBackgroundLeft, 0.2, ChatBackgroundLeft:GetAlpha(), 0)
					end
				end
			end
			else
				if SkinOptions:IsShown() or SkinOptions2:IsShown() or SkinOptions3:IsShown() then
					SkinOptions:Hide()
					SkinOptions2:Hide()
					SkinOptions3:Hide()
					SkinOptions1Button:SetParent(SkinOptions)
					SkinOptions2Button:SetParent(SkinOptions)
					EmbedWindowSettingsButton:SetParent(SkinOptions)
					ApplySkinSettingsButton:SetParent(SkinOptions)
					SkinOptionsCloseButton:SetParent(SkinOptions)
				else
					SkinOptions:Show()
				end
			end
		end)
		EmbedToggleButton:SetScript("OnEnter", function(self, ...)
			UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
			if InfoRight.Faded then
				if not DuffedUI then UIFrameFadeIn(InfoRight, 0.2, InfoRight:GetAlpha(), 1) end
				UIFrameFadeIn(ChatBackgroundRight, 0.2, ChatBackgroundRight:GetAlpha(), 1)
			end
			GameTooltip:SetOwner(self, 'ANCHOR_TOPRIGHT', 0, 4)
			GameTooltip:ClearLines()
			if IsAddOnLoaded("Tukui_ChatTweaks") and (ChatTweaksOptions.ChatHider == "Enabled") then
				if ChatBackgroundRight then
					GameTooltip:AddDoubleLine('Left Click:', 'Toggle Right Chat Panel', 1, 1, 1)
				end
			end
			GameTooltip:AddDoubleLine('Right Click:', 'Toggle Embedded AddOn', 1, 1, 1)
			GameTooltip:Show()
		end)
		EmbedToggleButton:SetScript("OnLeave", function(self, ...)
			UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
			if InfoRight.Faded then
				UIFrameFadeOut(ChatBackgroundRight, 0.2, ChatBackgroundRight:GetAlpha(), 0)
				if not DuffedUI then UIFrameFadeOut(InfoRight, 0.2, InfoRight:GetAlpha(), 0) end
			end
			GameTooltip:Hide()
		end)
		LeftChatToggleButton:SetScript("OnEnter", function(self, ...)
			UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
			if InfoLeft.Faded then
				if not DuffedUI then UIFrameFadeIn(InfoLeft, 0.2, InfoLeft:GetAlpha(), 1) end
				UIFrameFadeIn(ChatBackgroundLeft, 0.2, ChatBackgroundLeft:GetAlpha(), 1)
				UIFrameFadeIn(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 1)
			end
			GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT', 0, 4)
			GameTooltip:ClearLines()
			if IsAddOnLoaded("Tukui_ChatTweaks") and (ChatTweaksOptions.ChatHider == "Enabled") then
				if ChatBackgroundLeft then
					GameTooltip:AddDoubleLine('Left Click:', 'Toggle Left Chat Panel', 1, 1, 1)
				end
			end
			GameTooltip:AddDoubleLine('Right Click:','Toggle Extra Skins/Options', 1, 1, 1)
			GameTooltip:Show()
		end)
		LeftChatToggleButton:SetScript("OnLeave", function(self, ...)
			UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
			if InfoLeft.Faded then
				UIFrameFadeOut(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 0)
				UIFrameFadeOut(ChatBackgroundLeft, 0.2, ChatBackgroundLeft:GetAlpha(), 0)
				if not DuffedUI then UIFrameFadeOut(InfoLeft, 0.2, InfoLeft:GetAlpha(), 0) end
			end
			GameTooltip:Hide()
		end)

--Embed Check
	if not IsAddOnLoaded("Omen") then U.DisableOption("EmbedRO") U.DisableOption("EmbedOmen") end
	if not IsAddOnLoaded("Recount") then U.DisableOption("EmbedRO") end
	if U.CheckOption("EmbedRO") then EmbedRecountOmen() end
	if U.CheckOption("EmbedOmen") then EmbedOmen() end
--Embed Check Finished
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
			EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1)
			RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
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
			EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1)
			RecountEmbedButton:SetBackdropColor(0.11,0.66,0.11,1)
			SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
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
			EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1)
			RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
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
			EmbedTDPSButton:SetBackdropColor(0.68,0.14,0.14,1)
			RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1)
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
			RecountEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			SkadaEmbedButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedROButton:SetBackdropColor(0.68,0.14,0.14,1)
			EmbedOmenButton:SetBackdropColor(0.68,0.14,0.14,1)
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

	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

if event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_ENTER_COMBAT" or InCombatLockdown() then
--	print("Entering Combat")
	if (U.CheckOption("EmbedOoC")) then
		if ChatFrame4Hide then ChatFrame4Tab:Hide() end
		if (U.CheckOption("EmbedRecount","Recount"))  then
			Recount_MainWindow:Show()
		end
		if (U.CheckOption("EmbedSkada","Skada"))  then
			if Skada.db.profile.hidesolo then return end
			if Skada.db.profile.hidecombat then return end
			for _, window in ipairs(Skada:GetWindows()) do
				window:Show()
			end
		end
		if (U.CheckOption("EmbedRO","Recount","Omen")) then
			Recount_MainWindow:Show()
			OmenBarList:Show()
		end
		if (U.CheckOption("EmbedOmen","Omen"))  then
			OmenBarList:Show()
		end
		if (U.CheckOption("EmbedTDPS","TinyDPS")) then
			tdpsFrame:Show()
		end
	end
else
--	print("Exiting Combat")
	if (U.CheckOption("EmbedOoC")) then
		if ChatFrame4Hide then ChatFrame4Tab:Show() end
		if (U.CheckOption("EmbedRecount","Recount")) then
			Recount_MainWindow:Hide()
		end
		if (U.CheckOption("EmbedSkada","Skada")) then
			for _, window in ipairs(Skada:GetWindows()) do
				window:Hide()
			end
		end
		if (U.CheckOption("EmbedRO","Recount","Omen")) then
			Recount_MainWindow:Hide()
			OmenBarList:Hide()
		end
		if (U.CheckOption("EmbedOmen","Omen"))  then
			OmenBarList:Hide()
		end
		if (U.CheckOption("EmbedTDPS","TinyDPS")) then
			tdpsFrame:Hide()
		end
	end
end

end)

StaticPopupDialogs["RELOADUI"] = {
	text = "Reload your User Interface?",
        button1 = TEXT(ACCEPT),
        button2 = TEXT(CANCEL),
        OnAccept = function()
            ReloadUI()
        end,
        OnCancel = function(data, reason)
            if (reason == "timeout") then
                ReloadUI()
            else
                StaticPopupDialogs["RELOADUI"].reloadAccepted = false
            end
        end,
        OnHide = function()
            if (StaticPopupDialogs["RELOADUI"].reloadAccepted) then
                ReloadUI();
            end
        end,
        OnShow = function()
            StaticPopupDialogs["RELOADUI"].reloadAccepted = true;
        end,
        timeout = 5,
        hideOnEscape = 1,
        exclusive = 1,
        whileDead = 1
}

function EmbedRecountOmen()
	if not (U.CheckOption("EmbedRO","Recount","Omen")) then U.DisableOption("EmbedRO") return end
	if (U.CheckOption("EmbedOoC")) then
		if (U.CheckOption("EmbedRO")) then
			Recount_MainWindow:Hide()
			OmenBarList:Hide()
		end
	end
		OmenTitle:Kill()
		Omen.db.profile.Locked = true
		Omen:UpdateGrips()
		Omen.UpdateGrips = function(...)
			local db = Omen.db.profile
				Omen.VGrip1:ClearAllPoints()
				Omen.VGrip1:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip1, 0)
				Omen.VGrip1:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip1, 0)
				Omen.VGrip2:ClearAllPoints()
				Omen.VGrip2:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip2, 0)
				Omen.VGrip2:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip2, 0)
				Omen.Grip:Hide()
				if db.Locked then
					Omen.VGrip1:Hide()
					Omen.VGrip2:Hide()
				else
					Omen.VGrip1:Show()
					if db.Bar.ShowTPS then
						Omen.VGrip2:Show()
					else
						Omen.VGrip2:Hide()
					end
				end
		end
		U.SkinFrameD(OmenBarList)
		OmenAnchor:ClearAllPoints()
		Recount:LockWindows(true)
		Recount_MainWindow:ClearAllPoints()
		if ChatBackgroundRight then
			OmenBarList:SetParent(ChatBackgroundRight)
			Recount_MainWindow:SetParent(ChatBackgroundRight)
		end
		Recount_MainWindow:SetFrameStrata("HIGH")
		OmenBarList:SetFrameStrata("HIGH")
		EmbedRecountOmenResize()
end

function EmbedRecountOmenResize()
	if ChatBackgroundRight then
		OmenAnchor:SetWidth((ChatBackgroundRight:GetWidth() / 3) - ( 10 + s.mult))
		OmenAnchor:SetHeight(ChatBackgroundRight:GetHeight() - 20)
		OmenAnchor:SetPoint("TOPLEFT", ChatBackgroundRight, "TOPLEFT", 6, 10)
		Recount_MainWindow:SetWidth(((ChatBackgroundRight:GetWidth() / 3) + (ChatBackgroundRight:GetWidth() / 3)) - ( 1 + s.mult))
		Recount_MainWindow:SetHeight(ChatBackgroundRight:GetHeight() - 28)
		Recount_MainWindow:SetPoint("TOPRIGHT", ChatBackgroundRight,"TOPRIGHT", -6, 2)
	else
		OmenAnchor:SetWidth((EmbeddingWindow:GetWidth() / 3) - 2)
		OmenAnchor:SetHeight(EmbeddingWindow:GetHeight() + 4)
		OmenAnchor:SetPoint("BOTTOMLEFT", EmbeddingWindow, "BOTTOMLEFT", 0, 0)
		Recount_MainWindow:SetWidth((EmbeddingWindow:GetWidth() / 3) + (EmbeddingWindow:GetWidth() / 3))
		Recount_MainWindow:SetHeight(EmbeddingWindow:GetHeight() - 4)
		Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindow,"BOTTOMRIGHT", 0, 0)
	end
end

function EmbedWindowResize()
	if not ChatBackgroundRight then
		EmbeddingWindow:SetPoint("BOTTOM", InfoRight, "TOP", 0, 2)
		EmbeddingWindow:Size(InfoRight:GetWidth(), 142)			
	else
		if DuffedUI then
			EmbeddingWindow:SetInside(ChatBackgroundRight, 5, 5)
		else
			EmbeddingWindow:SetPoint("TOP", ChatBackgroundRight, "TOP", 0, -5)
			EmbeddingWindow:Size(InfoRight:GetWidth(), (ChatBackgroundRight:GetHeight() - 34))
		end
	end
	if (U.CheckOption("EmbedRO","Recount","Omen")) then EmbedRecountOmenResize() end
	if (U.CheckOption("EmbedTDPS","TinyDPS")) then EmbedTDPSResize() end
	if (U.CheckOption("EmbedRecount","Recount")) then EmbedRecountResize() end
end