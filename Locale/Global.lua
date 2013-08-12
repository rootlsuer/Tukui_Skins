if not (Tukui or AsphyxiaUI or DuffedUI) then return end

local AS = unpack(select(2, ...))
local L = AS.L

L.Skins = {}
if not L.DataText then L.DataText = {} end
