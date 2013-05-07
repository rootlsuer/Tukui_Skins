if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "WhollySkin"
function US:SkinWholly()
	local function SkinWhollyFrame()
		US:SkinFrame(com_mithrandir_whollyFrame)
		US:SkinCloseButton(com_mithrandir_whollyFrameCloseButton)
		US:SkinScrollBar(com_mithrandir_whollyFrameScrollBar)
		com_mithrandir_whollyFrameZoneButton:ClearAllPoints()
		com_mithrandir_whollyFrameZoneButton:Point("TOP", com_mithrandir_whollyFrame, "TOP", 60, -40)

		local buttons = {
			"SwitchZoneButton",
			"PreferencesButton",
			"SortButton"
		}
		for button,_ in pairs(buttons) do
			US:SkinButton(_G["com_mithrandir_whollyFrame"..button])
		end
	end
	com_mithrandir_whollyFrame:HookScript("OnShow", function(self) SkinWhollyFrame() end)
end

US:RegisterSkin(name, US.SkinWholly)