if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'DailyTamerCheckSkin'
function AS:SkinDailyTamerCheck()
	local function SkinFrame()
		DailyTamerCheck_mainframe:SetScale(1)
		DailyTamerCheck_mainframe:HookScript('OnUpdate', function(self)
			AS:SkinFrame(self)
			for i = 1, self:GetNumChildren() do
				local object = select(i, self:GetChildren())
				if object:GetObjectType() == 'Button' then AS:SkinButton(object) end
				if object:GetObjectType() == 'Frame' then
					if not object.texture then AS:SkinFrame(object) else AS:SkinTexture(object.texture) end
				end
			end
		end)
	end

	for i = 1, Minimap:GetNumChildren() do
		local object = select(i, Minimap:GetChildren())
		if object:GetObjectType() == 'Button' and strfind(object:GetName(), 'DailyTamerCheck') then
			object:HookScript('PostClick', SkinFrame)
		end
	end
end

AS:RegisterSkin(name, AS.SkinDailyTamerCheck)