if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2, ...))
local L = AS.Locale

local format, gsub, pairs, ipairs, select, tinsert, tonumber = format, gsub, pairs, ipairs, select, tinsert, tonumber

local EmbedOoCCombatStart, EmbedOoCCombatEnd, ChatFrame4Hide
local SkadaWindows = {}
local Ace3Options = IsAddOnLoaded('Enhanced_Config') and true or false

local EmbedSystem_MainWindow = CreateFrame('Frame', 'EmbedSystem_MainWindow', UIParent)
local EmbedSystem_LeftWindow = CreateFrame('Frame', 'EmbedSystem_LeftWindow', EmbedSystem_MainWindow)
local EmbedSystem_RightWindow = CreateFrame('Frame', 'EmbedSystem_RightWindow', EmbedSystem_MainWindow)
local EmbedSystem_WidthSlider = CreateFrame("Slider", "EmbedSystem_WidthSlider", EmbedSystem_MainWindow, "OptionsSliderTemplate")

EmbedSystem_MainWindow:RegisterEvent('PLAYER_ENTERING_WORLD')
EmbedSystem_MainWindow:RegisterEvent('PLAYER_REGEN_DISABLED')
EmbedSystem_MainWindow:RegisterEvent('PLAYER_REGEN_ENABLED')
EmbedSystem_MainWindow:SetScript('OnEvent', function(self, event)
	if event == 'PLAYER_ENTERING_WORLD' then
		ChatFrame4Hide = ChatFrame4Tab:IsShown()
		AS:EmbedSystem_WindowResize()
		AS:EmbedCheck(true)
	end
	if event == 'PLAYER_REGEN_DISABLED' then
		EmbedOoCCombatStart = true
		if AS:CheckOption('EmbedOoC') then
			if ChatFrame4Hide then ChatFrame4Tab:Hide() end
			AS:EmbedShow()
		end
	else
		EmbedOoCCombatStart = false
		if AS:CheckOption('EmbedOoC') then
			if ChatFrame4Hide then ChatFrame4Tab:Show() end
			if EmbedOoCCombatEnd then return end
			EmbedOoCCombatEnd = true
			AS:Delay(10, function()
				if not EmbedOoCCombatStart then
					AS:EmbedHide()
				end
				EmbedOoCCombatEnd = false
			end)
		end
	end
end)

function AS:EmbedShow()
	EmbedSystem_MainWindow:Show()
	EmbedSystem_LeftWindow:Show()
	EmbedSystem_RightWindow:Show()
	if EmbedSystem_MainWindow.FrameName ~= nil then
		EmbedSystem_MainWindow.FrameName:Show()
	end
	if EmbedSystem_LeftWindow.FrameName ~= nil then
		EmbedSystem_LeftWindow.FrameName:Show()
	end
	if EmbedSystem_RightWindow.FrameName ~= nil then
		EmbedSystem_RightWindow.FrameName:Show()
	end
end

function AS:EmbedHide()
	EmbedSystem_MainWindow:Hide()
	EmbedSystem_LeftWindow:Hide()
	EmbedSystem_RightWindow:Hide()
	if EmbedSystem_MainWindow.FrameName ~= nil then
		EmbedSystem_MainWindow.FrameName:Hide()
	end
	if EmbedSystem_LeftWindow.FrameName ~= nil then
		EmbedSystem_LeftWindow.FrameName:Hide()
	end
	if EmbedSystem_RightWindow.FrameName ~= nil then
		EmbedSystem_RightWindow.FrameName:Hide()
	end
end

EmbedSystem_MainWindow:SetScript('OnShow', AS.EmbedShow)
EmbedSystem_MainWindow:SetScript('OnHide', AS.EmbedHide)

