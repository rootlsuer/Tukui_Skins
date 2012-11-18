-- init for Tukui_Skins

local addon,Engine = ...

local AddOn = {};

Engine[1] = AddOn
UISkins = Engine

AddOn.FrameLocks = {}
AddOn.FrameColor = {}
AddOn.FrameColorSB = {}

local T, C, L = unpack(Tukui)
AddOn.s = T
AddOn.c = C
AddOn.ccolor = T.myclass
