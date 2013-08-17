if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "ChocolateBarSkin"
function AS:SkinChocolateBar()
	for i = 1, 20 do   	
		local f = _G["ChocolateBar"..i]
		if f then
			AS:SkinFrame(f, "Default")
		end
	end
end

AS:RegisterSkin(name, AS.SkinChocolateBar)