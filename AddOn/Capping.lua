if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2, ...))

local name = 'Capping'
function AS:SkinCapping(event)
	hooksecurefunc(Capping, "StartBar",	function(self, name)
		local bar = self:GetBar(name, true)
		if not bar.backdrop then
			bar:CreateBackdrop()
			bar.iconbackdrop = CreateFrame('Frame', nil, bar)
			bar.iconbackdrop:SetOutside(bar.icon)
			AS:SkinTexture(bar.icon)
		end
	end)
end

AS:RegisterSkin(name, AS.SkinCapping)