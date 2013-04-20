if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "SexyCooldownSkin"
local function SCDStripSkinSettings(bar)
	bar.optionsTable.args.icon.args.borderheader = nil
	bar.optionsTable.args.icon.args.border = nil
	bar.optionsTable.args.icon.args.borderColor = nil
	bar.optionsTable.args.icon.args.borderSize = nil
	bar.optionsTable.args.icon.args.borderInset = nil
	--bar.optionsTable.args.icon.args.sizeOffset = nil
	bar.optionsTable.args.bar.args.bnbheader = nil
	bar.optionsTable.args.bar.args.texture = nil
	bar.optionsTable.args.bar.args.backgroundColor = nil
	bar.optionsTable.args.bar.args.border = nil
	bar.optionsTable.args.bar.args.borderColor = nil
	bar.optionsTable.args.bar.args.borderSize = nil
	bar.optionsTable.args.bar.args.borderInset = nil
end

local function SkinSexyCooldownBar(bar)
	SCDStripSkinSettings(bar)
	U.SkinFrame(bar)
	U.RegisterForPetBattleHide(bar)
	if(U.CheckOption("EmbedSexyCooldown")) then
		bar:ClearAllPoints()
		U.ActionBar2:HookScript("OnShow", function() 
			bar:Point('BOTTOM', U.ActionBar2, 'TOP', 0, 1)
			bar:SetHeight(ActionButton1:GetHeight())
			bar:SetWidth(U.ActionBar2:GetWidth())
		end)
		U.ActionBar2:HookScript("OnHide", function() 
			bar:Point('BOTTOM', U.ActionBar1, 'TOP', 0, 1)
			bar:SetHeight(ActionButton1:GetHeight())
			bar:SetWidth(U.ActionBar1:GetWidth())
		end)
		bar:EnableMouse(false)
	end
end

local function SkinSexyCooldownIcon(bar, icon)
	if not icon.skinned then
		U.SkinFrame(icon)
		U.SkinBackdropFrame(icon.overlay, false)
		icon.tex:SetTexCoord(0.08, 0.92, 0.08, 0.92)
		icon.tex.SetTexCoord = function() end
		icon.skinned = true
	end
end

local function SkinSexyCooldownLabel(bar,label,store)
	if not label.skinned then
		label:SetFont(U.PixelFont, store.fontsize, "OUTLINE")
		label.skinned = true
	end
end
local function SkinSexyCooldownBackdrop(bar)
	bar:SetTemplate("Transparent")
end

local function HookSCDBar(bar)
	hooksecurefunc(bar, "UpdateBarLook", SkinSexyCooldownBar)
	hooksecurefunc(bar, "UpdateSingleIconLook", SkinSexyCooldownIcon)
	hooksecurefunc(bar, "UpdateLabel", SkinSexyCooldownLabel)
	hooksecurefunc(bar, "UpdateBarBackdrop", SkinSexyCooldownBackdrop)
	bar.settings.icon.borderInset = 0
end

local function SkinSexyCooldown(self)
	local scd = SexyCooldown2
	scd.CreateBar_ = scd.CreateBar
	scd.CreateBar = function(self, settings, name)
		local bar = scd:CreateBar_(settings,name)
		HookSCDBar(bar)
		return bar
	end

	for _,bar in ipairs(scd.bars) do
		HookSCDBar(bar)
		bar:UpdateBarLook()
	end
end

U.RegisterSkin(name, SkinSexyCooldown)