if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'BigBrotherSkin'
function AS:SkinBigBrother()
	hooksecurefunc(BigBrother, 'ToggleBuffWindow', function()
		if BigBrother_BuffWindow.isSkinned then return end
		AS:SkinFrame(BigBrother_BuffWindow)
		AS:SkinCloseButton(BigBrother_BuffWindow.CloseButton)
		AS:Desaturate(BigBrother_BuffWindow.LeftButton)
		AS:Desaturate(BigBrother_BuffWindow.RightButton)
		BigBrother_BuffWindow.isSkinned = true
	end)
end

AS:RegisterSkin(name, AS.SkinBigBrother)