if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "GupPetSkin"
function AS:SkinGupPet()
	AS:SkinFrame(GupPet_InterfaceOptionsFrame)
	AS:SkinFrame(GupPet_InterfaceOptionsFrameOptions)
	AS:SkinFrame(GupPet_InterfaceOptionsFrameMountsCompanions)
	AS:SkinFrame(GupPet_InterfaceOptionsFrameHelp)
	AS:SkinButton(GupPet_IngameFrameTemplateMoveBottomRight)
	AS:SkinButton(GupPet_IngameFrameTemplateMoveTopRight)
	AS:SkinButton(GupPet_IngameFrameTemplateMoveBottomLeft)
	AS:SkinButton(GupPet_IngameFrameTemplateMoveTopLeft)
	AS:SkinIconButton(GupPet_IngameFrameTemplateAuto, true, true)
	AS:SkinIconButton(GupPet_IngameFrameTemplateCompanion, true, true)
	AS:SkinTab(GupPet_InterfaceOptionsFrameTab1)
	AS:SkinTab(GupPet_InterfaceOptionsFrameTab2)
	AS:SkinTab(GupPet_InterfaceOptionsFrameTab3)
	AS:SkinTab(GupPet_InterfaceOptionsFrameTab4)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsLocationsTabAdd)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsLocationsTabRemove)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabAquatic)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabGround)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabFly)
	AS:SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabCompanion)
end

AS:RegisterSkin(name, AS.SkinGupPet)