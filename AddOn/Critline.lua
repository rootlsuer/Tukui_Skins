if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'CritlineSkin'
function AS:SkinCritline()
	AS:SkinBackdropFrame(Critline.display)
	local Backdrop = Critline.display.backdrop or Critline.display.Backdrop
	Backdrop:SetFrameStrata('BACKGROUND')
end

AS:RegisterSkin(name, AS.SkinCritline)