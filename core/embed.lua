if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2, ...))
local L = AS.Locale

local format, gsub, pairs, ipairs, select, tinsert, tonumber = format, gsub, pairs, ipairs, select, tinsert, tonumber

local EmbedOoCCombatStart
local SkadaWindows = {}
local Ace3Options = IsAddOnLoaded('Enhanced_Config') and true or false

local EmbedSystem_MainWindow = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
local EmbedSystem_LeftWindow = CreateFrame('Frame', 'EmbedSystem_LeftWindow', EmbedSystem_MainWindow)
local EmbedSystem_RightWindow = CreateFrame('Frame', 'EmbedSystem_RightWindow', EmbedSystem_MainWindow)

function AS:Embed_Init()
	EmbedSystem_MainWindow:RegisterEvent('PLAYER_REGEN_DISABLED')
	EmbedSystem_MainWindow:RegisterEvent('PLAYER_REGEN_ENABLED')
	EmbedSystem_MainWindow:SetScript('OnShow', AS.Embed_Show)
	EmbedSystem_MainWindow:SetScript('OnHide', AS.Embed_Hide)
	EmbedSystem_MainWindow:SetScript('OnEvent', function(self, event)
		if event == 'PLAYER_REGEN_DISABLED' then
			EmbedOoCCombatStart = true
			if AS:CheckOption('EmbedOoC') then
				EmbedSystem_MainWindow:Show()
			end
		else
			EmbedOoCCombatStart = false
			if AS:CheckOption('EmbedOoC') then
				AS:Delay(10, function()
					if not EmbedOoCCombatStart then
						EmbedSystem_MainWindow:Hide()
					end
				end)
			end
		end
	end)

	AS:EmbedSystem_WindowResize()
	AS:Embed_Check(true)
	if AS:CheckOption('EmbedOoC') and not InCombatLockdown() then AS:Embed_Hide() end

	local function CreateToggleButton(Name, Text, Panel1, Panel2, TooltipText1, TooltipText2)
		local Frame = CreateFrame('Button', Name, UIParent)
		Frame:SetFrameStrata("DIALOG")
		Frame:SetTemplate('Transparent')
		Frame:Size(17, Panel1:GetHeight() - 4)
		Frame:FontString('Text', AS.ActionBarFont, 12)
		Frame.Text:SetText(Text)
		Frame.Text:SetPoint('CENTER', 0, 1)
		Frame:RegisterForClicks('LeftButtonDown', 'RightButtonDown')
		UIFrameFadeOut(Frame, 0.2, Frame:GetAlpha(), 0)
		Frame:SetScript('OnEnter', function(self, ...)
			UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
			if self.Faded then
				if not DuffedUI then UIFrameFadeIn(Panel1, 0.2, Panel1:GetAlpha(), 1) end
				UIFrameFadeIn(Panel2, 0.2, Panel2:GetAlpha(), 1)
				if Name == 'LeftToggleButton' then UIFrameFadeIn(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 1) end
			end
			GameTooltip:SetOwner(self, Name == 'LeftToggleButton' and 'ANCHOR_TOPLEFT' or 'ANCHOR_TOPRIGHT', 0, 4)
			GameTooltip:ClearLines()
			if IsAddOnLoaded('Tukui_ChatTweaks') and ChatTweaksOptions['ChatHider'] then
				if AS.ChatBackgroundRight then
					GameTooltip:AddDoubleLine('Left Click:', TooltipText1, 1, 1, 1)
				end
			end
			GameTooltip:AddDoubleLine('Right Click:', TooltipText2, 1, 1, 1)
			GameTooltip:Show()
		end)
		Frame:SetScript('OnLeave', function(self, ...)
			UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
			if self.Faded then
				if not DuffedUI then UIFrameFadeOut(Panel1, 0.2, Panel1:GetAlpha(), 0) end
				UIFrameFadeOut(Panel2, 0.2, Panel2:GetAlpha(), 0)
				if Name == 'LeftToggleButton' then UIFrameFadeOut(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 0) end
			end
			GameTooltip:Hide()
		end)
	end

	CreateToggleButton('RightToggleButton', '►', AS.InfoRight, AS.ChatBackgroundRight, L.Skins.ToggleRightChat, L.Skins.ToggleEmbed)
	RightToggleButton:Point('RIGHT', AS.InfoRight, 'RIGHT', -2, 0)

	RightToggleButton:HookScript('OnClick', function(self, button)
		if button == 'RightButton' then
			if EmbedSystem_MainWindow:IsShown() then
				EmbedSystem_MainWindow:Hide()
			else
				EmbedSystem_MainWindow:Show()
			end
		end
	end)

	CreateToggleButton('LeftToggleButton', '◄', AS.InfoLeft, AS.ChatBackgroundLeft, L.Skins.ToggleLeftChat, L.Skins.ToggleOptions)
	LeftToggleButton:Point('LEFT', AS.InfoLeft, 'LEFT', 2, 0)
	LeftToggleButton:HookScript('OnClick', function(self, button)
		if button == 'RightButton' then
			if not Ace3Options then
				if SkinOptions_Main:IsShown() then
					SkinOptions_Main:Hide()
				else
					SkinOptions_Main:Show()
				end
			else
				Enhanced_Config[1]:ToggleConfig()
			end
		end
	end)
