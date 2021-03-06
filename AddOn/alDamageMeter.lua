if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'alDamageMeterSkin'
function AS:SkinALDamageMeter()
	alDamageMeterFrame.bg:Kill()
	AS:SkinBackdropFrame(alDamageMeterFrame, 'Transparent')
	alDamageMeterFrame:HookScript('OnShow', function()
		if AS:CheckOption('EmbedalDamageMeter') then
			EmbedSystem_MainWindow:Show()
		end
	end)
end

AS:RegisterSkin(name, AS.SkinALDamageMeter)