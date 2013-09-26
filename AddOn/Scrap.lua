if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2, ...))

local name = 'ScrapSkin'
function AS:SkinScrap(event, addon)
	if event == "PLAYER_ENTERING_WORLD" then return end
	if addon == "Scrap_Merchant" then
		if Scrap and Scrap:IsObjectType("Button") then
			Scrap:StyleButton(false)
			Scrap:SetTemplate("Default", true)
			ScrapBorder:SetTexture(nil)
			ScrapIcon:SetTexture('Interface\\Addons\\Scrap\\Art\\Enabled Icon')
			ScrapIcon:SetInside()
			local numTabs = MerchantFrame.numTabs
			for i = numTabs, 1, -1 do
				tab = _G[("MerchantFrameTab%d"):format(i)]
				if tab then
					if tab:GetText() == "Scrap" then
						AS:SkinTab(tab)
						break
					end
				else
					break
				end
			end
		end
	end
	
	if addon == "Scrap_Visualizer" then
		ScrapVisualizer:StripTextures(true)
		ScrapVisualizer:CreateBackdrop("Default")
		ScrapVisualizerInset:StripTextures()
		ScrapVisualizerScroll:StripTextures()
		AS:SkinScrollBar(ScrapVisualizerScrollBar)
		AS:SkinCloseButton(ScrapVisualizerCloseButton)
		AS:SkinTab(ScrapVisualizerTab1)
		AS:SkinTab(ScrapVisualizerTab2)
		AS:SkinButton(ScrapVisualizerButton, true)
		ScrapVisualizer:Width(MerchantFrame:GetWidth()-6)
	end
end

AS:RegisterSkin(name, AS.SkinScrap, "ADDON_LOADED")