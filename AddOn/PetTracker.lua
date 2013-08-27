if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'PetTrackerSkin'
function AS:SkinPetTracker()
	local frame = PetTracker.Tracker.usedFrames[1].Anchor
	AS:SkinFrame(frame.Overlay)
	for i = 1, PetTracker.MaxQuality do
		AS:SkinStatusBar(frame[i])
	end
end

AS:RegisterSkin(name, AS.SkinPetTracker)