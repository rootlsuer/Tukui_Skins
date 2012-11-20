local U = unpack(select(2,...))
local name = "MogItSkin"
local function SkinMogIt(self)

	U.SkinFrame(MogItFrame)
	MogItFrameInset:StripTextures(True)

	U.SkinFrame(MogItFilters)
	MogItFiltersInset:StripTextures(True)

	MogIt.view:Show()
	U.SkinFrame(MogItPreview1)
	U.SkinCloseButton(MogItPreview1CloseButton)
	MogItPreview1Inset:StripTextures(True)
	U.SkinButton(MogItPreview1Activate, true)

	local MogItPreviewGearSlots = {
		"MogItPreview1HeadSlot",
		"MogItPreview1ShoulderSlot",
		"MogItPreview1BackSlot",
		"MogItPreview1ChestSlot",
		"MogItPreview1ShirtSlot",
		"MogItPreview1TabardSlot",
		"MogItPreview1WristSlot",
		"MogItPreview1HandsSlot",
		"MogItPreview1WaistSlot",
		"MogItPreview1LegsSlot",
		"MogItPreview1FeetSlot",
		"MogItPreview1MainHandSlot",
		"MogItPreview1SecondaryHandSlot",
		}

	for _, object in pairs(MogItPreviewGearSlots) do
		_G[object]:SkinIconButton()
		_G[object]:SetPushedTexture(nil)
		_G[object]:SetHighlightTexture(nil)
	end

	MogIt.view:Hide()

	MogItTooltip:HookScript("OnShow", function(self) U.SkinFrame(self, true) end)

	U.SkinCloseButton(MogItFrameCloseButton)
	U.SkinCloseButton(MogItFiltersCloseButton)
	MogItFrameFiltersDefaults:StripTextures(True)
	U.SkinButton(MogItFrameFiltersDefaults, true)

	--Skin the Scrollbars
	--MogItScroll:StripTextures()
	--MogItScroll:SetTemplate("Default")
	U.SkinScrollBar(MogItScroll)
	U.SkinScrollBar(MogItFiltersScrollScrollBar)

end

U.RegisterSkin(name,SkinMogIt)