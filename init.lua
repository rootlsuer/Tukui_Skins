-- init for Tukui_ElvUI_Skins

local addon,Engine = ...

local AddOn = {};

Engine[1] = AddOn
UISkins = Engine

AddOn.FrameLocks = {}

local s

local T, C, L = unpack(Tukui)
AddOn.s = T
AddOn.c = C
AddOn.ccolor = T.myclass
s = T