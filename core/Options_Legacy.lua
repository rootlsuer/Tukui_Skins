if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))
local format, gsub, sort, tinsert, pairs = format, gsub, sort, tinsert, pairs

function AS:LegacyOptions()
	local function CreateOptionsFrame(Name, Parent)
		local Frame = CreateFrame('Frame', Name, Parent)
		Frame:Hide()
		Frame:Point('CENTER', Parent, 'CENTER', 0, 0)
		Frame:SetFrameStrata('DIALOG')
		Frame:Width(556)
		Frame:Height(550)
	end

	CreateOptionsFrame('SkinOptions_Main', UIParent)
	CreateOptionsFrame('SkinOptions_Frame_1', SkinOptions_Main)
	CreateOptionsFrame('SkinOptions_Frame_2', SkinOptions_Main)
	CreateOptionsFrame('SkinOptions_Frame_3', SkinOptions_Main)
	CreateOptionsFrame('SkinOptions_Credits', SkinOptions_Main)

	SkinOptions_Main:FontString('Text', AS.Font, 14, 'OUTLINE')
	SkinOptions_Main.Text:SetPoint('TOP', SkinOptions_Main, 0, -6)
	SkinOptions_Main.Text:SetText(format('%s - Version %s', AS.Title, AS.Version))
	SkinOptions_Main:EnableMouse(true)
	SkinOptions_Main:RegisterForDrag('LeftButton')
	SkinOptions_Main:SetClampedToScreen(true)
	SkinOptions_Main:SetMovable(true)
	SkinOptions_Main:SetTemplate('Transparent')
	SkinOptions_Main:SetScript('OnDragStart', function(self) self:StartMoving() end)
	SkinOptions_Main:SetScript('OnDragStop', function(self) self:StopMovingOrSizing() end)
	SkinOptions_Main:SetScript('OnShow', function(self) SkinOptions_Frame_1:Show() SkinOptions_Frame_2:Hide() SkinOptions_Frame_3:Hide() SkinOptions_Credits:Hide() end)

	SkinOptions_Frame_3:FontString('Text', AS.Font, 14, 'OUTLINE')
	SkinOptions_Frame_3.Text:SetPoint('TOPRIGHT', SkinOptions_Frame_3, 'TOPRIGHT', -30, -38)
	SkinOptions_Frame_3.Text:SetText('|cff00AAFFAvailable Embeds|r:\n\nalDamageMeter\nOmen\nRecount\nSkada\nTinyDPS')

	SkinOptions_Credits:FontString('Text', AS.Font, 14, 'OUTLINE')
	SkinOptions_Credits.Text:SetPoint('TOPLEFT', SkinOptions_Credits, 'TOPLEFT', 12, -30)
	SkinOptions_Credits.Text:SetText(format('Credits:\n%s', AS.CreditsString))

	local function CreateOptionsButton(Name)
		local Frame = CreateFrame('Button', format('SkinOptions_Main_%sButton', Name), SkinOptions_Main)
		Frame:Size(88, 24)
		AS:SkinButton(Frame)
		Frame:FontString('Text', AS.Font, 12, 'OUTLINE')
		Frame.Text:SetPoint('CENTER', Frame, 0, 0)
		Frame.Text:SetText(Name)
	end

	CreateOptionsButton('ApplySettings')
	SkinOptions_Main_ApplySettingsButton:SetPoint('BOTTOMLEFT', SkinOptions_Main, 'BOTTOMLEFT', 4, 4)
	SkinOptions_Main_ApplySettingsButton.Text:SetText('Apply Settings')
	SkinOptions_Main_ApplySettingsButton:SetScript('OnClick', function() ReloadUI() end)

	CreateOptionsButton('Skins')
	SkinOptions_Main_SkinsButton:SetPoint('LEFT', SkinOptions_Main_ApplySettingsButton, 'RIGHT', 4, 0)
	SkinOptions_Main_SkinsButton:HookScript('OnClick', function() SkinOptions_Frame_1:Show() SkinOptions_Frame_2:Hide() SkinOptions_Frame_3:Hide() SkinOptions_Credits:Hide() end)

	CreateOptionsButton('Modules')
	SkinOptions_Main_ModulesButton:SetPoint('LEFT', SkinOptions_Main_SkinsButton, 'RIGHT', 4, 0)
	SkinOptions_Main_ModulesButton:HookScript('OnClick', function() SkinOptions_Frame_1:Hide() SkinOptions_Frame_2:Show() SkinOptions_Frame_3:Hide() SkinOptions_Credits:Hide() end)

	CreateOptionsButton('Embeds')
	SkinOptions_Main_EmbedsButton:SetPoint('LEFT', SkinOptions_Main_ModulesButton, 'RIGHT', 4, 0)
	SkinOptions_Main_EmbedsButton:HookScript('OnClick', function() SkinOptions_Frame_1:Hide() SkinOptions_Frame_2:Hide() SkinOptions_Frame_3:Show() SkinOptions_Credits:Hide() end)

	CreateOptionsButton('Credits')
	SkinOptions_Main_CreditsButton:SetPoint('LEFT', SkinOptions_Main_EmbedsButton, 'RIGHT', 4, 0)
	SkinOptions_Main_CreditsButton:HookScript('OnClick', function() SkinOptions_Frame_1:Hide() SkinOptions_Frame_2:Hide() SkinOptions_Frame_3:Hide() SkinOptions_Credits:Show() end)

	CreateOptionsButton('Close')
	SkinOptions_Main_CloseButton:SetPoint('LEFT', SkinOptions_Main_CreditsButton, 'RIGHT', 4, 0)
	SkinOptions_Main_CloseButton:HookScript('OnClick', function() SkinOptions_Main:Hide() end)

	local function ToggleEmbed(AddOn)
		local LeftEmbed, RightEmbed = AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight')
		AS:DisableOption('EmbedOmen')
		AS:DisableOption('EmbedRecount')
		AS:DisableOption('EmbedTinyDPS')
		AS:DisableOption('EmbedSkada')
		if LeftEmbed == 'Skada' or RightEmbed == 'Skada' then
			AS:EnableOption('EmbedSkada')
		end
		if LeftEmbed == 'Omen' or RightEmbed == 'Omen' then
			AS:EnableOption('EmbedOmen')
		end
		if LeftEmbed == 'Recount' or RightEmbed == 'Recount' then
			AS:EnableOption('EmbedRecount')
		end
		if LeftEmbed  == 'TinyDPS' or RightEmbed == 'TinyDPS' then
			AS:EnableOption('EmbedTinyDPS')
		end
		if LeftEmbed  == 'alDamageMeter' or RightEmbed == 'alDamageMeter' then
			AS:EnableOption('EmbedalDamageMeter')
		end
		print(format('%s Embed System - Left: %s | Right: %s', AS.Title, AS:CheckOption('EmbedLeft'), AS:CheckOption('EmbedRight')))
		AS:EmbedCheck()
	end

	local function CreateEmbedEditBox(Name, Text)
		local Frame = CreateFrame('EditBox', format('%sEditBox', Name), SkinOptions_Frame_3)
		Frame:FontString('Text', AS.Font, 12, 'OUTLINE')
		Frame.Text:SetPoint('BOTTOM', Frame, 'TOP', 0, 2)
		Frame.Text:SetText(Text)
		Frame:SetAutoFocus(false)
		Frame:SetMultiLine(false)
		Frame:SetWidth(140)
		Frame:SetHeight(20)
		Frame:SetMaxLetters(255)
		Frame:SetTextInsets(3,0,0,0)
		Frame:SetFontObject(GameFontHighlight)
		Frame:SetTemplate()
		Frame:SetText(AS:CheckOption(Name))
		Frame:SetScript('OnEscapePressed', function(self) self:ClearFocus() self:SetText(AS:CheckOption(Name)) end)
		Frame:SetScript('OnEnterPressed', function(self)
			self:ClearFocus()
			if self:GetText() == '' then
				AS:SetOption(Name, 'NONE')
			else
				AS:SetOption(Name, self:GetText())
			end
			ToggleEmbed(self:GetText())
		end)
	end

	CreateEmbedEditBox('EmbedRight', 'Embed Right AddOn')
	EmbedRightEditBox:SetPoint('TOPLEFT', 12, -50)

	CreateEmbedEditBox('EmbedLeft', 'Embed Left AddOn')
	EmbedLeftEditBox:SetPoint('TOPLEFT', 12, -100)

	local function CreateEmbedButton(Name, Text)
		local Button = CreateFrame('Button', format('%sButton', Name), SkinOptions_Frame_3)
		Button:Size(16)
		AS:SkinBackdropFrame(Button)
		Button:SetBackdrop({bgFile = AS.NormTex, tile = false, tileSize = 0})
		Button:FontString('Text', AS.Font, 12, 'OUTLINE')
		Button.Text:SetPoint('LEFT', Button, 'RIGHT', 10, 0)
		Button.Text:SetText(Text)
		Button:SetScript('OnShow', function(self)
			local r, g, b = .68, .14, .14
			if AS:CheckOption(Name) then
				r, g, b = .6, 0, .86
			end
			self:SetBackdropColor(r, g, b)
		end)
		Button:SetScript('OnClick', function(self)
			local r, g, b = .68, .14, .14
			AS:ToggleOption(Name)
			if AS:CheckOption(Name) then
				r, g, b = .6, 0, .86
			end
			self:SetBackdropColor(r, g, b)
		end)
	end

	CreateEmbedButton('EmbedOoC', 'OoC Hide')
	EmbedOoCButton:SetPoint('TOPLEFT', EmbedLeftEditBox, 'BOTTOMLEFT', 0, -20)

	CreateEmbedButton('EmbedSystem', 'Embed System')
	EmbedSystemButton:SetPoint('TOPLEFT', EmbedOoCButton, 'BOTTOMLEFT', 0, -10)

	CreateEmbedButton('TransparentEmbed', 'Embed Transparenacy')
	TransparentEmbedButton:SetPoint('TOPLEFT', EmbedSystemButton, 'BOTTOMLEFT', 0, -10)

	CreateEmbedButton('EmbedSexyCooldown', 'Embed SexyCooldown')
	EmbedSexyCooldownButton:SetPoint('TOP', -68, -50)

	CreateEmbedButton('EmbedCoolLine', 'Embed CoolLine')
	EmbedCoolLineButton:SetPoint('TOP', -68, -75)

	local SkinsGameMenuButton = CreateFrame('Button', 'SkinsGameMenuButton', GameMenuFrame, 'GameMenuButtonTemplate')
	SkinsGameMenuButton:Point('TOP', GameMenuButtonMacros, 'BOTTOM', 0 , -1)
	SkinsGameMenuButton:Size(GameMenuButtonLogout:GetWidth(), GameMenuButtonLogout:GetHeight())
	AS:SkinButton(SkinsGameMenuButton)
	SkinsGameMenuButton:FontString('Text', AS.Font, 12, 'NONE')
	SkinsGameMenuButton.Text:SetPoint('CENTER', SkinsGameMenuButton, 0, 0)
	SkinsGameMenuButton.Text:SetText('Skins')
	SkinsGameMenuButton:SetScript('OnClick', function() SkinOptions_Main:Show() HideUIPanel(GameMenuFrame) end)
	GameMenuButtonLogout:Point('TOP', GameMenuButtonMacros, 'BOTTOM', 0 , -38)
	GameMenuFrame:Height(GameMenuFrame:GetHeight() + 26)
	if IsAddOnLoaded('stAddonmanager') then 
		GameMenuFrame:HookScript('OnShow', function()
			SkinsGameMenuButton:Point('TOP', GameMenuButtonMacros, 'BOTTOM', 0 , -23)
			GameMenuButtonLogout:Point('TOP', GameMenuButtonMacros, 'BOTTOM', 0 , -60)
		end)
	end

	local function CreateButton(name, buttonText, addon, option, x, y, skinOptions2)
		local button = CreateFrame('Button', name, skinOptions2 and SkinOptions_Frame_2 or SkinOptions_Frame_1)
		local yOffset = -30 - (25*(y-1))
		local xTable = {
			[1] = { point = 'TOPLEFT', offset = 12 },
			[2] = { point = 'TOPLEFT', offset = 200 },
			[3] = { point = 'TOPLEFT', offset = 388 },
			[4] = { point = 'TOPLEFT', offset = 576 },
		}
		button:SetPoint(xTable[x].point, xTable[x].offset, yOffset)
		button:Size(16)
		AS:SkinBackdropFrame(button)
		button:SetBackdrop({bgFile = AS.NormTex, tile = false, tileSize = 0})
		button:FontString('text', AS.Font, 12, 'OUTLINE')
		button.text:SetPoint('LEFT', button, 'RIGHT', 10, 0)
		button.text:SetText(buttonText)
		button:SetScript('OnShow', function(self)
			local r, g, b = .68, .14, .14
			if AS:CheckOption(option) then
				r, g, b = .11, .66, .11
			end
			self:SetBackdropColor(r, g, b)
		end)
		button:SetScript('OnClick', function(self)
			local r, g, b = .68, .14, .14
			AS:ToggleOption(option)
			if AS:CheckOption(option) then
				r, g, b = .11, .66, .11
			end
			self:SetBackdropColor(r, g, b)
		end)
	end

	local curX, curY, maxY = 1, 1, 19
	for skin, options in AS:OrderedPairs(AS.skins) do
		local addon
		if options and options.addon then
			addon = options.addon
		else
			addon = gsub(skin, 'Skin', '')
		end
		local buttonText = options.buttonText or addon
		if addon ~= 'MiscFixes' then
			CreateButton(format('%sButton', skin), buttonText, addon, skin, curX, curY)
			curY = curY + 1
			if curY == maxY then
				curX = curX + 1
				curY = 1
			end
		end
	end

	local Skins2 = {
		['DBMSkinHalf'] = {
			['buttonText'] = 'DBM Half-Bar Skin',
			['addon'] = 'DBM-Core',
		},
		['CLCProtSkin'] = {
			['buttonText'] = 'CLCProt Icons',
			['addon'] = 'CLCProt',
		},
		['CLCRetSkin'] = {
			['buttonText'] = 'CLCRet Icons',
			['addon'] = 'CLCRet',
		},
		['WeakAurasSkin'] = {
			['buttonText'] = 'WeakAuras Icons',
			['addon'] = 'WeakAuras',
		},
	}

	curY = 1
	for skin, options in AS:OrderedPairs(Skins2) do
		local addon = options.addon
		local buttonText = options.buttonText
		CreateButton(format('%sButton', skin), buttonText, addon, skin, 1, curY, true)
		curY = curY + 1
	end

	SLASH_SKINOPTIONSWINDOW1 = '/skinoptions';
	function SlashCmdList.SKINOPTIONSWINDOW(msg, editbox)
		if SkinOptions_Main:IsVisible() then
			SkinOptions_Main:Hide()
		else
			SkinOptions_Main:Show()
		end
	end
end