if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
UISkinOptions = {}
local XS = {}
XS.skins = {}
XS.events = {}
XS.register = {}
U.x = XS
local Skins = U.Skins

XS.Init = function(self)
	if self.frame then return end

	local f = CreateFrame("Frame")
	f:RegisterEvent("PET_BATTLE_CLOSE")
	f:RegisterEvent("PET_BATTLE_OPENING_START")
	self.frame = f
	for skin,alldata in pairs(self.register) do
		for _,data in pairs(alldata) do
			if IsAddOnLoaded(Skins[skin].addon) then
				if UISkinOptions[skin] == nil then UISkinOptions[skin] = "Enabled" end
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

local XSFrame = CreateFrame("Frame")
XSFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
XSFrame:SetScript("OnEvent", function(self)
	XS:Init()
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)

local SkinOptionsLoader = CreateFrame("Frame")
SkinOptionsLoader:RegisterEvent("PLAYER_ENTERING_WORLD")
SkinOptionsLoader:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent(event)
	if UISkinOptions["RecountBackdrop"] == nil then UISkinOptions["RecountBackdrop"] = "Enabled" end
	if UISkinOptions["SkadaBackdrop"] == nil then UISkinOptions["SkadaBackdrop"] = "Enabled" end
	if UISkinOptions["CLCProtSkin"] == nil then UISkinOptions["CLCProtSkin"] = "Enabled" end
	if UISkinOptions["CLCRetSkin"] == nil then UISkinOptions["CLCRetSkin"] = "Enabled" end
	if UISkinOptions["DBMSkinHalf"] == nil then UISkinOptions["DBMSkinHalf"] = "Disabled" end
	if UISkinOptions["WeakAurasSkin"] == nil then UISkinOptions["WeakAurasSkin"] = "Enabled" end
	if UISkinOptions["EmbedOoC"] == nil then UISkinOptions["EmbedOoC"] = "Disabled" end
	if UISkinOptions["EmbedOmen"] == nil then UISkinOptions["EmbedOmen"] = "Disabled" end
	if UISkinOptions["EmbedTinyDPS"] == nil then UISkinOptions["EmbedTinyDPS"] = "Disabled" end
	if UISkinOptions["EmbedSkada"] == nil then UISkinOptions["EmbedSkada"] = "Disabled" end
	if UISkinOptions["EmbedRecount"] == nil then UISkinOptions["EmbedRecount"] = "Disabled" end
	if UISkinOptions["EmbedCoolLine"] == nil then UISkinOptions["EmbedCoolLine"] = "Disabled" end
	if UISkinOptions["EmbedLeft"] == nil then UISkinOptions["EmbedLeft"] = "Omen" end
	if UISkinOptions["EmbedRight"] == nil then UISkinOptions["EmbedRight"] = "Skada" end
	UISkinOptions["MiscFixes"] = "Enabled"
	print(U.Title.." by |cFFFF7D0AAzilroka|r - Version: |cff1784d1"..U.Version.."|r Loaded!")
	if IsAddOnLoaded("Enhanced_Config") then Ace3Options() else LegacyOptions() end
end)

