if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "GupPetSkin"
function US:SkinGupPet()
	US:SkinFrame(GupPet_InterfaceOptionsFrame)
	US:SkinFrame(GupPet_InterfaceOptionsFrameOptions)
	US:SkinFrame(GupPet_InterfaceOptionsFrameMountsCompanions)
	US:SkinFrame(GupPet_InterfaceOptionsFrameHelp)
	US:SkinButton(GupPet_IngameFrameTemplateMoveBottomRight)
	US:SkinButton(GupPet_IngameFrameTemplateMoveTopRight)
	US:SkinButton(GupPet_IngameFrameTemplateMoveBottomLeft)
	US:SkinButton(GupPet_IngameFrameTemplateMoveTopLeft)
	US:SkinIconButton(GupPet_IngameFrameTemplateAuto, true, true)
	US:SkinIconButton(GupPet_IngameFrameTemplateCompanion, true, true)
	US:SkinTab(GupPet_InterfaceOptionsFrameTab1)
	US:SkinTab(GupPet_InterfaceOptionsFrameTab2)
	US:SkinTab(GupPet_InterfaceOptionsFrameTab3)
	US:SkinTab(GupPet_InterfaceOptionsFrameTab4)
	US:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsLocationsTabAdd)
	US:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsLocationsTabRemove)
	US:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabAquatic)
	US:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabGround)
	US:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabFly)
	US:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabCompanion)
end

US:RegisterSkin(name, US.SkinGupPet)