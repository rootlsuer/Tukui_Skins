if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "RaidBuffStatusSkin"
function US:SkinRaidBuffStatus()
	US:SkinFrame(RBSFrame)
	US:SkinButton(RBSFrameScanButton)
	US:SkinButton(RBSFrameReadyCheckButton)
	US:SkinButton(RBSFrameBossButton)
	US:SkinButton(RBSFrameTrashButton)
	US:SkinNextPrevButton(RBSFrameOptionsButton)
	US:SkinNextPrevButton(RBSFrameTalentsButton)
	RBSFrameOptionsButton:Size(20)
	RBSFrameTalentsButton:Size(20)
end

US:RegisterSkin(name, US.SkinRaidBuffStatus)