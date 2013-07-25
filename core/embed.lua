if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))
local format, gsub, pairs, ipairs, select, tinsert, tonumber = format, gsub, pairs, ipairs, select, tinsert, tonumber

function AS:EmbedTooltip(frame)
	local r, l, b, t = frame:GetRight(), EmbeddingWindow:GetLeft(), frame:GetBottom(), EmbeddingWindow:GetTop()
	if not r or not l or not b or not t or r < l or b > t then return end
	local point, relativeTo, relativePoint, xOffset, yOffset = frame:GetPoint(1)
	if relativeTo == frame and point == "BOTTOMRIGHT" and relativePoint == "TOPRIGHT" then
		local found = false
		if AS:CheckOption("EmbedSkada", "Skada") and Skada and Skada.GetWindows then
			for _, window in pairs(Skada:GetWindows()) do if window:IsShown() then found = true end end
		end
		if AS:CheckOption("EmbedOmen", "Omen") then
			if OmenBarList and OmenBarList:IsVisible() then found = true end
		end
		if AS:CheckOption("EmbedRecount", "Recount") then
			if Recount_MainWindow and Recount_MainWindow:IsShown() then found = true end
		end
		if AS:CheckOption("EmbedTinyDPS", "TinyDPS") then
			if tdpsFrame and tdpsFrame:IsShown() then found = true end
		end
		if found then
			frame:ClearAllPoints()
			frame:SetPoint(point, EmbeddingWindow, relativePoint, xOffset, yOffset)
		end
	end
end

if AS.TooltipEnable then
	GameTooltip:HookScript("OnUpdate", function(frame, ...) AS:EmbedTooltip(frame) end)
end

function AS:EmbedCheck(login)
	if not AS:CheckOption("EmbedSystem") then return end
	if AS:CheckOption("EmbedOmen", "Omen") then AS:EmbedOmen() end
	if AS:CheckOption("EmbedSkada", "Skada") then
		AS:EmbedSkada()
		if login then 
			hooksecurefunc(Skada, "CreateWindow", AS.EmbedSkada)
			hooksecurefunc(Skada, "DeleteWindow", AS.EmbedSkada)
		end
	end
	if AS:CheckOption("EmbedTinyDPS", "TinyDPS") then AS:EmbedTDPS() end
	if AS:CheckOption("EmbedRecount", "Recount") then AS:EmbedRecount() end
	if AS:CheckOption("EmbedalDamageMeter", "alDamageMeter") then AS:EmbedALDamageMeter() end
end

function AS:EmbedShow()
	if AS:CheckOption("EmbedSkada", "Skada") then
		for _, window in pairs(Skada:GetWindows()) do window:Show() end
	end
	if AS:CheckOption("EmbedOmen", "Omen") then
		OmenBarList:Show()
	end
	if AS:CheckOption("EmbedRecount", "Recount") then
		Recount_MainWindow:Show()
	end
	if AS:CheckOption("EmbedTinyDPS", "TinyDPS") then
		tdpsFrame:Show()
	end
	if AS:CheckOption("EmbedalDamageMeter", "alDamageMeter") then
		alDamageMeterFrame:Show()
	end
end


function AS:EmbedHide()
	if AS:CheckOption("EmbedSkada", "Skada") then
		for _, window in pairs(Skada:GetWindows()) do window:Hide() end
	end
	if AS:CheckOption("EmbedOmen", "Omen") then
		OmenBarList:Hide()
	end
	if AS:CheckOption("EmbedRecount", "Recount") then
		Recount_MainWindow:Hide()
	end
	if AS:CheckOption("EmbedTinyDPS", "TinyDPS") then
		tdpsFrame:Hide()
	end
	if AS:CheckOption("EmbedalDamageMeter", "alDamageMeter") then
		alDamageMeterFrame:Hide()
	end
end

function AS:EmbedRecount()
	Recount:LockWindows(true)
	Recount_MainWindow:ClearAllPoints()
	AS:EmbedRecountResize()
	local Parent = UISkinOptions["EmbedLeft"] == "Recount" and EmbeddingWindowLeft or EmbeddingWindow
	Recount_MainWindow:SetParent(Parent)
	Recount_MainWindow:SetFrameLevel(10)
end

function AS:EmbedRecountResize()
--	if not InCombatLockdown() then
		local Parent = UISkinOptions["EmbedLeft"] == "Recount" and EmbeddingWindowLeft or EmbeddingWindow
		Recount_MainWindow:SetPoint("TOPLEFT", Parent, "TOPLEFT", 0, 7)
		Recount_MainWindow:SetPoint("BOTTOMRIGHT", Parent, "BOTTOMRIGHT", 0, 2)
--	end
end

