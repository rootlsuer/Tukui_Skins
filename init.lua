if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local A, C, L, G = unpack(Tukui or AsphyxiaUI or DuffedUI)
local AddOnName, Engine = ...
local AddOn = LibStub('AceAddon-3.0'):NewAddon(AddOnName, 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0', 'AceHook-3.0')
Engine[1] = AddOn
_G[AddOnName] = Engine

AddOn.Credits = {
	'Affli',
	'Arstraea',
	'Azilroka',
	'Blazeflack',
	'Cadayron',
	'Camealion',
	'Catok',
	'Darth Predator',
	'Dec',
	'Driizt',
	'Edoc',
	'Elv',
	'Jasje',
	'Kkthnx',
	'Konungr',
	'Lockslap',
	'lolarennt',
	'MaXiMUS',
	'Outofammo',
	'Pat',
	'Repooc',
	'Shadowcall',
	'Sinaris',
	'Sortokk',
	'Tukz',
	'Warmexx',
}

AddOn.CreditsString = ''
AddOn.FrameLocks = {}
AddOn.Locale = L
AddOn.MyClass = select(2, UnitClass('player'))
AddOn.MyName = UnitName('player')
AddOn.MyRealm = GetCVar('realmName')
AddOn.Noop = function() return end
AddOn.Title = select(2, GetAddOnInfo(AddOnName))
AddOn.TexCoords = {.08, .92, .08, .92}
AddOn.Version = GetAddOnMetadata(AddOnName, 'Version')

sort(AddOn.Credits)
for Key, Person in pairs(AddOn.Credits) do
	AddOn.CreditsString = AddOn.CreditsString..'\n'..Person
end

if DuffedUI then
	AddOn.UIBase = 'DuffedUI'
	AddOn.UIBaseVersion = GetAddOnMetadata('DuffedUI', 'Version')
elseif AsphyxiaUI then
	AddOn.UIBase = 'AsphyxiaUI'
	AddOn.UIBaseVersion = GetAddOnMetadata('AsphyxiaUI', 'Version')
elseif Tukui then
	AddOn.UIBase = 'Tukui'
	AddOn.UIBaseVersion = GetAddOnMetadata('Tukui', 'Version')
end

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
elseif AsphyxiaUI and tostring(GetAddOnMetadata('AsphyxiaUI', 'Version')) == '8.1.0' then
	AddOn.Blank = C['Media']['Textures']['Blank']
	AddOn.NormTex = C['Media']['Textures']['Normal']
	AddOn.Font = C['Media']['Fonts']['Default']['Normal']
	AddOn.UFFont = C['Media']['Fonts']['Default']['Unitframes']
	AddOn.PixelFont = C['Media']['Fonts']['Pixel']['Asphyxia']
	AddOn.ActionBarFont = C['Media']['Fonts']['Default']['Normal']
	AddOn.UIScale = C['General']['UIScale']
	AddOn.DataTextFontSize = 12
	AddOn.BackdropColor = C['Media']['Colors']['Backdrop']
	AddOn.BorderColor = C['Media']['Colors']['Border']
	AddOn.Mult = 768/strmatch(GetCVar('gxResolution'), '%d+x(%d+)')/AddOn.UIScale
	AddOn.DataTexts = A['DataTexts']

	AddOn.InfoLeft = A['Layouts']['DataTextLeft']
	AddOn.InfoRight = A['Layouts']['DataTextRight']
	AddOn.ChatBackgroundRight = A['Layouts']['ChatRight']
	AddOn.ChatBackgroundLeft = A['Layouts']['ChatLeft']
	AddOn.TabsRightBackground = A['Layouts']['ChatRightTab']
	AddOn.TabsLeftBackground = A['Layouts']['ChatLeftTab']
	AddOn.Minimap = A['Minimap']
	--AddOn.TooltipEnable = C['Tooltips']['Enable']
	AddOn.ActionBar1 = A['Layouts']['ActionBars1']
	AddOn.ActionBar2 = A['Layouts']['ActionBars2']
	AddOn.ActionBar3 = A['Layouts']['ActionBars3']
	AddOn.ActionBar4 = A['Layouts']['ActionBars4']
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

function AddOn:Delay(delay, func, ...)
	A.Delay(delay, func, ...)
end