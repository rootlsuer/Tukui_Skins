if not (Tukui or AsphyxiaUI or DuffedUI) then return end

local AS = unpack(select(2, ...))
local L = AS.Locale

if not L.Skins then L.Skins = {} end
if not L.DataText then L.DataText = {} end
