if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local A, C, L, G = unpack(Tukui or AsphyxiaUI or DuffedUI)
local AddOnName, Engine = ...
local AddOn = {};
AddOn.FrameLocks = {}

Engine[1] = AddOn
UISkins = Engine

AddOn.A = A
AddOn.Version = GetAddOnMetadata(AddOnName,"Version")
AddOn.Title = select(2, GetAddOnInfo(AddOnName))
AddOn.Blank = C["media"].blank
AddOn.NormTex = C["media"].normTex
AddOn.PixelFont = C["media"].pixelfont
AddOn.Font = C["media"].font
AddOn.UFFont = C["media"].uffont
AddOn.UIScale = C["general"].uiscale
AddOn.MyClass = A.myclass
AddOn.Noop = function() return end
AddOn.DataTextFontSize = C["datatext"].fontsize

AddOn.InfoLeft = G.Panels.DataTextLeft
AddOn.InfoRight = G.Panels.DataTextRight
AddOn.ChatBackgroundRight = G.Panels.RightChatBackground
AddOn.ChatBackgroundLeft = G.Panels.LeftChatBackground
AddOn.TabsRightBackground = G.Panels.RightChatTabsBackground
AddOn.TabsLeftBackground = G.Panels.LeftChatTabsBackground
AddOn.Minimap = G.Maps.Minimap
AddOn.Tooltip = G.Tooltips.GameTooltip.Anchor
AddOn.ActionBar1 = G.Panels.ActionBar1
AddOn.ActionBar2 = G.Panels.ActionBar2