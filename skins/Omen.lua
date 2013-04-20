if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "OmenSkin"
local function SkinOmen(self)
	if TukuiThreatBar then TukuiThreatBar:Kill() end

	Omen.UpdateTitleBar_ = Omen.UpdateTitleBar
	Omen.UpdateTitleBar = function(self)
		Omen.db.profile.Scale = 1
		Omen.db.profile.Background.EdgeSize = 1
		Omen.db.profile.Background.BarInset = 2
		Omen.db.profile.TitleBar.UseSameBG = true
		self:UpdateTitleBar_()
		self.Title:SetHeight(23)
		--self.TitleText:SetFont(c["media"].font, c["datatext"].fontsize)
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
		U.SkinFrame(self.BarList,"Default")
		U.SkinFrame(self.Title,"Default")
		self.BarList:SetPoint("TOPLEFT", self.Title, "BOTTOMLEFT", 0, 1)
	end

	local omen_mt = getmetatable(Omen.Bars)
	local oldidx = omen_mt.__index
	omen_mt.__index = function(self, barID)
		local bar = oldidx(self, barID)
		Omen:UpdateBarTextureSettings()
		Omen:UpdateBarLabelSettings()
		return bar
	end

	Omen.db.profile.Bar.Spacing = 1
	Omen:UpdateTitleBar()
	Omen:UpdateBackdrop()
	Omen:ReAnchorBars()
	Omen:ResizeBars()
end

U.RegisterSkin(name,SkinOmen)