function AS:EmbedSystem_WindowResize()
	if not AS.ChatBackgroundRight then
		EmbedSystem_MainWindow:SetPoint('BOTTOM', AS.InfoRight, 'TOP', 0, 2)
		EmbedSystem_MainWindow:SetSize(AS.InfoRight:GetWidth(), 142)
	else
		if DuffedUI then
			EmbedSystem_MainWindow:SetInside(AS.ChatBackgroundRight, 5, 5)
		else
			EmbedSystem_MainWindow:SetPoint('TOP', AS.ChatBackgroundRight, 'TOP', 0, -5)
			EmbedSystem_MainWindow:SetSize(AS.InfoRight:GetWidth(), AS.ChatBackgroundRight:GetHeight() - 34)
		end
	end
	EmbedSystem_LeftWindow:SetPoint('RIGHT', EmbedSystem_RightWindow, 'LEFT', -2, 0)
	EmbedSystem_RightWindow:SetPoint('RIGHT', EmbedSystem_MainWindow, 'RIGHT', 0, 0)
	EmbedSystem_LeftWindow:SetSize(AS:CheckOption('EmbedLeftWidth'), EmbedSystem_MainWindow:GetHeight())
	EmbedSystem_RightWindow:SetSize((EmbedSystem_MainWindow:GetWidth() - AS:CheckOption('EmbedLeftWidth')) - 1, EmbedSystem_MainWindow:GetHeight())
	AS:EmbedSystem_ResizeSlider()
end

EmbedSystem_WidthSlider:Hide()
EmbedSystem_WidthSlider:SetSize(AS.InfoRight:GetWidth(), AS.InfoRight:GetHeight())
EmbedSystem_WidthSlider:SetPoint(AS.InfoRight:GetPoint())
EmbedSystem_WidthSlider:SetValueStep(1)
EmbedSystem_WidthSliderLow:SetText('')
EmbedSystem_WidthSliderHigh:SetText('')
EmbedSystem_WidthSliderText:SetText('')
if not EmbedSystem_WidthSlider.isSkinned then
	AS:SkinSlideBar(EmbedSystem_WidthSlider, AS.InfoRight:GetHeight(), true)
end

function AS:EmbedSystem_ResizeSlider()
	local min, max = floor(EmbedSystem_MainWindow:GetWidth() * .25), floor(EmbedSystem_MainWindow:GetWidth() * .75)
	EmbedSystem_WidthSlider:SetMinMaxValues(min, max)
	EmbedSystem_WidthSlider:SetValue(AS:CheckOption('EmbedLeftWidth'))
	EmbedSystem_WidthSlider:SetScript('OnValueChanged', function(self, value)
		AS:SetOption('EmbedLeftWidth', value)
		AS:EmbedSystem_WindowResize()
		AS:EmbedCheck()
	end)
end

function AS:EmbedCheck(Login)
	if not AS:CheckOption('EmbedSystem') then return end
	if AS:CheckOption('EmbedOmen', 'Omen') then AS:EmbedOmen() end
	if AS:CheckOption('EmbedSkada', 'Skada') then
		AS:EmbedSkada()
		if Login then
			hooksecurefunc(Skada, 'CreateWindow', AS.EmbedSkada)
			hooksecurefunc(Skada, 'DeleteWindow', AS.EmbedSkada)
			hooksecurefunc(Skada, 'UpdateDisplay', AS.EmbedSkada)
		end
	end
	if AS:CheckOption('EmbedTinyDPS', 'TinyDPS') then AS:EmbedTDPS() end
	if AS:CheckOption('EmbedRecount', 'Recount') then AS:EmbedRecount() end
	if AS:CheckOption('EmbedalDamageMeter', 'alDamageMeter') then AS:EmbedALDamageMeter() end
	AS:EmbedShow()
	--if AS:CheckOption('EmbedOoC') and not InCombatLockdown() then AS:EmbedHide() end
end

