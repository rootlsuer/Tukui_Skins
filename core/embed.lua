if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

function US:EmbedTooltip(frame)
	local r, l, b, t = frame:GetRight(), EmbeddingWindow:GetLeft(), frame:GetBottom(), EmbeddingWindow:GetTop()
	if not r or not l or not b or not t or r < l or b > t then return end
	local point, relativeTo, relativePoint, xOffset, yOffset = frame:GetPoint(1)
	if relativeTo == US.Tooltip and point == "BOTTOMRIGHT" and relativePoint == "TOPRIGHT" then
		local found = false
		if US:CheckOption("EmbedSkada","Skada") and Skada and Skada.GetWindows then
			for _, window in pairs(Skada:GetWindows()) do if window:IsShown() then found = true end end
		end
		if US:CheckOption("EmbedOmen","Omen") then
			if OmenBarList and OmenBarList:IsVisible() then found = true end
		end
		if US:CheckOption("EmbedRecount","Recount") then
			if Recount_MainWindow and Recount_MainWindow:IsShown() then found = true end
		end
		if US:CheckOption("EmbedTinyDPS","TinyDPS") then
			if tdpsFrame and tdpsFrame:IsShown() then found = true end
		end
		if found then
			frame:ClearAllPoints()
			frame:SetPoint(point, EmbeddingWindow, relativePoint, xOffset, yOffset)
		end
	end
end

GameTooltip:HookScript("OnUpdate", function(frame, ...) US:EmbedTooltip(frame) end)

function US:EmbedCheck(login)
	if US:CheckOption("EmbedOmen","Omen") then US:EmbedOmen() end
	if US:CheckOption("EmbedSkada","Skada") then
		US:EmbedSkada()
		if login then 
			hooksecurefunc(Skada, "CreateWindow", US.EmbedSkada)
			hooksecurefunc(Skada, "DeleteWindow", US.EmbedSkada)
		end
	end
	if US:CheckOption("EmbedTinyDPS","TinyDPS") then US:EmbedTDPS() end
	if US:CheckOption("EmbedRecount","Recount") then US:EmbedRecount() end
	if US:CheckOption("EmbedalDamageMeter","alDamageMeter") then US:EmbedALDamageMeter() end
end

function US:EmbedRecount()
	Recount:LockWindows(true)
	Recount_MainWindow:ClearAllPoints()
	US:EmbedRecountResize()
	if UISkinOptions["EmbedLeft"] == "Recount" then
		Recount_MainWindow:SetParent(EmbeddingWindowLeft)
	else
		Recount_MainWindow:SetParent(EmbeddingWindow)
	end
	Recount.MainWindow:SetFrameLevel(10)
end

function US:EmbedRecountResize()
	if not InCombatLockdown() then
		if UISkinOptions["EmbedLeft"] == "Recount" then
			Recount_MainWindow:SetPoint("TOPLEFT", EmbeddingWindowLeft,"TOPLEFT", 0, 7)
			Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindowLeft,"BOTTOMRIGHT", 0, 2)
		else
			Recount_MainWindow:SetPoint("TOPLEFT", EmbeddingWindow,"TOPLEFT", 0, 7)
			Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindow,"BOTTOMRIGHT", 0, 2)
		end
	end
end

function US:EmbedOmen()
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
	OmenAnchor:ClearAllPoints()
	if UISkinOptions["EmbedLeft"] == "Omen" then
		OmenBarList:SetParent(EmbeddingWindowLeft)
	else
		OmenBarList:SetParent(EmbeddingWindow)
	end
	OmenBarList:SetFrameLevel(10)
	EmbedOmenResize()
end

