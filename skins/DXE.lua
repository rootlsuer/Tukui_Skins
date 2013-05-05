if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "DXESkin"
local function SkinDXE()

	local function SkinDXEBar(bar)
		bar:SetTemplate("Transparent")
		bar.bg:SetTexture(nil)
		bar.border:Kill()
		bar.statusbar:SetStatusBarTexture(U.NormTex)
		bar.statusbar:ClearAllPoints()
		bar.statusbar:SetInside()
		
		bar.righticon:SetTemplate("Default")
		bar.righticon.border:Kill()
		bar.righticon:ClearAllPoints()
		bar.righticon:SetPoint("LEFT", bar, "RIGHT", 2, 0)
		bar.righticon.t:SetTexCoord(.09,.91,.09,.91)
		bar.righticon.t:ClearAllPoints()
		bar.righticon.t:SetInside()
		bar.righticon.t:SetDrawLayer("ARTWORK")
		
		bar.lefticon:SetTemplate("Default")
		bar.lefticon.border:Kill()
		bar.lefticon:ClearAllPoints()
		bar.lefticon:SetPoint("RIGHT", bar, "LEFT", -2, 0)
		bar.lefticon.t:SetTexCoord(.09,.91,.09,.91)
		bar.lefticon.t:ClearAllPoints()
		bar.lefticon.t:SetInside()
		bar.lefticon.t:SetDrawLayer("ARTWORK")
	end

	DXE.LayoutHealthWatchers_ = DXE.LayoutHealthWatchers
	DXE.LayoutHealthWatchers = function(self)
		for i,hw in ipairs(self.HW) do
			if hw:IsShown() then
				hw:SetTemplate("Transparent")
				hw.border:Kill()
				hw.healthbar:SetStatusBarTexture(U.NormTex)
			end
		end
	end

	DXE.Alerts.RefreshBars_ = DXE.Alerts.RefreshBars
	DXE.Alerts.RefreshBars = function(self)
		if self.refreshing then return end
		self.refreshing = true
		self:RefreshBars_()
		local i = 1
		while _G["DXEAlertBar"..i] do
			local bar = _G["DXEAlertBar"..i]
			bar:SetScale(1)
			bar.SetScale = function() return end
			SkinDXEBar(bar)
			i = i + 1
		end
		self.refreshing = false
	end

	DXE.Alerts.Simple_ = DXE.Alerts.Simple
	DXE.Alerts.Simple = function(self,...)
		self:Simple_(...)
		self:RefreshBars()
	end

	DXE:LayoutHealthWatchers()
	DXE.Alerts:RefreshBars()

	if not DXEDB then DXEDB = {} end
	if not DXEDB["profiles"] then DXEDB["profiles"] = {} end
	if not DXEDB["profiles"][U.MyName.." - "..U.MyRealm] then DXEDB["profiles"][U.MyName.." - "..U.MyRealm] = {} end
	if not DXEDB["profiles"][U.MyName.." - "..U.MyRealm]["Globals"] then DXEDB["profiles"][U.MyName.." - "..U.MyRealm]["Globals"] = {} end
	DXEDB["profiles"][U.MyName.." - "..U.MyRealm]["Globals"]["BackgroundTexture"] = U.Blank
	DXEDB["profiles"][U.MyName.." - "..U.MyRealm]["Globals"]["BarTexture"] = U.NormTex
	DXEDB["profiles"][U.MyName.." - "..U.MyRealm]["Globals"]["Border"] = "None"
	DXEDB["profiles"][U.MyName.." - "..U.MyRealm]["Globals"]["Font"] = U.Font
	DXEDB["profiles"][U.MyName.." - "..U.MyRealm]["Globals"]["TimerFont"] = U.Font
end

U.RegisterSkin(name, SkinDXE)