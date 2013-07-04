if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local A, C, L, G = unpack(Tukui or AsphyxiaUI or DuffedUI)
local AddOnName, Engine = ...
local AddOn = {}
AddOn.FrameLocks = {}

Engine[1] = AddOn
UISkins = Engine

AddOn.Version = GetAddOnMetadata(AddOnName, "Version")
AddOn.Title = select(2, GetAddOnInfo(AddOnName))
AddOn.Blank = C["media"].blank
AddOn.NormTex = C["media"].normal
AddOn.Font = C["media"].font
AddOn.UFFont = C["media"].uffont
AddOn.PixelFont = C["media"].pixelfont
AddOn.ActionBarFont = C["media"].font
AddOn.UIScale = C["general"].uiscale
AddOn.MyClass = select(2, UnitClass("player"))
AddOn.MyName = UnitName("player")
AddOn.MyRealm = GetCVar("realmName")
AddOn.Noop = function() return end
AddOn.DataTextFontSize = C["datatext"].fontsize
AddOn.BackdropColor = C["media"].backdropcolor
AddOn.BorderColor = C["media"].bordercolor
AddOn.Mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/AddOn.UIScale
--AddOn.Eyefinity = A.eyefinity

AddOn.InfoLeft = G.Panels.DataTextLeft
AddOn.InfoRight = G.Panels.DataTextRight
AddOn.ChatBackgroundRight = G.Panels.RightChatBackground
AddOn.ChatBackgroundLeft = G.Panels.LeftChatBackground
AddOn.TabsRightBackground = G.Panels.RightChatTabsBackground
AddOn.TabsLeftBackground = G.Panels.LeftChatTabsBackground
AddOn.Minimap = G.Maps.Minimap
AddOn.TooltipEnable = C["tooltip"]["enable"]
AddOn.ActionBar1 = G.ActionBars.Bar1
AddOn.ActionBar2 = G.ActionBars.Bar2
AddOn.ActionBar3 = G.ActionBars.Bar3
AddOn.ActionBar4 = G.ActionBars.Bar4