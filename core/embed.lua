if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local s = U.s
local c = U.c

local EmbeddingWindowLeft = CreateFrame("Frame", "EmbeddingWindowLeft", UIParent)
local EmbeddingWindow = CreateFrame("Frame", "EmbeddingWindow", UIParent)
	EmbeddingWindow:RegisterEvent("PLAYER_ENTERING_WORLD")
	EmbeddingWindow:RegisterEvent("PLAYER_REGEN_DISABLED")
	EmbeddingWindow:RegisterEvent("PLAYER_REGEN_ENABLED")
	EmbeddingWindow:SetScript("OnEvent", function(self, event)

if event == "PLAYER_ENTERING_WORLD" then
	UISetup()
	EmbedWindowResize()
	if ChatBackgroundRight then
		ChatBackgroundRight:SetFrameStrata("Background")
		ChatBackgroundLeft:SetFrameStrata("Background")
		TabsRightBackground:SetParent(ChatBackgroundRight)
		TabsLeftBackground:SetParent(ChatBackgroundLeft)
	end
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
				if EmbeddingWindow:IsShown() then
					EmbeddingWindow:Hide()
					EmbeddingWindowLeft:Hide()
				else
					EmbeddingWindow:Show()
					EmbeddingWindowLeft:Show()
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
	if (U.CheckOption("EmbedOmen","Omen")) then EmbedOmen() end
	if (U.CheckOption("EmbedSkada","Skada")) then EmbedSkada() end
	if (U.CheckOption("EmbedTinyDPS","TinyDPS")) then EmbedTDPS() end
	if (U.CheckOption("EmbedRecount","Recount")) then EmbedRecount() end
--Embed Check Finished

	local function EmbedTooltip(self)
		local r, l, b, t = self:GetRight(), EmbeddingWindow:GetLeft(), self:GetBottom(), EmbeddingWindow:GetTop()
		if not r or not l or not b or not t or r < l or b > t then return end
		local point, relativeTo, relativePoint, xOffset, yOffset = self:GetPoint(1)
		if relativeTo == TukuiTooltipAnchor and point == "BOTTOMRIGHT" and relativePoint == "TOPRIGHT" then
			local found = false
			if U.CheckOption("EmbedSkada","Skada") and Skada and Skada.GetWindows then
				for _, window in ipairs(Skada:GetWindows()) do if window:IsShown() then found = true end end
			end
			if (U.CheckOption("EmbedOmen","Omen")) then
				if OmenBarList and OmenBarList:IsVisible() then found = true end
			end
			if (U.CheckOption("EmbedRecount","Recount")) then
				if Recount_MainWindow and Recount_MainWindow:IsShown() then found = true end
			end
			if (U.CheckOption("EmbedTinyDPS","TinyDPS")) then
				if tdpsFrame and tdpsFrame:IsShown() then found = true end
			end
			if found then
				self:ClearAllPoints()
				self:SetPoint(point, EmbeddingWindow, relativePoint, xOffset, yOffset)
			end
		end
	end
	GameTooltip:HookScript("OnUpdate", function(self, ...) EmbedTooltip(self) end)

	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

	if event == "PLAYER_REGEN_DISABLED" or InCombatLockdown() then
		if (U.CheckOption("EmbedOoC")) then
			if ChatFrame4Hide then ChatFrame4Tab:Hide() end
			EmbeddingWindow:Show()
			EmbeddingWindowLeft:Show()
		end
	else
		if (U.CheckOption("EmbedOoC")) then
			if ChatFrame4Hide then ChatFrame4Tab:Show() end
			EmbeddingWindow:Hide()
			EmbeddingWindowLeft:Hide()
		end
	end
end)

