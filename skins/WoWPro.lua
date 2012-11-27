local U = unpack(select(2,...))
local name = "WoWProSkin"

local function SkinWoWPro(self)
	print("WoWPro Skinning")
	U.SkinFrame(Titlebar)
	U.SkinBackdropFrame(WoWPro.MainFrame)
	_G["Mouseover Note Tooltip"]:HookScript("OnShow", function(self) self:SetTemplate() end)
end

U.RegisterSkin(name,SkinWoWPro)