if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "TinyDPSSkin"
function US:SkinTinyDPS()
	US:SkinFrame(tdpsFrame)
	if tdps then
		tdps.width = US.Minimap:GetWidth()
	end
	if tdpsStatusBar then
		tdpsStatusBar:SetBackdrop({bgFile = US.NormTex, edgeFile = US.Blank, tile = false, tileSize = 0, edgeSize = 1})
		tdpsStatusBar:SetStatusBarTexture(US.NormTex)
	end
end

US:RegisterSkin(name, US.SkinTinyDPS)