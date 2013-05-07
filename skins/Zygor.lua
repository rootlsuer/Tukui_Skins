if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "ZygorSkin"
function US:SkinZygor()
	ZygorGuidesViewerFrame:StripTextures(True)
	US:SkinFrame(ZygorGuidesViewerFrame_Border)
	US:SkinFrame(ZygorGuidesViewer_CreatureViewer, true)

	for i = 1, 6 do
		US:SkinBackdropFrame(_G["ZygorGuidesViewerFrame_Step"..i])
	end

	if ZygorGuidesViewerFrame:IsShown() then US:SkinFrame(ZygorGuidesViewerFrame_Border) end
	ZygorGuidesViewerFrame_Border:HookScript("OnHide", function(self) self:StripTextures(True) end)
	ZygorGuidesViewerFrame_Border:HookScript("OnShow", function(self) US:SkinFrame(self) end)
end

US:RegisterSkin(name, US.SkinZygor)