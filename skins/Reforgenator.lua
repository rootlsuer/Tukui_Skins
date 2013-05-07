if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "ReforgenatorSkin"
function US:SkinReforgenator()
	US:SkinFrame(ReforgenatorPanel)
	US:SkinFrame(ReforgenatorMessageFrame)
	US:SkinFrame(ReforgenatorMessageTextFrame)
	US:SkinDropDownBox(ReforgenatorPanel_ModelSelection)
	US:SkinDropDownBox(ReforgenatorPanel_SandboxSelection)
	US:SkinDropDownBox(ReforgenatorPanel_TargetLevelSelection)
	US:SkinCloseButton(ReforgenatorPanel_CloseButton)
	hooksecurefunc(Reforgenator,"UpdateWindowItem", function(self, index, itemDescriptor)
		if not itemDescriptor then return end
		local item = _G["ReforgenatorPanel_Item"..index]
		local iconTexture = _G["ReforgenatorPanel_Item" .. index .. "IconTexture"]
		local checked = _G["ReforgenatorPanel_Item" .. index .. "Checked"]
		US:SkinBackdropFrame(item)
		local texture = select(10, GetItemInfo(itemDescriptor.itemLink))
		iconTexture:SetTexture(texture)
		US:SkinCheckBox(checked)
	end)
end

US:RegisterSkin(name, US.SkinReforgenator)