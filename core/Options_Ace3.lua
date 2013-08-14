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
		get = function(info) return AS:CheckOption(info) end,
		set = function(info, value) AS:ToggleOption(info) end,
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
						disabled = function() return not (IsAddOnLoaded('DBM-Core') and AS:CheckOption('DBMSkin')) end
					},
					DBMFontSize = {
						type = 'range',
						order = 2,
						name = "DBM Font Size",
						desc = "DBM Font Size",
						min = 8, max = 18, step = 1, 
						disabled = function() return not (IsAddOnLoaded('DBM-Core') and AS:CheckOption('DBMSkin')) end
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
						disabled = function() return not (IsAddOnLoaded('DBM-Core') and AS:CheckOption('DBMSkin')) end
					},
					DBMSkinHalf = {
						type = 'toggle',
						name = 'DBM Half-bar Skin',
						desc = L.Skins.ToggleSkinDesc,
						order = 1,
						disabled = function() return not (IsAddOnLoaded('DBM-Core') and AS:CheckOption('DBMSkin')) end
					},
					RecountBackdrop = {
						type = 'toggle',
						name = 'Recount Backdrop',
						desc = L.Skins.ToggleOptionDesc,
						order = 2,
						disabled = function() return not (IsAddOnLoaded('Recount') and AS:CheckOption('RecountSkin')) end,
					},
					SkadaBackdrop = {
						type = 'toggle',
						name = 'Skada Backdrop',
						desc = L.Skins.ToggleOptionDesc,
						order = 3,
						disabled = function() return not (IsAddOnLoaded('Skada') and AS:CheckOption('SkadaSkin')) end,
					},
				},
			},
		},
	}
	Ace3OptionsPanel.Options.args.skins.args.embed = {
		order = 2,
		type = 'group',
		name = 'Embed Settings',
		get = function(info) return AS:CheckOption(info) end,
		set = function(info, value) AS:ToggleOption(info) end,
		args = {
			desc = {
				type = 'description',
				name = 'Settings to control Embedded AddOns:\n\nAvailable Embeds: alDamageMeter | Omen | Skada | Recount | TinyDPS',
				order = 1
			},
			EmbedLeft = {
				type = 'input',
				width = 'full',
				name = 'Embed for Left Chat Panel',
				desc = 'Available Embeds: alDamageMeter | Omen | Skada | Recount | TinyDPS',
				order = 2
			},
			EmbedRight = {
				type = 'input',
				width = 'full',
				name = 'Embed to Right Chat Panel',
				desc = 'Available Embeds: alDamageMeter | Omen | Skada | Recount | TinyDPS',
				order = 3
			},
			EmbedOoC = {
				type = 'toggle',
				name = 'Out of Combat (Hide)',
				desc = L.Skins.ToggleOptionDesc,
				order = 10,
			},
			EmbedSexyCooldown = {
				type = 'toggle',
				name = 'Attach SexyCD to action bar',
				desc = L.Skins.ToggleEmbedDesc,
				order = 11,
				disabled = function() return not IsAddOnLoaded('SexyCooldown2') end,
			},
			EmbedCoolLine = {
				type = 'toggle',
				name = 'Attach CoolLine to action bar',
				desc = L.Skins.ToggleEmbedDesc,
				order = 12,
				disabled = function() return not IsAddOnLoaded('CoolLine') end,
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