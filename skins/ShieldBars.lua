if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "ShieldBarsSkin"
function US:SkinShieldBars()
	hooksecurefunc(ShieldBars, "DisplayShields", function()
		local i = 1
		while _G["ShieldBarsStatusBar"..i.."Frame"] do
			US:SkinFrame(_G["ShieldBarsStatusBar"..i.."Frame"], false, true)
			i = i + 1
		end
	end)
end

US:RegisterSkin(name, US.SkinShieldBars)	