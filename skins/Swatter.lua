if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
if IsAddOnLoaded("!BugGrabber") then return end
if IsAddOnLoaded("!ImprovedErrorFrame") then return end
local US = unpack(select(2,...))

local name = "SwatterSkin"
function US:SkinSwatter()
	if SwatterErrorFrame then
		US:SkinFrame(SwatterErrorFrame)
		US:SkinButton(Swatter.Error.Done)
		US:SkinButton(Swatter.Error.Next)
		US:SkinButton(Swatter.Error.Prev)
		US:SkinButton(Swatter.Drag)
		US:SkinScrollBar(SwatterErrorInputScrollScrollBar)
	end
end

US:RegisterSkin(name, US.SkinSwatter)