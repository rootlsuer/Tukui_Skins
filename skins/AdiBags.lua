if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "AdiBagsSkin"
function US:SkinAdiBags(event)

	local function SkinFrame(frame)
		local region = frame.HeaderRightRegion
		US:SkinFrame(frame)
		US:SkinFrame(_G[frame:GetName()..'Bags'], "Default", true)
		US:SkinCloseButton(frame.CloseButton)
		for i = 1, 3 do
			US:SkinButton(region.widgets[i].widget, true)
		end
	end

	if event == "PLAYER_ENTERING_WORLD" then
		if not AdiBagsContainer1 then ToggleBackpack() ToggleBackpack() end
		if AdiBagsContainer1 then
			SkinFrame(AdiBagsContainer1)
			US:SkinEditBox(AdiBagsContainer1SearchBox)
			AdiBagsContainer1SearchBox:Point("TOPRIGHT", AdiBagsSimpleLayeredRegion2, "TOPRIGHT", -75, -1)
		end
	elseif event == "BANKFRAME_OPENED" then
		SkinFrame(AdiBagsContainer2)
		US:UnregisterEvent(name, self, event)
	end
end

US:RegisterSkin(name, US.SkinAdiBags, "BANKFRAME_OPENED")