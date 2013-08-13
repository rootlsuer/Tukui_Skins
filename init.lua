if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local A, C, L, G = unpack(Tukui or AsphyxiaUI or DuffedUI)
local AddOnName, Engine = ...
local AddOn = {
	Credits = {
		'Affli',
		'Azilroka',
		'Blazeflack',
		'Cadayron',
		'Camealion',
		'Catok',
		'Darth Predator',
		'Dec',
		'Edoc',
		'Elv',
		'Jasje',
		'Kkthnx',
		'Konungr',
		'Lockslap',
		'Lolarennt',
		'Outofammo',
		'Pat',
		'Repooc',
		'Shadowcall',
		'Sinaris',
		'Sortokk',
		'Tukz',
	},
	CreditsString = '',
	FrameLocks = {},
	Locale = L,
	MyClass = select(2, UnitClass('player')),
	MyName = UnitName('player'),
	MyRealm = GetCVar('realmName'),
	Noop = function() return end,
	Title = select(2, GetAddOnInfo(AddOnName)),
	TexCoords = {.08, .92, .08, .92},
	Version = GetAddOnMetadata(AddOnName, 'Version'),
}

sort(AddOn.Credits)
for Key, Person in pairs(AddOn.Credits) do
	AddOn.CreditsString = AddOn.CreditsString..'\n'..Person
end

Engine[1] = AddOn
UISkins = Engine

if Tukui and tonumber(GetAddOnMetadata('Tukui', 'Version')) >= 16.00 then
	AddOn.Blank = C['Medias'].Blank
	AddOn.NormTex = C['Medias'].Normal
	AddOn.Font = C['Medias'].Font
	AddOn.UFFont = C['Medias'].AltFont
	AddOn.PixelFont = C['Medias'].PixelFont
	AddOn.ActionBarFont = C['Medias'].ActionBarFont
	AddOn.UIScale = C['General'].UIScale
	AddOn.DataTextFontSize = A['DataTexts'].Size
	AddOn.BackdropColor = C['Medias'].BackdropColor
	AddOn.BorderColor = C['Medias'].BorderColor
	AddOn.Mult = 768/strmatch(GetCVar('gxResolution'), '%d+x(%d+)')/AddOn.UIScale
	AddOn.DataTexts = A['DataTexts']

	AddOn.InfoLeft = A.Panels.DataTextLeft
	AddOn.InfoRight = A.Panels.DataTextRight
	AddOn.ChatBackgroundRight = A.Panels.RightChatBackground
	AddOn.ChatBackgroundLeft = A.Panels.LeftChatBackground
	AddOn.TabsRightBackground = A.Panels.RightChatTabsBackground
	AddOn.TabsLeftBackground = A.Panels.LeftChatTabsBackground
	AddOn.Minimap = A.Minimap
	AddOn.TooltipEnable = C['Tooltips']['Enable']
	AddOn.ActionBar1 = A.ActionBar1
	AddOn.ActionBar2 = A.ActionBar2
	AddOn.ActionBar3 = A.ActionBar3
	AddOn.ActionBar4 = A.ActionBar4
else
	AddOn.Blank = C['media'].blank
	AddOn.NormTex = C['media'].normTex
	AddOn.Font = C['media'].font
	AddOn.UFFont = C['media'].uffont
	AddOn.PixelFont = C['media'].pixelfont
	AddOn.ActionBarFont = C['media'].font
	AddOn.UIScale = C['general'].uiscale
	AddOn.DataTextFontSize = C['datatext'].fontsize
	AddOn.BackdropColor = C['media'].backdropcolor
	AddOn.BorderColor = C['media'].bordercolor
	AddOn.Mult = 768/strmatch(GetCVar('gxResolution'), '%d+x(%d+)')/AddOn.UIScale

	AddOn.InfoLeft = G.Panels.DataTextLeft
	AddOn.InfoRight = G.Panels.DataTextRight
	AddOn.ChatBackgroundRight = G.Panels.RightChatBackground
	AddOn.ChatBackgroundLeft = G.Panels.LeftChatBackground
	AddOn.TabsRightBackground = G.Panels.RightChatTabsBackground
	AddOn.TabsLeftBackground = G.Panels.LeftChatTabsBackground
	AddOn.Minimap = G.Maps.Minimap
	AddOn.TooltipEnable = C['tooltip']['enable']
	AddOn.ActionBar1 = G.ActionBars.Bar1
	AddOn.ActionBar2 = G.ActionBars.Bar2
	AddOn.ActionBar3 = G.ActionBars.Bar3
	AddOn.ActionBar4 = G.ActionBars.Bar4
end