function EmbedRecount()
	Recount:LockWindows(true)
	Recount_MainWindow:ClearAllPoints()
	EmbedRecountResize()
	if UISkinOptions.EmbedLeft == "Recount" then
		Recount_MainWindow:SetParent(EmbeddingWindowLeft)
	else
		Recount_MainWindow:SetParent(EmbeddingWindow)
	end
	Recount.MainWindow:SetFrameStrata("HIGH")
end

function EmbedRecountResize()
	if not InCombatLockdown() then
		if UISkinOptions.EmbedLeft == "Recount" then
			Recount_MainWindow:SetPoint("TOPLEFT", EmbeddingWindowLeft,"TOPLEFT", 0, 7)
			Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindowLeft,"BOTTOMRIGHT", 0, 2)
		else
			Recount_MainWindow:SetPoint("TOPLEFT", EmbeddingWindow,"TOPLEFT", 0, 7)
			Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindow,"BOTTOMRIGHT", 0, 2)
		end
	end
end

function EmbedOmen()
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
		OmenTitle:Kill()
		U.SkinFrame(OmenBarList, "Default")
		OmenAnchor:ClearAllPoints()
		if UISkinOptions.EmbedLeft == "Omen" then
			OmenBarList:SetParent(EmbeddingWindowLeft)
		else
			OmenBarList:SetParent(EmbeddingWindow)
		end
		OmenBarList:SetFrameStrata("HIGH")
		EmbedOmenResize()
end

