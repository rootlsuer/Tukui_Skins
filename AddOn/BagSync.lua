if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2, ...))

local name = 'BagSyncSkin'
function AS:SkinBagSync()
	BagSync_SearchFrame:SetTemplate('Transparent')
	BagSync_SearchFrame:HookScript('OnShow', function(frame)
		if frame.scrollbar and not frame.scrollbar.isSkinned then
			AS:SkinSlideBar(frame.scrollbar)
			frame.scrollbar:HookScript('OnUpdate', function()
				for i = 1, frame.scrollbar:GetNumChildren() do
					local object = select(i, frame.scrollbar:GetChildren())
					if object then object:Hide() end
				end
				local Backdrop = frame.scrollbar.backdrop or frame.scrollbar.Backdrop
				Backdrop:Show()
			end)
			frame.scrollbar.isSkinned = true
		end
	end)
	AS:SkinEditBox(BagSync_SearchFrameEdit1)

	for i = 1, BagSync_SearchFrame:GetNumChildren() do
		local object = select(i, BagSync_SearchFrame:GetChildren())
		if object:GetObjectType() == 'Button' then
			AS:SkinCloseButton(object, true)
		end
	end
end

AS:RegisterSkin(name, AS.SkinBagSync)