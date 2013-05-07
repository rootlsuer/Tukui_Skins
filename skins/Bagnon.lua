if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = 'BagnonSkin'
function US:SkinBagnon(event, addon)
	if event == "PLAYER_ENTERING_WORLD" then
		ToggleBackpack()
		US:SkinFrame(BagnonFrameinventory)
		US:SkinCloseButton(BagnonFrameinventoryCloseButton)
		ToggleBackpack()
	elseif event == "BANKFRAME_OPENED" then
		US:SkinFrame(BagnonFramebank)
		US:SkinCloseButton(BagnonFramebankCloseButton)
		US:UnregisterEvent(name, self, event)
	elseif event == "GUILDBANKFRAME_OPENED" and addon == "Bagnon_GuildBank" then
		US:SkinFrame(BagnonFrameguildbank)
		US:SkinCloseButton(BagnonFrameguildbankCloseButton)
		US:UnregisterEvent(name, self, "GUILDBANKFRAME_OPENED")
	elseif event == "VOID_STORAGE_OPEN" and addon == "Bagnon_VoidStorage" then
		US:SkinFrame(BagnonFramevoidstorage)
		US:SkinCloseButton(BagnonFramevoidstorageCloseButton)
		US:UnregisterEvent(name, self, "VOID_STORAGE_OPEN")
	end
end

US:RegisterSkin(name, US.SkinBagnon, "ADDON_LOADED", "BANKFRAME_OPENED", "GUILDBANKFRAME_OPENED", "VOID_STORAGE_OPEN")