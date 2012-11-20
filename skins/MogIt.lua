local U = unpack(select(2,...))
local name = "MogItSkin"
function SkinMogIt(self)

	--Skinning MogIt Frames
	U.SkinBackdropFrame(MogItFrame)
	U.SkinBackdropFrame(MogItFrameInset)
	U.SkinFrameD(MogItFrameFiltersButton)
	U.SkinFrameD(MogItFramePreviewButton)
	U.SkinBackdropFrame(MogItFilters)
	U.SkinBackdropFrame(MogItFiltersInset)
	U.SkinBackdropFrame(MogItPreview)
	U.SkinBackdropFrame(MogItPreviewInset)
	MogItTooltip:HookScript("OnShow", function(self) U.SkinFrame(self, true) end)

	--Skin the Buttons
	U.SkinButton(MogItFrameFiltersButton)
	U.SkinButton(MogItFramePreviewButton)
	U.SkinButton(MogItFrameOptionsButton)
	U.SkinButton(MogItFrameHelpButton)
	U.SkinButton(MogItFrameFiltersDefaults)
	U.SkinButton(MogItFramePreviewSave)
	U.SkinButton(MogItFramePreviewLoad)
	U.SkinButton(MogItFramePreviewClear)
	U.SkinButton(MogItFramePreviewAddItem)
	U.SkinButton(MogItFramePreviewImport)
	U.SkinButton(MogItFramePreviewLink)
	U.SkinCloseButton(MogItFrameCloseButton)
	U.SkinCloseButton(MogItPreviewCloseButton)
	U.SkinCloseButton(MogItFiltersCloseButton)

	--Reposition the Buttons
	MogItFrameFiltersDefaults:ClearAllPoints()
	MogItFrameFiltersDefaults:Point("BOTTOM", MogItFilters, "BOTTOM", 0, 2)
	MogItFrameFiltersButton:ClearAllPoints()
	MogItFrameFiltersButton:Point("BOTTOMLEFT", MogItFrame, "BOTTOMLEFT", 6, 1)
	MogItFramePreviewButton:ClearAllPoints()
	MogItFramePreviewButton:Point("RIGHT", MogItFrameFiltersButton, "RIGHT", 104, 0)
	MogItFrameOptionsButton:ClearAllPoints()
	MogItFrameOptionsButton:Point("RIGHT", MogItFramePreviewButton, "RIGHT", 104, 0)
	MogItFrameHelpButton:ClearAllPoints()
	MogItFrameHelpButton:Point("RIGHT", MogItFrameOptionsButton, "RIGHT", 104, 0)
	MogItFramePreviewAddItem:ClearAllPoints()
	MogItFramePreviewAddItem:Point("BOTTOMLEFT", MogItPreview, "BOTTOMLEFT", 6, 1)
	MogItFramePreviewImport:ClearAllPoints()
	MogItFramePreviewImport:Point("RIGHT", MogItFramePreviewAddItem, "RIGHT", 114, 0)
	MogItFramePreviewLink:ClearAllPoints()
	MogItFramePreviewLink:Point("RIGHT", MogItFramePreviewImport, "RIGHT", 74, 0)

	--Reposition this Frame just a bit
	MogItFilters:ClearAllPoints()
	MogItFilters:Point("RIGHT", MogItFrame, "RIGHT", 208, 0)

	--Resize the Buttons
	MogItFrameFiltersDefaults:Size(76, 20)
	MogItFrameHelpButton:Size(40, 22)
	MogItFramePreviewAddItem:Size(100, 22)
	MogItFramePreviewImport:Size(100, 22)
	MogItFramePreviewLink:Size(60, 22)

	--Skin the Scrollbars
	--MogItScroll:StripTextures()
	--MogItScroll:SetTemplate("Default")
	--MogItFiltersScrollScrollBar:StripTextures()
	--MogItFiltersScrollScrollBar:SetTemplate("Default")
	U.SkinScrollBar(MogItScroll)
	U.SkinScrollBar(MogItFiltersScrollScrollBar)

end

U.RegisterSkin(name,SkinMogIt)