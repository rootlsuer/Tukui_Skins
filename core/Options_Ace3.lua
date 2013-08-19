if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))
local L = AS.Locale
local tinsert, sort, pairs, format, gsub = tinsert, sort, pairs, format, gsub

function AS:Ace3Options()
	local Ace3OptionsPanel = IsAddOnLoaded('Enhanced_Config') and Enhanced_Config[1] or nil
	local function GenerateOptionTable(skinName, order)
		local data = AS.register[skinName]
		if data and data.hide then return end
		local addon
		if data and data.addon then
			addon = data.addon
		else
			addon = gsub(skinName, 'Skin', '')
		end
		local text = data and data.buttonText or addon
		local options = {
			type = 'toggle',
			name = text,
			desc = L.Skins.ToggleSkinDesc,
			order = order,
			disabled = function() if addon then return not IsAddOnLoaded(addon) else return false end end,
		}
		return options
	end

	Ace3OptionsPanel.Options.args.skins = {
		order = 100,
		type = 'group',
		name = AS.Title,
		args = {},
	}
	Ace3OptionsPanel.Options.args.skins.args.skins = {
		order = 1,
		type = 'group',
		name = format('%s |cFFFFFFFFby|r |cFFFF7D0AAzilroka|r |cFFFFFFFF- Version:|r |cff1784d1%s|r', AS.Title, AS.Version),
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:ToggleOption(info[#info]) end,
		guiInline = true,
		args = {
			misc = {
				type = 'group',
				name = L.Skins.MiscellaneousOptions,
				order = 500,
				args = {
					DBMFont = {
						type = "select", dialogControl = 'LSM30_Font',
						order = 1,
						name = "DBM Font",
						desc = "DBM Font",
						values = AceGUIWidgetLSMlists.font, 
						disabled = function() return not AS:CheckOption('DBMSkin', 'DBM-Core') end
					},
					DBMFontSize = {
						type = 'range',
						order = 2,
						name = "DBM Font Size",
						desc = "DBM Font Size",
						min = 8, max = 18, step = 1, 
						disabled = function() return not AS:CheckOption('DBMSkin', 'DBM-Core') end
					},
					DBMFontFlag = {
						name = 'DBM Font Flag',
						desc = 'Font Flag',
						order = 3,
						type = "select",
						values = {
							['NONE'] = 'None',
							['OUTLINE'] = 'OUTLINE',
							['THICKOUTLINE'] = 'THICKOUTLINE',
							['MONOCHROME'] = 'MONOCHROME',
							['MONOCHROMEOUTLINE'] = 'MONOCHROMEOUTLINE',
						},
						disabled = function() return not AS:CheckOption('DBMSkin', 'DBM-Core') end
					},
					DBMSkinHalf = {
						type = 'toggle',
						name = 'DBM Half-bar Skin',
						desc = L.Skins.ToggleSkinDesc,
						order = 1,
						disabled = function() return not AS:CheckOption('DBMSkin', 'DBM-Core') end
					},
					RecountBackdrop = {
						type = 'toggle',
						name = 'Recount Backdrop',
						desc = L.Skins.ToggleOptionDesc,
						order = 2,
						disabled = function() return not AS:CheckOption('RecountSkin', 'Recount') end,
					},
					SkadaBackdrop = {
						type = 'toggle',
						name = 'Skada Backdrop',
						desc = L.Skins.ToggleOptionDesc,
						order = 3,
						disabled = function() return not AS:CheckOption('SkadaSkin', 'Skada') end,
					},
				},
			},
		},
	}
	Ace3OptionsPanel.Options.args.skins.args.embed = {
		order = 2,
		type = 'group',
		name = 'Embed Settings',
		get = function(info) return AS:CheckOption(info[#info]) end,
		set = function(info, value) AS:ToggleOption(info[#info]) end,
		args = {
			desc = {
				type = 'description',
				name = 'Settings to control Embedded AddOns:\n\nAvailable Embeds: alDamageMeter | Omen | Skada | Recount | TinyDPS',
				order = 1
			},
			EmbedSystem = {
				type = 'toggle',
				name = 'Single Embed System',
				desc = L.Skins.ToggleOptionDesc,
				order = 2,
				disabled = function() return AS:CheckOption('EmbedSystemDual') end,
			},
			EmbedMain = {
				type = 'input',
				width = 'full',
				name = 'Embed for Main Panel',
				desc = '',
				disabled = function() return not AS:CheckOption('EmbedSystem') end,
				order = 3,
			},
			EmbedSystemDual = {
				type = 'toggle',
				name = 'Dual Embed System',
				desc = L.Skins.ToggleOptionDesc,
				order = 4,
				disabled = function() return AS:CheckOption('EmbedSystem') end,
			},
			EmbedLeft = {
				type = 'input',
				width = 'full',
				name = 'Embed for Left Panel',
				desc = '',
				disabled = function() return not AS:CheckOption('EmbedSystemDual') end,
				order = 5,
			},
			EmbedRight = {
				type = 'input',
				width = 'full',
				name = 'Embed to Right Panel',
				desc = '',
				disabled = function() return not AS:CheckOption('EmbedSystemDual') end,
				order = 6,
			},
			EmbedOoC = {
				type = 'toggle',
				name = 'Out of Combat (Hide)',
				desc = L.Skins.ToggleOptionDesc,
				order = 7,
			},
			EmbedSexyCooldown = {
				type = 'toggle',
				name = 'Attach SexyCD to action bar',
				desc = L.Skins.ToggleEmbedDesc,
				order = 8,
				disabled = function() return not AS:CheckOption('SexyCooldownSkin', 'SexyCooldown2') end,
			},
			EmbedCoolLine = {
				type = 'toggle',
				name = 'Attach CoolLine to action bar',
				desc = L.Skins.ToggleEmbedDesc,
				order = 9,
				disabled = function() return not AS:CheckOption('CoolLineSkin', 'CoolLine') end,
			},
		},
	}
	Ace3OptionsPanel.Options.args.skins.args.credits = {
		type = 'group',
		name = 'Credits',
		order = -1,
		args = {
			text = {
				order = 1,
				type = 'description',
				name = 'Credits:\n'..AS.CreditsString,
			},
		},
	}
	local order = 2
	for skinName, _ in AS:OrderedPairs(AS.register) do
		Ace3OptionsPanel.Options.args.skins.args.skins.args[skinName] = GenerateOptionTable(skinName, order)
		order = order + 1
	end
end