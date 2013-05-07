if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "MogItSkin"
function US:SkinMogIt()
	US:SkinFrame(MogItFrame)
	MogItFrameInset:StripTextures(true)
	US:SkinFrame(MogItFilters)
	MogItFiltersInset:StripTextures(true)
	local function SkinMogItPreview()
		for i = 1, 99 do
			local MogItGearSlots = {
				"HeadSlot",
				"ShoulderSlot",
				"BackSlot",
				"ChestSlot",
				"ShirtSlot",
				"TabardSlot",
				"WristSlot",
				"HandsSlot",
				"WaistSlot",
				"LegsSlot",
				"FeetSlot",
				"MainHandSlot",
				"SecondaryHandSlot",
			}

			for _, object in pairs(MogItGearSlots) do
				if _G["MogItPreview"..i..object] then
					US:SkinIconButton(_G["MogItPreview"..i..object], true)
					_G["MogItPreview"..i..object]:SetPushedTexture(nil)
					_G["MogItPreview"..i..object]:SetHighlightTexture(nil)
				end
			end

			if _G["MogItPreview"..i] then US:SkinFrame(_G["MogItPreview"..i]) end
			if _G["MogItPreview"..i.."CloseButton"] then US:SkinCloseButton(_G["MogItPreview"..i.."CloseButton"]) end
			if _G["MogItPreview"..i.."Inset"] then _G["MogItPreview"..i.."Inset"]:StripTextures(true) end
			if _G["MogItPreview"..i.."Activate"] then US:SkinButton(_G["MogItPreview"..i.."Activate"], true) end
		end
	end

	hooksecurefunc(MogIt, "CreatePreview", SkinMogItPreview)
	US:SkinTooltip(MogItTooltip)
	US:SkinCloseButton(MogItFrameCloseButton)
	US:SkinCloseButton(MogItFiltersCloseButton)
	MogItFrameFiltersDefaults:StripTextures(true)
	US:SkinButton(MogItFrameFiltersDefaults, true)
	US:SkinScrollBar(MogItScroll)
	US:SkinScrollBar(MogItFiltersScrollScrollBar)
end

US:RegisterSkin(name, US.SkinMogIt)