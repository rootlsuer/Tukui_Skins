if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "MogItSkin"
local function SkinMogIt(self)
	U.SkinFrame(MogItFrame)
	MogItFrameInset:StripTextures(true)
	U.SkinFrame(MogItFilters)
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
					U.SkinIconButton(_G["MogItPreview"..i..object], true)
					_G["MogItPreview"..i..object]:SetPushedTexture(nil)
					_G["MogItPreview"..i..object]:SetHighlightTexture(nil)
				end
			end

			if _G["MogItPreview"..i] then U.SkinFrame(_G["MogItPreview"..i]) end
			if _G["MogItPreview"..i.."CloseButton"] then U.SkinCloseButton(_G["MogItPreview"..i.."CloseButton"]) end
			if _G["MogItPreview"..i.."Inset"] then _G["MogItPreview"..i.."Inset"]:StripTextures(true) end
			if _G["MogItPreview"..i.."Activate"] then U.SkinButton(_G["MogItPreview"..i.."Activate"], true) end
		end
	end

	hooksecurefunc(MogIt, "CreatePreview", SkinMogItPreview)
	U.SkinTooltip(MogItTooltip)
	U.SkinCloseButton(MogItFrameCloseButton)
	U.SkinCloseButton(MogItFiltersCloseButton)
	MogItFrameFiltersDefaults:StripTextures(true)
	U.SkinButton(MogItFrameFiltersDefaults, true)
	U.SkinScrollBar(MogItScroll)
	U.SkinScrollBar(MogItFiltersScrollScrollBar)
end

U.RegisterSkin(name,SkinMogIt)