function US:EmbedOmenResize()
	if not InCombatLockdown() then
		if UISkinOptions["EmbedLeft"] == "Omen" then
			OmenBarList:SetPoint("TOPLEFT", EmbeddingWindowLeft, "TOPLEFT", 0, 0)
			OmenBarList:SetPoint("BOTTOMRIGHT", EmbeddingWindowLeft, "BOTTOMRIGHT", 0, 2)
		else
			OmenBarList:SetPoint("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)
			OmenBarList:SetPoint("BOTTOMRIGHT", EmbeddingWindow, "BOTTOMRIGHT", 0, 2)
		end
	end
end

function US:EmbedTDPS()
	US:SkinFrame(tdpsFrame, "Default")
	tdpsFrame:SetFrameLevel(10)
	if UISkinOptions["EmbedLeft"] == "TinyDPS" then
		tdpsFrame:SetParent(EmbeddingWindowLeft)
		tdpsAnchor:Point("TOPLEFT", EmbeddingWindowLeft, "TOPLEFT", 0, 0)
	else
		tdpsFrame:SetParent(EmbeddingWindow)
		tdpsAnchor:Point("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)
	end
	EmbedTDPSResize()
	tdpsRefresh()
end

function US:EmbedTDPSResize()
	if not InCombatLockdown() then
		if UISkinOptions["EmbedLeft"] == "TinyDPS" then
			tdpsFrame:SetWidth(EmbeddingWindowLeft:GetWidth())
		else
			tdpsFrame:SetWidth(EmbeddingWindow:GetWidth())
		end
		tdpsRefresh()
	end
end

function US:EmbedALDamageMeter()
	dmconf.maxbars = US:Round(EmbeddingWindow:GetHeight() / (dmconf.barheight + dmconf.spacing))
	dmconf.width = EmbeddingWindow:GetWidth()
	alDamageMeterFrame:ClearAllPoints()
	if UISkinOptions["EmbedLeft"] == "alDamageMeter" then
		alDamageMeterFrame:SetInside(EmbeddingWindowLeft, 1, 1)
		alDamageMeterFrame:SetParent(EmbeddingWindowLeft)
	else
		alDamageMeterFrame:SetInside(EmbeddingWindow, 1, 1)
		alDamageMeterFrame:SetParent(EmbeddingWindow)
	end
	alDamageMeterFrame:SetFrameLevel(10)
end

function US:EmbedSkada()
	local windows = {}
	for _, window in pairs(Skada:GetWindows()) do
		tinsert(windows, window)
	end

	local EmbedParent
	if UISkinOptions["EmbedLeft"] == "Skada" then
		EmbedParent = EmbeddingWindowLeft
	else
		EmbedParent = EmbeddingWindow
	end

	local height = US:CheckOption("SkadaBelowTop") and 43 or 18
	local yoffset = US:CheckOption("SkadaBelowTop") and -40 or -17

	local function EmbedWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
		local barmod = Skada.displays["bar"]
		window.db.barwidth = width
		window.db.background.height = height
		window.db.spark = false
		window.db.barslocked = true
		window.bargroup:ClearAllPoints()
		window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)
		window.bargroup:SetParent(EmbedParent)
		barmod.ApplySettings(barmod, window)
	end

	if(#windows == 1) then
		EmbedWindow(windows[1], EmbedParent:GetWidth() - 4, (EmbedParent:GetHeight() - 19), "TOPRIGHT", EmbedParent, "TOPRIGHT", -2, yoffset)
	elseif(#windows == 2) then
		if US:CheckOption("SkadaTwoThirds") then
			EmbedWindow(windows[1], (((EmbedParent:GetWidth() - 4) / 3) * 2) - 2, EmbedParent:GetHeight() - height, "TOPRIGHT", EmbedParent, "TOPRIGHT", -2, yoffset)
			EmbedWindow(windows[2], ((EmbedParent:GetWidth() - 4) / 3) - 2, EmbedParent:GetHeight() - height, "TOPLEFT", EmbedParent, "TOPLEFT", 2, yoffset)
		else
			EmbedWindow(windows[1], ((EmbedParent:GetWidth() - 4) / 2) - 2, EmbedParent:GetHeight() - height, "TOPRIGHT", EmbedParent, "TOPRIGHT", -2, yoffset)
			EmbedWindow(windows[2], ((EmbedParent:GetWidth() - 4) / 2) - 2, EmbedParent:GetHeight() - height, "TOPLEFT", EmbedParent, "TOPLEFT", 2, yoffset)
		end
	elseif(#windows > 2) then
		EmbedWindow(windows[1], ((EmbedParent:GetWidth() - 4) / 2) - 2, EmbedParent:GetHeight() - height, "TOPRIGHT", EmbedParent, "TOPRIGHT", -2, yoffset)
		EmbedWindow(windows[2], ((EmbedParent:GetWidth() - 4) / 2) - 2, (EmbedParent:GetHeight()/2) - height, "TOPLEFT", EmbedParent, "TOPLEFT", 2, yoffset)
		EmbedWindow(windows[3], ((EmbedParent:GetWidth() - 4) / 2) - 2, (EmbedParent:GetHeight()/2) - height, "TOPLEFT", windows[2], "BOTTOMLEFT", 0, -2)
	end
end

function US:EmbedWindowResize()
	if not US.ChatBackgroundRight then
		EmbeddingWindow:SetPoint("BOTTOM", US.InfoRight, "TOP", 0, 2)
		EmbeddingWindow:Size(US.InfoRight:GetWidth(), 142)
		EmbeddingWindowLeft:SetPoint("BOTTOM", US.InfoLeft, "TOP", 0, 2)
		EmbeddingWindowLeft:Size(US.InfoLeft:GetWidth(), 142)
	else
		if DuffedUI then
			EmbeddingWindow:SetInside(US.ChatBackgroundRight, 5, 5)
			EmbeddingWindowLeft:SetInside(US.ChatBackgroundLeft, 5, 5)
		else
			EmbeddingWindow:SetPoint("TOP", US.ChatBackgroundRight, "TOP", 0, -5)
			EmbeddingWindow:Size(U.InfoRight:GetWidth(), US.ChatBackgroundRight:GetHeight() - 34)
			EmbeddingWindowLeft:SetPoint("TOP", US.ChatBackgroundLeft, "TOP", 0, -5)
			EmbeddingWindowLeft:Size(U.InfoLeft:GetWidth(), US.ChatBackgroundLeft:GetHeight() - 34)
		end
	end
	US:EmbedCheck()
end

local EmbedOoCCombatStart, EmbedOoCCombatEnd -- Delay System Vars

local EmbeddingWindowLeft = CreateFrame("Frame", "EmbeddingWindowLeft", UIParent)
local EmbeddingWindow = CreateFrame("Frame", "EmbeddingWindow", UIParent)
EmbeddingWindow:RegisterEvent("PLAYER_ENTERING_WORLD")
EmbeddingWindow:RegisterEvent("PLAYER_REGEN_DISABLED")
EmbeddingWindow:RegisterEvent("PLAYER_REGEN_ENABLED")
EmbeddingWindow:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		US:EmbedWindowResize()
		US:EmbedCheck(true)
	end
	if event == "PLAYER_REGEN_DISABLED" or InCombatLockdown() then
		EmbedOoCCombatStart = true
		if US:CheckOption("EmbedOoC") then
			if ChatFrame4Hide then ChatFrame4Tab:Hide() end
			EmbeddingWindow:Show()
			EmbeddingWindowLeft:Show()
		end
	else
		EmbedOoCCombatStart = false
		if US:CheckOption("EmbedOoC") then
			if ChatFrame4Hide then ChatFrame4Tab:Show() end
			if EmbedOoCCombatEnd then return end
			EmbedOoCCombatEnd = true
			US:Delay(10, function()
				if not EmbedOoCCombatStart then
					EmbeddingWindow:Hide()
					EmbeddingWindowLeft:Hide()
				end
				EmbedOoCCombatEnd = false
			end)
		end
	end
end)

if US.ChatBackgroundRight then
	US.ChatBackgroundRight:SetFrameStrata("Background")
	US.ChatBackgroundLeft:SetFrameStrata("Background")
	US.TabsRightBackground:SetParent(US.ChatBackgroundRight)
	US.TabsLeftBackground:SetParent(US.ChatBackgroundLeft)
end

local function CreateToggleButton(name, buttontext, panel1, panel2, tooltiptext1, tooltiptext2)
	local frame = CreateFrame("Button", name, UIParent)
	frame:SetTemplate("Transparent")
	frame:Size(panel1:GetHeight())
	frame:FontString("text", US.ActionBarFont, 12)
	frame.text:SetText(buttontext)
	frame.text:SetPoint("CENTER", 0, 0)
	frame:RegisterForClicks("LeftButtonDown", "RightButtonDown")
	UIFrameFadeOut(frame, 0.2, frame:GetAlpha(), 0)
	frame:SetScript("OnClick", function(self, btn)
		if btn == 'LeftButton' then
			if IsAddOnLoaded("Tukui_ChatTweaks") and ChatTweaksOptions["ChatHider"] then
				if panel2 then
					if self.Faded then
						self.Faded = nil
						if not DuffedUI then UIFrameFadeIn(panel1, 0.2, panel1:GetAlpha(), 1) end
						UIFrameFadeIn(panel2, 0.2, panel2:GetAlpha(), 1)
						if name == "LeftToggleButton" then UIFrameFadeIn(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 1) end
					else
						self.Faded = true
						if not DuffedUI then UIFrameFadeOut(panel1, 0.2, panel1:GetAlpha(), 0) end
						UIFrameFadeOut(panel2, 0.2, panel2:GetAlpha(), 0)
						if name == "LeftToggleButton" then UIFrameFadeOut(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 0) end
					end
				end
			end
		end
	end)
	frame:SetScript("OnEnter", function(self, ...)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
		if self.Faded then
			if not DuffedUI then UIFrameFadeIn(panel1, 0.2, panel1:GetAlpha(), 1) end
			UIFrameFadeIn(panel2, 0.2, panel2:GetAlpha(), 1)
			if name == "LeftToggleButton" then UIFrameFadeIn(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 1) end
		end
		GameTooltip:SetOwner(self, name == "LeftToggleButton" and "ANCHOR_TOPLEFT" or "ANCHOR_TOPRIGHT", 0, 4)
		GameTooltip:ClearLines()
		if IsAddOnLoaded("Tukui_ChatTweaks") and ChatTweaksOptions["ChatHider"] then
			if US.ChatBackgroundRight then
				GameTooltip:AddDoubleLine("Left Click:", tooltiptext1, 1, 1, 1)
			end
		end
		GameTooltip:AddDoubleLine("Right Click:", tooltiptext2, 1, 1, 1)
		GameTooltip:Show()
	end)
	frame:SetScript("OnLeave", function(self, ...)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		if self.Faded then
			if not DuffedUI then UIFrameFadeOut(panel1, 0.2, panel1:GetAlpha(), 0) end
			UIFrameFadeOut(panel2, 0.2, panel2:GetAlpha(), 0)
			if name == "LeftToggleButton" then UIFrameFadeOut(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 0) end
		end
		GameTooltip:Hide()
	end)
end

CreateToggleButton("RightToggleButton", "►", US.InfoRight, US.ChatBackgroundRight, "Toggle Right Chat Panel", "Toggle Embedded AddOn")
RightToggleButton:Point("LEFT", US.InfoRight, "RIGHT", 2, 0)
RightToggleButton:HookScript("OnClick", function(self, btn)
	if btn == "RightButton" then
		if EmbeddingWindow:IsShown() then
			EmbeddingWindow:Hide()
			EmbeddingWindowLeft:Hide()
			if ChatFrame4Hide then ChatFrame4Tab:Show() end
		else
			EmbeddingWindow:Show()
			EmbeddingWindowLeft:Show()
			if ChatFrame4Hide then ChatFrame4Tab:Hide() end
		end
	end
end)
RightToggleButton:SetScript("PreClick", function(self) if ChatFrame4Tab:IsShown() then ChatFrame4Hide = true end end)

CreateToggleButton("LeftToggleButton", "◄", US.InfoLeft, US.ChatBackgroundLeft, "Toggle Left Chat Panel", "Toggle Extra Skins/Options")
LeftToggleButton:Point("RIGHT", US.InfoLeft, "LEFT", -2, 0)
LeftToggleButton:HookScript("OnClick", function(self, btn)
	local Ace3Options = IsAddOnLoaded("Enhanced_Config") and true or false
	if btn == "RightButton" then
		if not Ace3Options then
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
		else
		end
	end
end)