local function Ace3Options()
	local function GenerateOptionTable(skinName,order)
		local data = Skins[skinName]
		local addon = data.addon
		local text = data.buttonText or addon
		local options = {
			type = 'toggle',
			name = text,
			desc = "Enable/Disable this skin.",
			order = order,
			disabled = function() if addon then return not IsAddOnLoaded(addon) else return false end end,
		}
		return options
	end

	local function pairsByKeys (t, f)
		local a = {}
		for n in pairs(t) do table.insert(a, n) end
		table.sort(a, f)
		local i = 0
		local iter = function()
			i = i + 1
			if a[i] == nil then return nil
				else return a[i], t[a[i]]
			end
		end
		return iter
	end
	Enhanced_Config.Options.args.skins = {
		order = 1000,
		type = 'group',
		name = 'Skins',
		get = function(info) return UISkinsOptions[ info[#info] ] end,
		set = function(info, value) UISkinsOptions[ info[#info] ] = value == true and "Enabled" or "Disabled" end,
		guiInline = true,
		args = {
			desc = {
				type = 'description',
				name = U.Title..' by Azilroka - Version '..U.Version,
				order = 1
			},
			misc = {
				type = 'group',
				name = 'Misc Options',
				order = 500,
				args = {
					DBMSkinHalf = {
						type = 'toggle',
						name = 'DBM Half-bar Skin',
						desc = "Enable/Disable this skin.",
						order = 1,
						disabled = function() return not IsAddOnLoaded("DBM-Core") or UISkinOptions['DBMSkin'] == "Disabled" end
					},
					RecountBackdrop = {
						type = 'toggle',
						name = 'Recount Backdrop',
						desc = "Enable/Disable this skin.",
						order = 2,
						disabled = function() return not IsAddOnLoaded("Recount") or UISkinOptions["RecountSkin"] == "Disabled" end,
					},
					SkadaBackdrop = {
						type = 'toggle',
						name = 'Skada Backdrop',
						desc = "Enable/Disable this skin.",
						order = 3,
						disabled = function() return not IsAddOnLoaded("Skada") or UISkinOptions["SkadaSkin"] == "Disabled" end,
					},
				}
			},
			embed = {
				order = 1000,
				type = 'group',
				name = 'Embed Settings',
				get = function(info) return UISkinOptions[ info[#info] ] end,
				set = function(info,value) UISkinsOptions[ info[#info] ] = value == true and "Enabled" or "Disabled" end,
				args = {
					desc = {
						type = 'description',
						name = 'Settings to control addons embedded in right chat panel',
						order = 1
					},
					EmbedRight = {
						type = 'toggle',
						name = 'Embed to Right Chat Panel',
						desc = 'Embed to right chat panel, otherwise left chat panel',
						order = 2
					},
					EmbedRecount = {
						type = 'toggle',
						name = 'Recount',
						desc = "Enable/Disable this skin.",
						order = 3,
						disabled = function() return not IsAddOnLoaded("Recount") end,
					},
					EmbedSkada = {
						type = 'toggle',
						name = 'Skada',
						desc = "Enable/Disable this skin.",
						order = 4,
						disabled = function() return not IsAddOnLoaded("Skada") end,
					},
					EmbedOmen = {
						type = 'toggle',
						name = 'Omen',
						desc = "Enable/Disable this skin.",
						order = 6,
						disabled = function() return not IsAddOnLoaded("Omen") end,
					},
					EmbedRO = {
						type = 'toggle',
						name = 'Recount & Omen',
						desc = "Enable/Disable this skin.",
						order = 8,
						disabled = function() return not IsAddOnLoaded("Omen") or not IsAddOnLoaded("Recount") end,
					},
					EmbedTDPS = {
						type = 'toggle',
						name = 'TinyDPS',
						desc = "Enable/Disable this skin.",
						order = 9,
						disabled = function() return not IsAddOnLoaded("TinyDPS") end,
					},
					EmbedOoC = {
						type = 'toggle',
						name = 'Hide while out of combat',
						desc = "Enable/Disable this skin.",
						order = 10,
					},
					EmbedSexyCooldown = {
						type = 'toggle',
						name = 'Attach SexyCD to action bar',
						desc = "Enable/Disable this skin.",
						order = 11,
						disabled = function() return not IsAddOnLoaded("SexyCooldown2") end,
					},
					EmbedCoolLine = {
						type = 'toggle',
						name = 'Attach CoolLine to action bar',
						desc = "Enable/Disable this skin.",
						order = 12,
						disabled = function() return not IsAddOnLoaded("CoolLine") end,
					},
					EmbedRight = {
						type = 'toggle',
						name = 'Embed Right',
						desc = "Enable/Disable this skin.",
						order = 13,
					},
				}
			}
		}
	}

	local order = 2
	for skinName,_ in pairsByKeys(Skins) do
		if UISkinOptions[skinName] == nil then UISkinOptions[skinName] = "Enabled" end
		Enhanced_Config.Options.args.skins.args[skinName] = GenerateOptionTable(skinName,order)
		order = order + 1
	end
end

local function LegacyOptions()
	local function CreateOptionsFrame(name, frametext, parent)
		local frame = CreateFrame("Frame", name, UIParent)
		frame:Hide()
		frame:SetTemplate("Transparent")
		frame:Point("CENTER", parent, "CENTER", 0, 0)
		frame:SetFrameStrata("DIALOG")
		frame:Width(550)
		frame:Height(210)
		frame:SetFrameStrata("DIALOG")
		frame:SetClampedToScreen(true)
		frame:SetMovable(true)
		frame:FontString("text", U.Font, 14, "OUTLINE")
		frame.text:SetPoint("TOP", frame, 0, -6)
		frame.text:SetText(frametext..U.Version)
		frame:EnableMouse(true)
		frame:RegisterForDrag("LeftButton")
	end

	CreateOptionsFrame("SkinOptions", "|cffC495DDTukui|r Skin Options - Version ", UIParent)
	SkinOptions:SetScript("OnDragStart", function(self) self:StartMoving() end)
	SkinOptions:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)	

	CreateOptionsFrame("SkinOptions2", "|cffC495DDTukui|r Module Options - Version ", SkinOptions)
	CreateOptionsFrame("SkinOptions3", "|cffC495DDTukui|r Embed Options - Version ", SkinOptions)
	SkinOptions3:FontString("text2", U.Font, 14, "OUTLINE")
	SkinOptions3.text2:SetPoint("TOPRIGHT", SkinOptions3, "TOPRIGHT", -30, -38)
	SkinOptions3.text2:SetText("|cff00AAFFAvailable Embeds|r:\n\nalDamageMeter\nOmen\nRecount\nSkada\nTinyDPS")

	local function CreateOptionsButton(name, btntext, parent)
		local frame = CreateFrame("Button", name.."Button", SkinOptions)
		frame:Size(100,24)
		U.SkinButton(frame)
		frame:FontString("text", U.Font, 12, "OUTLINE")
		frame.text:SetPoint("CENTER", frame, 0, 0)
		frame.text:SetText(btntext)
		frame:SetScript("OnClick", function()
			SkinOptions1Button:SetParent(parent)
			SkinOptions2Button:SetParent(parent)
			EmbedWindowSettingsButton:SetParent(parent)
			ApplySkinSettingsButton:SetParent(parent)
			SkinOptionsCloseButton:SetParent(parent)
		end)
	end

	CreateOptionsButton("SkinOptions1", "Skins", SkinOptions)
	SkinOptions1Button:SetPoint("TOP", SkinOptions, "BOTTOM", 0, -2)
	SkinOptions1Button:HookScript("OnClick", function() SkinOptions:Show() SkinOptions2:Hide() SkinOptions3:Hide() end)

	CreateOptionsButton("SkinOptions2", "Modules", SkinOptions2)
	SkinOptions2Button:SetPoint("RIGHT", SkinOptions1Button, "RIGHT", 102, 0)
	SkinOptions2Button:HookScript("OnClick", function() SkinOptions2:Show() SkinOptions:Hide() SkinOptions3:Hide() end)

	CreateOptionsButton("EmbedWindowSettings", "Embeds", SkinOptions3)
	EmbedWindowSettingsButton:SetPoint("RIGHT", SkinOptions1Button, "LEFT", -2, 0)
	EmbedWindowSettingsButton:HookScript("OnClick", function() SkinOptions3:Show() SkinOptions:Hide() SkinOptions2:Hide() end)

	CreateOptionsButton("SkinOptionsClose", "Close", SkinOptions)
	SkinOptionsCloseButton:SetPoint("RIGHT", SkinOptions2Button, "RIGHT", 102, 0)
	SkinOptionsCloseButton:HookScript("OnClick", function() SkinOptions3:Hide() SkinOptions:Hide() SkinOptions2:Hide() end)

	local ApplySkinSettingsButton = CreateFrame("Button", "ApplySkinSettingsButton", SkinOptions)
	ApplySkinSettingsButton:SetPoint("RIGHT", EmbedWindowSettingsButton, "LEFT", -2, 0)
	ApplySkinSettingsButton:Size(100,24)
	U.SkinButton(ApplySkinSettingsButton)
	ApplySkinSettingsButton:FontString("text", U.Font, 12, "OUTLINE")
	ApplySkinSettingsButton.text:SetPoint("CENTER", ApplySkinSettingsButton, 0, 0)
	ApplySkinSettingsButton.text:SetText("Apply Settings")
	ApplySkinSettingsButton:SetScript("OnClick", function() ReloadUI() end)

	local function ToggleEmbed()
		U.DisableOption("EmbedOmen")
		U.DisableOption("EmbedRecount")
		U.DisableOption("EmbedTinyDPS")
		U.DisableOption("EmbedSkada")
		U.EnableOption("Embed"..UISkinOptions["EmbedRight"])
		U.EnableOption("Embed"..UISkinOptions["EmbedLeft"])
		EmbedCheck()
	end

	local function CreateEmbedEditBox(name, boxtext)
		local frame = CreateFrame("EditBox", name.."EditBox", SkinOptions3)
		frame:FontString("text", U.Font, 12, "OUTLINE")
		frame.text:SetPoint("BOTTOM", frame, "TOP", 0, 2)
		frame.text:SetText(boxtext)
		frame:SetAutoFocus(false)
		frame:SetMultiLine(false)
		frame:SetWidth(140)
		frame:SetHeight(20)
		frame:SetMaxLetters(255)
		frame:SetTextInsets(3,0,0,0)
		frame:SetFontObject(GameFontHighlight)
		frame:SetTemplate()
		frame:SetText(UISkinOptions[name])
		frame:SetScript("OnEscapePressed", function(self) self:ClearFocus() self:SetText(UISkinOptions[name]) end)
		frame:SetScript("OnEnterPressed", function(self)
			self:ClearFocus()
			UISkinOptions[name] = self:GetText()
			ToggleEmbed()
		end)
	end

	CreateEmbedEditBox("EmbedRight", "Embed Right AddOn")
	EmbedRightEditBox:SetPoint("TOPLEFT", 12, -50)

	CreateEmbedEditBox("EmbedLeft", "Embed Left AddOn")
	EmbedLeftEditBox:SetPoint("TOPLEFT", 12, -100)

	local function CreateEmbedButton(name, btntext)
		local frame = CreateFrame("Button", name.."Button", SkinOptions3)
		frame:Size(16)
		U.SkinBackdropFrame(frame)
		frame:SetBackdrop({bgFile = U.NormTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0})
		frame:FontString("text", U.Font, 12, "OUTLINE")
		frame.text:SetPoint("LEFT", frame, "RIGHT", 10, 0)
		frame.text:SetText(btntext)
		frame:SetScript("OnShow", function(self)
			if (U.CheckOption(name)) then
				self:SetBackdropColor(0.11,0.66,0.11,1)
			else
				self:SetBackdropColor(0.68,0.14,0.14,1)
			end
		end)
		frame:SetScript("OnClick", function(self)
			if (U.CheckOption(name)) then
				U.DisableOption(name)
				self:SetBackdropColor(0.68,0.14,0.14,1)
			else
				U.EnableOption(name)
				self:SetBackdropColor(0.11,0.66,0.11,1)
			end
		end)
	end

	CreateEmbedButton("EmbedOoC", "OoC Hide")
	EmbedOoCButton:SetPoint("TOPLEFT", EmbedLeftEditBox, "BOTTOMLEFT", 0, -20)

	CreateEmbedButton("EmbedSexyCooldown", "Embed SexyCooldown")
	EmbedSexyCooldownButton:SetPoint("TOP", -68, -50)

	CreateEmbedButton("EmbedCoolLine", "Embed CoolLine")
	EmbedCoolLineButton:SetPoint("TOP", -68, -100)

	local SkinsGameMenuButton = CreateFrame("Button", "SkinsGameMenuButton", GameMenuFrame, "GameMenuButtonTemplate")
	SkinsGameMenuButton:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -1)
	SkinsGameMenuButton:Size(GameMenuButtonLogout:GetWidth(),GameMenuButtonLogout:GetHeight())
	U.SkinButton(SkinsGameMenuButton)
	SkinsGameMenuButton:FontString("text", U.Font, 12, "NONE")
	SkinsGameMenuButton.text:SetPoint("CENTER", SkinsGameMenuButton, 0, 0)
	SkinsGameMenuButton.text:SetText("Skins")
	SkinsGameMenuButton:SetScript("OnClick", function() SkinOptions:Show() HideUIPanel(GameMenuFrame) end)
	GameMenuButtonLogout:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -38)
	GameMenuFrame:Height(GameMenuFrame:GetHeight() + 26)
	if IsAddOnLoaded("stAddonmanager") then 
		GameMenuFrame:HookScript("OnShow",function()
			SkinsGameMenuButton:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -23)
			GameMenuButtonLogout:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -60)
		end)
	end

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
		button:SetBackdrop({bgFile = U.NormTex, edgeFile = nil, tile = false, tileSize = 0, edgeSize = 0})
		button:FontString("text", U.Font, 12, "OUTLINE")
		button.text:SetPoint("LEFT", button, "RIGHT", 10, 0)
		button.text:SetText(buttonText)
		button:SetScript("OnShow", function(self)
			if (UISkinOptions[option] == "Enabled") then
				self:SetBackdropColor(0.6,0,0.86,1)
			else
				self:SetBackdropColor(0.68,0.14,0.14,1)
			end
		end)
		button:SetScript("OnClick", function(self)
			if (UISkinOptions[option] == "Enabled") then
				UISkinOptions[option] = "Disabled"
				self:SetBackdropColor(0.68,0.14,0.14,1)
			else
				UISkinOptions[option] = "Enabled"
				self:SetBackdropColor(0.6,0,0.86,1)
			end
		end)
	end

	local function pairsByKeys (t, f)
		local a = {}
		for n in pairs(t) do table.insert(a, n) end
			table.sort(a, f)
			local i = 0
			local iter = function()
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
				CreateButton(string.format('%sButton',skin),buttonText,addon,skin,curX,curY)
				SkinOptions:Height(70+(curY*22))
				SkinOptions2:Height(70+(curY*22))
				SkinOptions3:Height(70+(curY*22))
				if SkinOptions:GetHeight() < 210 then
					SkinOptions:Height(210)
					SkinOptions2:Height(210)
					SkinOptions3:Height(210)
				end
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
		},
		["CLCProtSkin"] = {
			["buttonText"] = "CLCProt Icons",
		},
		["CLCRetSkin"] = {
			["buttonText"] = "CLCRet Icons",
		},
		["WeakAurasSkin"] = {
			["buttonText"] = "WeakAuras Icons",
		},
	}

	curY = 1
	for skin,options in pairsByKeys(Skins2) do
		local addon = nil
		local buttonText = options.buttonText
		CreateButton(string.format('%sButton',skin),buttonText,addon,skin,1,curY,true)
		curY = curY + 1
	end

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
end