if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "TinyDPSSkin"
local function SkinTinyDps(self)
	U.SkinFrame(tdpsFrame)
	if tdps then
		tdps.width = U.Minimap:GetWidth()
	end
	if tdpsStatusBar then
		tdpsStatusBar:SetBackdrop({bgFile = U.NormTex, edgeFile = U.Blank, tile = false, tileSize = 0, edgeSize = 1})
		tdpsStatusBar:SetStatusBarTexture(U.NormTex)
	end
end

U.RegisterSkin(name,SkinTinyDps)