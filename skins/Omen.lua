if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "OmenSkin"
function AS:SkinOmen()
	if TukuiThreatBar then TukuiThreatBar:Kill() end

	Omen.UpdateTitleBar_ = Omen.UpdateTitleBar
	Omen.UpdateTitleBar = function(self)
		Omen.db.profile.Scale = 1
		Omen.db.profile.Background.EdgeSize = 1
		Omen.db.profile.Background.BarInset = 2
		Omen.db.profile.TitleBar.UseSameBG = true
		self:UpdateTitleBar_()
		self.Title:SetHeight(23)
		self.TitleText:ClearAllPoints()
		self.TitleText:SetPoint("CENTER")
		self.BarList:SetPoint("TOPLEFT", self.Title, "BOTTOMLEFT", 0, 1)
	end

	Omen.UpdateBackdrop_ = Omen.UpdateBackdrop
	Omen.UpdateBackdrop = function(self)
		Omen.db.profile.Scale = 1
		Omen.db.profile.Background.EdgeSize = 1
		Omen.db.profile.Background.BarInset = 2
		self:UpdateBackdrop_()
		AS:SkinFrame(self.BarList,"Default")
		AS:SkinFrame(self.Title,"Default")
		self.BarList:SetPoint("TOPLEFT", self.Title, "BOTTOMLEFT", 0, 1)
	end

	Omen.db.profile.Bar.Spacing = 1
	Omen:UpdateTitleBar()
	Omen:UpdateBackdrop()
	Omen:ReAnchorBars()
	Omen:ResizeBars()
end

AS:RegisterSkin(name, AS.SkinOmen)