function AS:EmbedOmen()
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
	local Parent = UISkinOptions["EmbedLeft"] == "Omen" and EmbeddingWindowLeft or EmbeddingWindow
	OmenBarList:SetParent(Parent)
	OmenBarList:SetFrameLevel(10)
	AS:EmbedOmenResize()
end

function AS:EmbedOmenResize()
--	if not InCombatLockdown() then
	local Parent = UISkinOptions["EmbedLeft"] == "Omen" and EmbeddingWindowLeft or EmbeddingWindow
	OmenBarList:SetPoint("TOPLEFT", Parent, "TOPLEFT", 0, 0)
	OmenBarList:SetPoint("BOTTOMRIGHT", Parent, "BOTTOMRIGHT", 0, 2)
--	end
end

function AS:EmbedTDPS()
	AS:SkinFrame(tdpsFrame, "Default")
	tdpsFrame:SetFrameLevel(10)
	local Parent = UISkinOptions["EmbedLeft"] == "TinyDPS" and EmbeddingWindowLeft or EmbeddingWindow
	tdpsFrame:SetParent(Parent)
	tdpsAnchor:Point("TOPLEFT", Parent, "TOPLEFT", 0, 0)
	AS:EmbedTDPSResize()
	tdpsRefresh()
end

function AS:EmbedTDPSResize()
--	if not InCombatLockdown() then
	local Parent = UISkinOptions["EmbedLeft"] == "TinyDPS" and EmbeddingWindowLeft or EmbeddingWindow
	tdpsFrame:SetWidth(Parent:GetWidth())
	tdpsRefresh()
--	end
end

function AS:EmbedALDamageMeter()
	dmconf.maxbars = AS:Round(EmbeddingWindow:GetHeight() / (dmconf.barheight + dmconf.spacing))
	dmconf.width = EmbeddingWindow:GetWidth()
	alDamageMeterFrame:ClearAllPoints()
	local Parent = UISkinOptions["EmbedLeft"] == "alDamageMeter" and EmbeddingWindowLeft or EmbeddingWindow
	alDamageMeterFrame:SetInside(Parent, 1, 1)
	alDamageMeterFrame:SetParent(Parent)
	alDamageMeterFrame:SetFrameLevel(10)
end

function AS:EmbedSkada()
	local windows = {}
	for _, window in pairs(Skada:GetWindows()) do
		tinsert(windows, window)
	end

	local EmbedParent = UISkinOptions["EmbedLeft"] == "Skada" and EmbeddingWindowLeft or EmbeddingWindow

	local height = AS:CheckOption("SkadaBelowTop") and 43 or 18
	local yoffset = AS:CheckOption("SkadaBelowTop") and -40 or -17

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
		if AS:CheckOption("SkadaTwoThirds") then
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

function AS:EmbedWindowResize()
	if not AS.ChatBackgroundRight then
		EmbeddingWindow:SetPoint("BOTTOM", AS.InfoRight, "TOP", 0, 2)
		EmbeddingWindow:Size(AS.InfoRight:GetWidth(), 142)
		EmbeddingWindowLeft:SetPoint("BOTTOM", AS.InfoLeft, "TOP", 0, 2)
		EmbeddingWindowLeft:Size(AS.InfoLeft:GetWidth(), 142)
	else
		if DuffedUI then
			EmbeddingWindow:SetInside(AS.ChatBackgroundRight, 5, 5)
			EmbeddingWindowLeft:SetInside(AS.ChatBackgroundLeft, 5, 5)
		else
			EmbeddingWindow:SetPoint("TOP", AS.ChatBackgroundRight, "TOP", 0, -5)
			EmbeddingWindow:Size(AS.InfoRight:GetWidth(), AS.ChatBackgroundRight:GetHeight() - 34)
			EmbeddingWindowLeft:SetPoint("TOP", AS.ChatBackgroundLeft, "TOP", 0, -5)
			EmbeddingWindowLeft:Size(AS.InfoLeft:GetWidth(), AS.ChatBackgroundLeft:GetHeight() - 34)
		end
	end
	AS:EmbedCheck()
end

local EmbedOoCCombatStart, EmbedOoCCombatEnd -- Delay System Vars