function EmbedOmenResize()
	if not InCombatLockdown() then
		if UISkinOptions.EmbedLeft == "Omen" then
			OmenBarList:SetPoint("TOPLEFT", EmbeddingWindowLeft, "TOPLEFT", 0, 0)
			OmenBarList:SetPoint("BOTTOMRIGHT", EmbeddingWindowLeft, "BOTTOMRIGHT", 0, 2)
		else
			OmenBarList:SetPoint("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)
			OmenBarList:SetPoint("BOTTOMRIGHT", EmbeddingWindow, "BOTTOMRIGHT", 0, 2)
		end
	end
end

function EmbedTDPS()
	if UISkinOptions.EmbedLeft == "TinyDPS" then
		tdpsFrame:SetParent(EmbeddingWindowLeft)
	else
		tdpsFrame:SetParent(EmbeddingWindow)
	end
	U.SkinFrame(tdpsFrame, "Default")
	tdpsFrame:SetFrameStrata("MEDIUM")
	tdpsFrame.spacing = 0
	tdpsFrame.barHeight = 14
	tdpsVisibleBars = 9
	EmbedTDPSResize()

	tdpsRefresh()
end

function EmbedTDPSResize()
	if not InCombatLockdown() then
		tdpsFrame:ClearAllPoints()
		tdpsAnchor:ClearAllPoints()
		if UISkinOptions.EmbedLeft == "TinyDPS" then
			tdpsFrame:SetWidth(EmbeddingWindowLeft:GetWidth())
			tdpsAnchor:Point("TOPLEFT", EmbeddingWindowLeft, "TOPLEFT", 0, 0)
		else
			tdpsFrame:SetWidth(EmbeddingWindow:GetWidth())
			tdpsAnchor:Point("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)
		end
	end
	tdpsRefresh()
end

if IsAddOnLoaded("Skada") then

	local Skada = Skada
	local barSpacing = 1
	local borderWidth = 1
	local barmod = Skada.displays["bar"]

	local function EmbedWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
		window.db.barwidth = width
		window.db.background.height = height
		window.db.spark = false
		window.db.barslocked = true
		window.bargroup:ClearAllPoints()
		window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)
	
		barmod.ApplySettings(barmod, window)
	end

	local windows = {}
	function EmbedSkada()
		if UISkinOptions.EmbedLeft == "Skada" then
			if(#windows == 1) then
				EmbedWindow(windows[1], EmbeddingWindowLeft:GetWidth() - 4, (EmbeddingWindowLeft:GetHeight() - 19), "TOPRIGHT", EmbeddingWindowLeft, "TOPRIGHT", -2, -17)
			elseif(#windows == 2) then
				EmbedWindow(windows[1], ((EmbeddingWindowLeft:GetWidth() - 4) / 2) - (borderWidth + s.mult), EmbeddingWindowLeft:GetHeight() - 19, "TOPRIGHT", EmbeddingWindowLeft, "TOPRIGHT", -2, -17)
				EmbedWindow(windows[2], ((EmbeddingWindowLeft:GetWidth() - 4) / 2) - (borderWidth + s.mult), EmbeddingWindowLeft:GetHeight() - 19, "TOPLEFT", EmbeddingWindowLeft, "TOPLEFT", 2, -17)
			end
		else
			if(#windows == 1) then
				EmbedWindow(windows[1], EmbeddingWindow:GetWidth() - 4, (EmbeddingWindow:GetHeight() - 19), "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, -17)
			elseif(#windows == 2) then
				EmbedWindow(windows[1], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + s.mult), EmbeddingWindow:GetHeight() - 19, "TOPRIGHT", EmbeddingWindow, "TOPRIGHT", -2, -17)
				EmbedWindow(windows[2], ((EmbeddingWindow:GetWidth() - 4) / 2) - (borderWidth + s.mult), EmbeddingWindow:GetHeight() - 19, "TOPLEFT", EmbeddingWindow, "TOPLEFT", 2, -17)
			end
		end
	end

	for _, window in ipairs( Skada:GetWindows() ) do
		window:UpdateDisplay()
	end

	Skada.CreateWindow_ = Skada.CreateWindow
	function Skada:CreateWindow(name, db)
		Skada:CreateWindow_(name, db)

		windows = {}
		for _, window in ipairs(Skada:GetWindows()) do
			tinsert(windows, window)
		end
		hooksecurefunc(Skada, "CreateWindow", function()	
			if U.CheckOption("EmbedSkada") then
				EmbedSkada()
			end
		end)
	end

	Skada.DeleteWindow_ = Skada.DeleteWindow
	function Skada:DeleteWindow( name )
		Skada:DeleteWindow_( name )
		windows = {}
		for _, window in ipairs( Skada:GetWindows() ) do
			tinsert( windows, window )
		end
		if(U.CheckOption("EmbedSkada")) then
			EmbedSkada()
		end
	end

end

function EmbedWindowResize()
	if not ChatBackgroundRight then
		EmbeddingWindow:SetPoint("BOTTOM", InfoRight, "TOP", 0, 2)
		EmbeddingWindow:Size(InfoRight:GetWidth(), 142)
		EmbeddingWindowLeft:SetPoint("BOTTOM", InfoLeft, "TOP", 0, 2)
		EmbeddingWindowLeft:Size(InfoLeft:GetWidth(), 142)
	else
		if DuffedUI then
			EmbeddingWindow:SetInside(ChatBackgroundRight, 5, 5)
			EmbeddingWindowLeft:SetInside(ChatBackgroundLeft, 5, 5)
		else
			EmbeddingWindow:SetPoint("TOP", ChatBackgroundRight, "TOP", 0, -5)
			EmbeddingWindow:Size(InfoRight:GetWidth(), (ChatBackgroundRight:GetHeight() - 34))
			EmbeddingWindowLeft:SetPoint("TOP", ChatBackgroundLeft, "TOP", 0, -5)
			EmbeddingWindowLeft:Size(InfoLeft:GetWidth(), (ChatBackgroundLeft:GetHeight() - 34))
		end
	end
	if (U.CheckOption("EmbedRO","Recount","Omen")) then EmbedRecountOmenResize() end
	if (U.CheckOption("EmbedTinyDPS","TinyDPS")) then EmbedTDPSResize() end
	if (U.CheckOption("EmbedRecount","Recount")) then EmbedRecountResize() end
	if (U.CheckOption("EmbedOmen","Omen")) then EmbedOmenResize() end
end