if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'PetTrackerSkin'
function AS:SkinPetTracker()
	local frame = PetTracker.Tracker.usedFrames[1].Anchor
	frame.Overlay:StripTextures()
	for i = 1, PetTracker.MaxQuality do
		AS:SkinStatusBar(frame[i])
	end
	PetTrackerMapFilter:SkinEditBox()
	AS:SkinTooltip(PetTrackerMapTip1)
	PetTrackerMapFilterSuggestions:SetTemplate()
	frame:HookScript('OnUpdate', function(self)
		for i = 1, 30 do
			if _G['PetTrackerLine'..i] then
				_G['PetTrackerLine'..i].icon:Size(18)
				_G['PetTrackerLine'..i].icon:SetTexCoord(unpack(AS.TexCoords))
				_G['PetTrackerLine'..i].subIcon:Size(16)
			end
		end
	end)
end

AS:RegisterSkin(name, AS.SkinPetTracker)