function AS:EmbedRecount()
	local EmbedParent = AS:CheckOption('EmbedRight') == 'Recount' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow
	EmbedParent.FrameName = Recount_MainWindow
	Recount.db.profile.Locked = true
	Recount.db.profile.Scaling = 1
	Recount.db.profile.ClampToScreen = true
	Recount:LockWindows(true)

	Recount_MainWindow:SetParent(EmbedParent)
	Recount_MainWindow:SetFrameStrata('LOW')

	Recount_MainWindow:ClearAllPoints()
	Recount_MainWindow:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 7)
	Recount_MainWindow:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
end

function AS:EmbedOmen()
	local EmbedParent = AS:CheckOption('EmbedRight') == 'Omen' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow
	EmbedParent.FrameName = OmenAnchor
	Omen.db.profile.ShowWith.UseShowWith = false
	Omen.db.profile.Locked = true
	Omen.db.profile.TitleBar.ShowTitleBar = true
	Omen.db.profile.FrameStrata = '2-LOW'
	Omen:UpdateGrips()

	AS:SkinFrame(OmenTitle, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	AS:SkinFrame(OmenBarList, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')

	if not OmenAnchor.Backdrop then
		OmenAnchor:CreateBackdrop()
		OmenAnchor.Backdrop:SetOutside(OmenAnchor, 0, 0)
	end

	OmenAnchor:SetParent(EmbedParent)
	OmenAnchor:SetFrameStrata(strsub(Omen.db.profile.FrameStrata, 3))

	OmenAnchor:ClearAllPoints()
	OmenAnchor:SetPoint('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	OmenAnchor:SetPoint('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)
end

function AS:EmbedTDPS()
	local EmbedParent = AS:CheckOption('EmbedRight') == 'TinyDPS' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow
	EmbedParent.FrameName = tdpsFrame
	AS:SkinFrame(tdpsFrame, AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')

	tdpsFrame:SetParent(EmbedParent)
	tdpsFrame:SetFrameStrata('LOW')
	tdpsFrame:Point('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	tdpsFrame:Point('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)

	tdpsAnchor:ClearAllPoints()
	tdpsAnchor:Point('TOPLEFT', EmbedParent, 'TOPLEFT', 0, 0)
	tdpsAnchor:Point('BOTTOMRIGHT', EmbedParent, 'BOTTOMRIGHT', 0, 0)

	tdpsFrame:SetWidth(EmbedParent:GetWidth())

	tdps["hideOOC"] = false
	tdps["hideIC"] = false
	tdps['hideSolo'] = false
	tdps["hidePvP"] = false

	tdpsRefresh()
end

function AS:EmbedALDamageMeter()
	local EmbedParent = AS:CheckOption('EmbedRight') == 'alDamageMeter' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow
	EmbedParent.FrameName = alDamageMeterFrame
	dmconf.maxbars = AS:Round(EmbedParent:GetHeight() / (dmconf.barheight + dmconf.spacing))
	dmconf.width = EmbedParent:GetWidth()

	alDamageMeterFrame.Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
	alDamageMeterFrame.bg:Kill()
	alDamageMeterFrame:ClearAllPoints()
	alDamageMeterFrame:SetInside(EmbedParent, 2, 2)
	alDamageMeterFrame:SetParent(EmbedParent)
	alDamageMeterFrame:SetFrameStrata('LOW')
end

function AS:EmbedSkada()
	wipe(SkadaWindows)
	for k, window in pairs(Skada:GetWindows()) do
		tinsert(SkadaWindows, window)
	end
	local NumberToEmbed = 0
	if AS:CheckOption('EmbedRight') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
	if AS:CheckOption('EmbedLeft') == 'Skada' then NumberToEmbed = NumberToEmbed + 1 end
	if NumberToEmbed > #SkadaWindows then NumberToEmbed = #SkadaWindows end

	local function EmbedWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
		local barmod = Skada.displays['bar']
		local offsety = (window.db.enabletitle and window.db.title.height or 0) + 2
		window.db.barwidth = width - 4
		window.db.background.height = height - (window.db.enabletitle and window.db.title.height or 0) - 4
		window.db.spark = false
		window.db.barslocked = true
		window.bargroup:ClearAllPoints()
		window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, -offsety)
		window.bargroup:SetParent(relativeFrame)
		if window.bargroup.Backdrop then
			window.bargroup.Backdrop:SetTemplate(AS:CheckOption('TransparentEmbed') and 'Transparent' or 'Default')
		end
		barmod.ApplySettings(barmod, window)
	end
	if NumberToEmbed == 1 then
		local EmbedParent = AS:CheckOption('EmbedRight') == 'Skada' and EmbedSystem_RightWindow or EmbedSystem_LeftWindow
		EmbedWindow(SkadaWindows[1], EmbedParent:GetWidth(), EmbedParent:GetHeight(), 'TOPLEFT', EmbedParent, 'TOPLEFT', 2, 0)
		EmbedParent.FrameName = SkadaWindows[1]
	elseif NumberToEmbed == 2 then
		EmbedWindow(SkadaWindows[1], EmbedSystem_LeftWindow:GetWidth(), EmbedSystem_LeftWindow:GetHeight(), 'TOPLEFT', EmbedSystem_LeftWindow, 'TOPLEFT', 2, 0)
		EmbedSystem_LeftWindow.FrameName = SkadaWindows[1]
		EmbedWindow(SkadaWindows[2], EmbedSystem_RightWindow:GetWidth(), EmbedSystem_RightWindow:GetHeight(), 'TOPLEFT', EmbedSystem_RightWindow, 'TOPLEFT', 2, 0)
		EmbedSystem_RightWindow.FrameName = SkadaWindows[2]
	end
end

local function CreateToggleButton(Name, Text, Panel1, Panel2, TooltipText1, TooltipText2)
	local Frame = CreateFrame('Button', Name, UIParent)
	Frame:SetTemplate('Transparent')
	Frame:Size(Panel1:GetHeight())
	--Frame:FontString('Text', AS.ActionBarFont, 12)
	Frame:FontString('Text', AS.PixelFont, 12)
	Frame.Text:SetText(Text)
	Frame.Text:SetPoint('CENTER', 0, 0)
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

CreateToggleButton('RightToggleButton', '>', AS.InfoRight, AS.ChatBackgroundRight, L.Skins.ToggleRightChat, L.Skins.ToggleEmbed)
--CreateToggleButton('RightToggleButton', '►', AS.InfoRight, AS.ChatBackgroundRight, L.Skins.ToggleRightChat, L.Skins.ToggleEmbed)
RightToggleButton:Point('LEFT', AS.InfoRight, 'RIGHT', 2, 0)
RightToggleButton:HookScript('OnClick', function(self, button)
	if button == 'RightButton' then
		if IsAltKeyDown() then
			if EmbedSystem_WidthSlider:IsShown() then
				EmbedSystem_WidthSlider:Hide()
			else
				EmbedSystem_WidthSlider:Show()
			end
		else
			if EmbedSystem_MainWindow:IsShown() then
				EmbedSystem_MainWindow:Hide()
				if ChatFrame4Hide then ChatFrame4Tab:Show() end
			else
				EmbedSystem_MainWindow:Show()
				if ChatFrame4Hide then ChatFrame4Tab:Hide() end
			end
		end
	end
end)

CreateToggleButton('LeftToggleButton', '<', AS.InfoLeft, AS.ChatBackgroundLeft, L.Skins.ToggleLeftChat, L.Skins.ToggleOptions)
--CreateToggleButton('LeftToggleButton', '◄', AS.InfoLeft, AS.ChatBackgroundLeft, L.Skins.ToggleLeftChat, L.Skins.ToggleOptions)
LeftToggleButton:Point('RIGHT', AS.InfoLeft, 'LEFT', -2, 0)
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