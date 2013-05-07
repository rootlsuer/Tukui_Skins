if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
if IsAddOnLoaded("!BugGrabber") then return end
if IsAddOnLoaded("!ImprovedErrorFrame") then return end
local AS = unpack(select(2,...))

local name = "SwatterSkin"
function AS:SkinSwatter()
	if SwatterErrorFrame then
		AS:SkinFrame(SwatterErrorFrame)
		AS:SkinButton(Swatter.Error.Done)
		AS:SkinButton(Swatter.Error.Next)
		AS:SkinButton(Swatter.Error.Prev)
		AS:SkinButton(Swatter.Drag)
		AS:SkinScrollBar(SwatterErrorInputScrollScrollBar)
	end
end

AS:RegisterSkin(name, AS.SkinSwatter)