local EmbeddingWindowLeft = CreateFrame("Frame", "EmbeddingWindowLeft", UIParent)
local EmbeddingWindow = CreateFrame("Frame", "EmbeddingWindow", UIParent)
EmbeddingWindow:RegisterEvent("PLAYER_ENTERING_WORLD")
EmbeddingWindow:RegisterEvent("PLAYER_REGEN_DISABLED")
EmbeddingWindow:RegisterEvent("PLAYER_REGEN_ENABLED")
EmbeddingWindow:SetScript("OnShow", AS.EmbedShow)
EmbeddingWindow:SetScript("OnHide", AS.EmbedHide)
EmbeddingWindow:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		AS:EmbedWindowResize()
		AS:EmbedCheck(true)
	end
	if event == "PLAYER_REGEN_DISABLED" or InCombatLockdown() then
		EmbedOoCCombatStart = true
		if AS:CheckOption("EmbedOoC") then
			if ChatFrame4Hide then ChatFrame4Tab:Hide() end
			EmbeddingWindow:Show()
			EmbeddingWindowLeft:Show()
		end
	else
		EmbedOoCCombatStart = false
		if AS:CheckOption("EmbedOoC") then
			if ChatFrame4Hide then ChatFrame4Tab:Show() end
			if EmbedOoCCombatEnd then return end
			EmbedOoCCombatEnd = true
			AS:Delay(10, function()
				if not EmbedOoCCombatStart then
					EmbeddingWindow:Hide()
					EmbeddingWindowLeft:Hide()
				end
				EmbedOoCCombatEnd = false
			end)
		end
	end
end)

if AS.ChatBackgroundRight then
	AS.ChatBackgroundRight:SetFrameStrata("Background")
	AS.ChatBackgroundLeft:SetFrameStrata("Background")
	AS.TabsRightBackground:SetParent(AS.ChatBackgroundRight)
	AS.TabsLeftBackground:SetParent(AS.ChatBackgroundLeft)
end

local function CreateToggleButton(name, buttontext, panel1, panel2, tooltiptext1, tooltiptext2)
	local frame = CreateFrame("Button", name, UIParent)
	frame:SetTemplate("Transparent")
	frame:Size(panel1:GetHeight())
	--frame:FontString("text", AS.ActionBarFont, 12)
	frame:FontString("text", AS.PixelFont, 12)
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
			if AS.ChatBackgroundRight then
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

CreateToggleButton("RightToggleButton", ">", AS.InfoRight, AS.ChatBackgroundRight, "Toggle Right Chat Panel", "Toggle Embedded AddOn")
--CreateToggleButton("RightToggleButton", "►", AS.InfoRight, AS.ChatBackgroundRight, "Toggle Right Chat Panel", "Toggle Embedded AddOn")
RightToggleButton:Point("LEFT", AS.InfoRight, "RIGHT", 2, 0)
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

CreateToggleButton("LeftToggleButton", "<", AS.InfoLeft, AS.ChatBackgroundLeft, "Toggle Left Chat Panel", "Toggle Extra Skins/Options")
--CreateToggleButton("LeftToggleButton", "◄", AS.InfoLeft, AS.ChatBackgroundLeft, "Toggle Left Chat Panel", "Toggle Extra Skins/Options")
LeftToggleButton:Point("RIGHT", AS.InfoLeft, "LEFT", -2, 0)
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
			Enhanced_Config[1]:ToggleConfig()
		end
	end
end)

if tonumber(GetAddOnMetadata('Tukui', 'Version')) >= 16 then
local DataText = AS["DataTexts"]

local Update = function(self)
	local Text = ''
	if AS:CheckOption('EmbedRecount', 'Recount') then Text = 'Recount' end
	if AS:CheckOption('EmbedRO', 'Recount', 'Omen') then Text = 'Recount/Omen' end
	if AS:CheckOption('EmbedSkada', 'Skada') then Text = 'Skada' end
	if AS:CheckOption('EmbedOmen', 'Omen') then Text = 'Omen' end
	if AS:CheckOption('EmbedTDPS', 'TinyDPS') then Text = 'TinyDPS' end
	self.Text:SetText(format('%s %s', L.DataText.Toggle, Text))
end

local function OnClick(self, button)
	if button == 'LeftButton' then
		AS:EmbedShow()
	elseif button == 'RightButton' then
		AS:EmbedHide()
	end
end

local function OnEnter(self)
	local Panel, Anchor, xOff, yOff = self:GetTooltipAnchor()
	GameTooltip:SetOwner(Panel, Anchor, xOff, yOff)
	GameTooltip:ClearLines()
	GameTooltip:AddLine('Left Click to Show')
	GameTooltip:AddLine('Right Click to Hide')
	GameTooltip:Show()
	self:Update()
end

local Enable = function(self)
	if (not self.Text) then
		local Text = self:CreateFontString(nil, 'OVERLAY')
		Text:SetFont(DataText.Font, DataText.Size, DataText.Flags)

		self.Text = Text
	end

	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:SetScript('OnEvent', Update)
	self:SetScript('OnEnter', OnEnter)
	self:SetScript('OnLeave', GameTooltip_Hide)
	self:Update()
end

local Disable = function(self)
	self.Text:SetText('')
	self:SetScript('OnEvent', nil)
	self:UnregisterAllEvents()
end

DataText:Register('EmbedSystem', Enable, Disable, Update)
end