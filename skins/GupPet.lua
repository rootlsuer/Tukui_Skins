local U = unpack(select(2,...))
local name = "GupPetSkin"
function SkinGupPet(self,event)
	U.SkinBackdropFrame(GupPet_InterfaceOptionsFrame)
	U.SkinBackdropFrame(GupPet_InterfaceOptionsFrameOptions)
	U.SkinBackdropFrame(GupPet_InterfaceOptionsFrameMountsCompanions)
	U.SkinBackdropFrame(GupPet_InterfaceOptionsFrameHelp)

	U.SkinTab(GupPet_InterfaceOptionsFrameTab1)
	U.SkinTab(GupPet_InterfaceOptionsFrameTab2)
	U.SkinTab(GupPet_InterfaceOptionsFrameTab3)
	U.SkinTab(GupPet_InterfaceOptionsFrameTab4)

	U.SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsLocationsTabAdd)
	U.SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsLocationsTabRemove)
	U.SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabAquatic)
	U.SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabGround)
	U.SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabFly)
	U.SkinTab(GupPet_InterfaceOptionsFrameMountsCompanionsMainTabCompanion)
end

U.RegisterSkin(name,SkinGupPet)