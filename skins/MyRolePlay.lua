if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "MyRolePlaySkin"
function US:SkinMyRolePlay()
	hooksecurefunc(mrp, "CreateBrowseFrame", function()
		local bg = CreateFrame("Frame", nil, MyRolePlayBrowseFrame)
		bg:SetPoint("TOPLEFT")
		bg:SetPoint("BOTTOMRIGHT")
		bg:SetFrameLevel(MyRolePlayBrowseFrame:GetFrameLevel()-1)
		US:SkinFrame(bg)
		MyRolePlayBrowseFrame:DisableDrawLayer("BACKGROUND")
		MyRolePlayBrowseFrame:DisableDrawLayer("BORDER")
		MyRolePlayBrowseFramePortraitFrame:Hide()
		MyRolePlayBrowseFrameTopBorder:Hide()
		MyRolePlayBrowseFrameTopRightCorner:Hide()
		MyRolePlayBrowseFrameInset:DisableDrawLayer("BORDER")
		MyRolePlayBrowseFrameInsetBg:Hide()
		US:SkinTab(MyRolePlayBrowseFrameTab1)
		US:SkinTab(MyRolePlayBrowseFrameTab2)
		MyRolePlayBrowseFramePortrait:Hide()
		US:SkinCloseButton(MyRolePlayBrowseFrameCloseButton)
		US:SkinScrollBar(MyRolePlayBrowseFrameAScrollFrameScrollBar)
		US:SkinScrollBar(MyRolePlayBrowseFrameBScrollFrameScrollBar)
	end)

	hooksecurefunc(mrp, "AddMRPTab", function()
		US:SkinTab(CharacterFrameTab5)
	end)

	hooksecurefunc(mrp, "CreateEditFrames", function()
		MyRolePlayMultiEditFrame:DisableDrawLayer("BORDER")
		MyRolePlayMultiEditFrameBg:Hide()
		MyRolePlayMultiEditFrameScrollFrameTop:Hide()
		MyRolePlayMultiEditFrameScrollFrameBottom:Hide()

		MyRolePlayCharacterFrame.ver:SetPoint("TOP", CharacterFrameInset, "TOP", -110, 17)
		US:SkinButton(MyRolePlayMultiEditFrameOK)
		US:SkinButton(MyRolePlayMultiEditFrameCancel)
		US:SkinButton(MyRolePlayMultiEditFrameInherit)
		US:SkinButton(MyRolePlayComboEditFrameOK)
		US:SkinButton(MyRolePlayComboEditFrameCancel)
		US:SkinButton(MyRolePlayComboEditFrameInherit)
		US:SkinButton(MyRolePlayCharacterFrame_NewProfileButton)
		US:SkinButton(MyRolePlayCharacterFrame_RenProfileButton)
		US:SkinButton(MyRolePlayCharacterFrame_DelProfileButton)
		US:SkinButton(MyRolePlayEditFrameOK)
		US:SkinButton(MyRolePlayEditFrameCancel)
		US:SkinButton(MyRolePlayEditFrameInherit)
		MyRolePlayCharacterFrame_NewProfileButton:Point("LEFT", MyRolePlayCharacterFrame_ProfileComboBox_Button, "RIGHT", 37, 0)
		MyRolePlayEditFrame.editbox:Height(25)
		MyRolePlayEditFrame.editbox:SetTemplate()
		MyRolePlayCharacterFrame_ProfileComboBox:SetPoint("TOP", CharacterFrameInset, "TOP", 0, 22)
		MyRolePlayCharacterFrame_ProfileComboBox.text:SetPoint("LEFT", MyRolePlayCharacterFrame_ProfileComboBox, "LEFT", 8, 0)
		US:SkinNextPrevButton(MyRolePlayCharacterFrame_ProfileComboBox_Button)
		US:SkinBackdropFrame(MyRolePlayCharacterFrame_ProfileComboBox)
		MyRolePlayCharacterFrame_ProfileComboBox:Size(100,20)
		MyRolePlayCharacterFrame_ProfileComboBox_Button:ClearAllPoints()
		MyRolePlayCharacterFrame_ProfileComboBox_Button:SetPoint("RIGHT", MyRolePlayCharacterFrame_ProfileComboBox, "RIGHT", 0 , 0)
		US:SkinScrollBar(MyRolePlayMultiEditFrameScrollFrameScrollBar)
	end)

	hooksecurefunc(mrp, "CreateOptionsPanel", function()
		US:SkinCheckBox(MyRolePlayOptionsPanel_Enable)
		US:SkinCheckBox(MyRolePlayOptionsPanel_MRPButton)
		US:SkinCheckBox(MyRolePlayOptionsPanel_RPChatName)
		US:SkinCheckBox(MyRolePlayOptionsPanel_Biog)
		US:SkinCheckBox(MyRolePlayOptionsPanel_FormAC)
		US:SkinCheckBox(MyRolePlayOptionsPanel_EquipAC)
		US:SkinDropDownBox(MyRolePlayOptionsPanel_TTStyle)
		US:SkinDropDownBox(MyRolePlayOptionsPanel_HeightUnit)
		US:SkinDropDownBox(MyRolePlayOptionsPanel_WeightUnit)
	end)

	local function reskinHeader(c, field)
		for i = 1, field:GetNumChildren() do
			local f = select(i, field:GetChildren())
			if not f.reskinned then
				f.h.SetBackdrop = function() end
				f:StripTextures(true)
				US:SkinBackdropFrame(f.h)
				f.h.fs:SetPoint("TOPLEFT", f.h, "TOPLEFT", 0, 1)
				if f.sep then
					f.sep:SetAlpha(0)
				end
				f.reskinned = true
			end
		end
	end

	hooksecurefunc(mrp, "CreateCFpfield", reskinHeader)
	hooksecurefunc(mrp, "CreateBFpfield", reskinHeader)
end

US:RegisterSkin(name, US.SkinMyRolePlay)