end

function AS:Embed_Show()
	if AS:CheckOption('EmbedSystem') then
		if _G[EmbedSystem_MainWindow.FrameName] then _G[EmbedSystem_MainWindow.FrameName]:Show() end
	end
	if AS:CheckOption('EmbedSystemDual') then
		EmbedSystem_LeftWindow:Show()
		EmbedSystem_RightWindow:Show()
		if _G[EmbedSystem_LeftWindow.FrameName] then _G[EmbedSystem_LeftWindow.FrameName]:Show() end
		if _G[EmbedSystem_RightWindow.FrameName] then _G[EmbedSystem_RightWindow.FrameName]:Show() end
	end
end

function AS:Embed_Hide()
	EmbedSystem_LeftWindow:Hide()
	EmbedSystem_RightWindow:Hide()
end

function AS:EmbedSystem_WindowResize()
	if not AS.ChatBackgroundRight then
		EmbedSystem_MainWindow:SetPoint('BOTTOM', AS.InfoRight, 'TOP', 0, 2)
		EmbedSystem_MainWindow:SetSize(AS.InfoRight:GetWidth(), 142)
	else
		if DuffedUI then
			EmbedSystem_MainWindow:SetPoint('BOTTOM', AS.ChatBackgroundRight, 'BOTTOM', 0, 4)
			EmbedSystem_MainWindow:SetSize(AS.ChatBackgroundRight:GetWidth() - 8, AS.ChatBackgroundRight:GetHeight() - (AS:CheckOption('EmbedBelowTop') and 29 or 8))
		else
			EmbedSystem_MainWindow:SetPoint('BOTTOM', AS.InfoRight, 'TOP', 0, 1)
			EmbedSystem_MainWindow:SetSize(AS.InfoRight:GetWidth(), AS.ChatBackgroundRight:GetHeight() - (AS:CheckOption('EmbedBelowTop') and 60 or 36))
		end
	end
	EmbedSystem_LeftWindow:SetPoint('RIGHT', EmbedSystem_RightWindow, 'LEFT', -2, 0)
	EmbedSystem_RightWindow:SetPoint('RIGHT', EmbedSystem_MainWindow, 'RIGHT', 0, 0)
	EmbedSystem_LeftWindow:SetSize(AS:CheckOption('EmbedLeftWidth') - 1, EmbedSystem_MainWindow:GetHeight())
	EmbedSystem_RightWindow:SetSize((EmbedSystem_MainWindow:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, EmbedSystem_MainWindow:GetHeight())

	if Enhanced_Config[1].Options.args.skins then
		Enhanced_Config[1].Options.args.skins.args.embed.args.EmbedLeftWidth.min = floor(EmbedSystem_MainWindow:GetWidth() * .25)
		Enhanced_Config[1].Options.args.skins.args.embed.args.EmbedLeftWidth.max = floor(EmbedSystem_MainWindow:GetWidth() * .75)
	end
end

function AS:Embed_Check(Message)
	if not (AS:CheckOption('EmbedSystem') or AS:CheckOption('EmbedSystemDual')) then return end
	AS:Embed_Toggle(Message)
	if AS:CheckOption('EmbedOmen', 'Omen') then AS:Embed_Omen() end
	if AS:CheckOption('EmbedSkada', 'Skada') then AS:Embed_Skada() end
	if AS:CheckOption('EmbedTinyDPS', 'TinyDPS') then AS:Embed_TinyDPS() end
	if AS:CheckOption('EmbedRecount', 'Recount') then AS:Embed_Recount() end
	if AS:CheckOption('EmbedalDamageMeter', 'alDamageMeter') then AS:Embed_alDamageMeter() end
end

function AS:Embed_Toggle(Message)
	local MainEmbed, LeftEmbed, RightEmbed = 'NONE', 'NONE', 'NONE'
	EmbedSystem_MainWindow.FrameName = nil
	EmbedSystem_LeftWindow.FrameName = nil
	EmbedSystem_RightWindow.FrameName = nil
	if AS:CheckOption('EmbedSystem') then
		MainEmbed = AS:CheckOption('EmbedMain')
		if MainEmbed ~= 'Skada' and MainEmbed ~= 'Omen' and MainEmbed ~= 'Recount' and MainEmbed ~= 'TinyDPS' and MainEmbed ~= 'alDamageMeter' then
			EmbedSystem_MainWindow.FrameName = MainEmbed
		end
	end
	if AS:CheckOption('EmbedSystemDual') then
		LeftEmbed, RightEmbed = AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight')
		if LeftEmbed ~= 'Skada' and LeftEmbed ~= 'Omen' and LeftEmbed ~= 'Recount' and LeftEmbed ~= 'TinyDPS' and LeftEmbed ~= 'alDamageMeter' then
			EmbedSystem_LeftWindow.FrameName = LeftEmbed
		end
		if RightEmbed ~= 'Skada' and RightEmbed ~= 'Omen' and RightEmbed ~= 'Recount' and RightEmbed ~= 'TinyDPS' and RightEmbed ~= 'alDamageMeter' then
			EmbedSystem_RightWindow.FrameName = RightEmbed
		end
	end
	AS:DisableOption('EmbedalDamageMeter')
	AS:DisableOption('EmbedOmen')
	AS:DisableOption('EmbedRecount')
	AS:DisableOption('EmbedTinyDPS')
	AS:DisableOption('EmbedSkada')
	local Frame = nil
	if EmbedSystem_MainWindow.FrameName ~= nil then
		Frame = _G[EmbedSystem_MainWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_MainWindow)
			Frame:SetInside(EmbedSystem_MainWindow, 0, 0)
		end
	end
	if EmbedSystem_LeftWindow.FrameName ~= nil then
		Frame = _G[EmbedSystem_LeftWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_LeftWindow)
			Frame:SetInside(EmbedSystem_LeftWindow, 0, 0)
		end
	end
	if EmbedSystem_RightWindow.FrameName ~= nil then
		Frame = _G[EmbedSystem_RightWindow.FrameName]
		if Frame and Frame:IsObjectType('Frame') and not Frame:IsProtected() then
			Frame:ClearAllPoints()
			Frame:SetParent(EmbedSystem_RightWindow)
			Frame:SetInside(EmbedSystem_RightWindow, 0, 0)
		end
	end
	if MainEmbed == 'Skada' or LeftEmbed == 'Skada' or RightEmbed == 'Skada' then
		AS:EnableOption('EmbedSkada')
	end
	if MainEmbed == 'Omen' or LeftEmbed == 'Omen' or RightEmbed == 'Omen' then
		AS:EnableOption('EmbedOmen')
	end
	if MainEmbed == 'Recount' or LeftEmbed == 'Recount' or RightEmbed == 'Recount' then
		AS:EnableOption('EmbedRecount')
	end
	if MainEmbed == 'TinyDPS' or LeftEmbed  == 'TinyDPS' or RightEmbed == 'TinyDPS' then
		AS:EnableOption('EmbedTinyDPS')
	end
	if MainEmbed == 'alDamageMeter' or LeftEmbed  == 'alDamageMeter' or RightEmbed == 'alDamageMeter' then
		AS:EnableOption('EmbedalDamageMeter')
	end
	if Message then
		local Message = format("Main: '%s'", AS:CheckOption('EmbedMain'))
		if AS:CheckOption('EmbedSystemDual') then Message = format("Left: '%s' | Right: '%s'", AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight')) end
		AS:Print(format("Embed System: %s", Message))
	end
end

function AS:Embed_Recount()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Recount' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = "Recount_MainWindow"

	Recount_MainWindow:SetParent(EmbedParent)
	Recount_MainWindow:ClearAllPoints()
	Recount_MainWindow:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 6)
	Recount_MainWindow:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
	if Recount.MainWindow.backdrop then Recount.MainWindow.backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default') end
	if not AS:CheckOption('RecountBackdrop') then Recount.MainWindow.backdrop:Hide() end

	Recount.db.profile.Locked = true
	Recount.db.profile.Scaling = 1
	Recount.db.profile.ClampToScreen = true
	Recount.db.profile.FrameStrata = '2-LOW'
	Recount:SetStrataAndClamp()
	Recount:LockWindows(true)
	Recount:ResizeMainWindow()
end

function AS:Embed_Omen()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Omen' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = "OmenAnchor"

	AS:SkinTitleBar(OmenTitle, 'Default')
	AS:SkinFrame(OmenBarList, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	if not AS:CheckOption('OmenBackdrop') then OmenBarList:StripTextures() end

	local db = Omen.db
	db.profile.Scale = 1
	db.profile.Bar.Spacing = 1
	db.profile.Background.EdgeSize = 2
	db.profile.Background.BarInset = 2
	db.profile.TitleBar.UseSameBG = true
	db.profile.ShowWith.UseShowWith = false
	db.profile.Locked = true
	db.profile.TitleBar.ShowTitleBar = true
	db.profile.FrameStrata = '2-LOW'
	Omen:OnProfileChanged(nil, db)

	OmenAnchor:SetParent(EmbedParent)
	OmenAnchor:ClearAllPoints()
	OmenAnchor:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	OmenAnchor:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
	local Backdrop = OmenAnchor.backdrop or OmenAnchor.Backdrop
	if not Backdrop then
		OmenAnchor:CreateBackdrop()
		Backdrop = OmenAnchor.backdrop or OmenAnchor.Backdrop
		Backdrop:SetOutside(OmenAnchor, 0, 0)
	end
end

function AS:Embed_TinyDPS()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'TinyDPS' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = "tdpsFrame"

	AS:SkinFrame(tdpsFrame, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	tdpsFrame:SetParent(EmbedParent)
	tdpsFrame:SetFrameStrata('LOW')
	tdpsAnchor:ClearAllPoints()
	tdpsAnchor:Point('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	tdpsAnchor:Point('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)

	tdps.hideOOC = false
	tdps.hideIC = false
	tdps.hideSolo = false
	tdps.hidePvP = false
	tdpsRefresh()
end

function AS:Embed_alDamageMeter()
	local EmbedParent = EmbedSystem_MainWindow
	if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'alDamageMeter' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
	EmbedParent.FrameName = "alDamageMeterFrame"

	dmconf.barheight = floor((EmbedParent:GetHeight() / dmconf.maxbars) - dmconf.spacing)
	dmconf.width = EmbedParent:GetWidth()
	local Backdrop = alDamageMeterFrame.backdrop or alDamageMeterFrame.Backdrop
	Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	alDamageMeterFrame.bg:Kill()
	alDamageMeterFrame:ClearAllPoints()
	alDamageMeterFrame:SetInside(EmbedParent, 2, 2)
	alDamageMeterFrame:SetParent(EmbedParent)
	alDamageMeterFrame:SetFrameStrata('LOW')
end

function AS:Embed_Skada()
	wipe(SkadaWindows)
	for k, window in pairs(Skada:GetWindows()) do
		tinsert(SkadaWindows, window)
	end

	local NumberToEmbed = 0
	if AS:CheckOption('EmbedSystem') then
		NumberToEmbed = 1
	end
	if AS:CheckOption('EmbedSystemDual') then
		if AS:CheckOption('EmbedRight') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
		if AS:CheckOption('EmbedLeft') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
	end

	local function EmbedWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
		if not window then return end
		local barmod = Skada.displays['bar']
		local offsety = (window.db.enabletitle and window.db.title.height or 0) + 2
		window.db.barwidth = width - 4
		window.db.background.height = height - (window.db.enabletitle and window.db.title.height or 0) - 4
		window.db.spark = false
		window.db.barslocked = true
		window.bargroup:ClearAllPoints()
		window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, -offsety)
		window.bargroup:SetParent(relativeFrame)
		window.bargroup:SetFrameStrata('LOW')
		window.bargroup:SetBackdrop(nil)
		local Backdrop = window.bargroup.backdrop or window.bargroup.Backdrop
		if Backdrop then
			Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and "Transparent" or 'Default')
			if not AS:CheckOption('SkadaBackdrop') then Backdrop:Hide() else Backdrop:Show() end
		end
		barmod.ApplySettings(barmod, window)
	end
	
	if NumberToEmbed == 1 then
		local EmbedParent = EmbedSystem_MainWindow
		if AS:CheckOption('EmbedSystemDual') then EmbedParent = AS:CheckOption('EmbedRight') == 'Skada' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow end
		EmbedWindow(SkadaWindows[1], EmbedParent:GetWidth(), EmbedParent:GetHeight(), 'TOPLEFT', EmbedParent, 'TOPLEFT', 2, 0)
	elseif NumberToEmbed == 2 then
		EmbedWindow(SkadaWindows[1], EmbedSystem_LeftWindow:GetWidth(), EmbedSystem_LeftWindow:GetHeight(), 'TOPLEFT', EmbedSystem_LeftWindow, 'TOPLEFT', 2, 0)
		EmbedWindow(SkadaWindows[2], EmbedSystem_RightWindow:GetWidth(), EmbedSystem_RightWindow:GetHeight(), 'TOPLEFT', EmbedSystem_RightWindow, 'TOPLEFT', 2, 0)
	end
end