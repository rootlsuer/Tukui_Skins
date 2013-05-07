if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

LoadAddOn("DXE")
local name = "DXESkin"
function US:SkinDXE()
	DXE.NotifyBarTextureChanged = US.Noop
	DXE.NotifyBorderChanged = US.Noop
	DXE.NotifyBorderColorChanged = US.Noop
	DXE.NotifyBorderEdgeSizeChanged = US.Noop
	DXE.NotifyBackgroundTextureChanged = US.Noop
	DXE.NotifyBackgroundInsetChanged = US.Noop
	DXE.NotifyBackgroundColorChanged = US.Noop

	local function SkinDXEBar(bar)
		bar:SetTemplate("Transparent")
		bar.bg:SetTexture(nil)
		bar.border.Show = function() end
		bar.border:Hide()
		bar.statusbar:SetStatusBarTexture(US.NormTex)
		bar.statusbar:ClearAllPoints()
		bar.statusbar:SetInside()
		
		bar.righticon:SetTemplate("Default")
		bar.righticon.border.Show = function() end
		bar.righticon.border:Hide()
		bar.righticon:ClearAllPoints()
		bar.righticon:SetPoint("LEFT", bar, "RIGHT", 2, 0)
		bar.righticon.t:SetTexCoord(.09,.91,.09,.91)
		bar.righticon.t:ClearAllPoints()
		bar.righticon.t:SetInside()
		bar.righticon.t:SetDrawLayer("ARTWORK")
		
		bar.lefticon:SetTemplate("Default")
		bar.lefticon.border.Show = function() end
		bar.lefticon.border:Hide()
		bar.lefticon:ClearAllPoints()
		bar.lefticon:SetPoint("RIGHT", bar, "LEFT", -2, 0)
		bar.lefticon.t:SetTexCoord(.09,.91,.09,.91)
		bar.lefticon.t:ClearAllPoints()
		bar.lefticon.t:SetInside()
		bar.lefticon.t:SetDrawLayer("ARTWORK")
	end

	DXE.LayoutHealthWatchers_ = DXE.LayoutHealthWatchers
	DXE.LayoutHealthWatchers = function(frame)
		DXE:LayoutHealthWatchers_()
		for i,hw in ipairs(frame.HW) do
			if hw:IsShown() then
				hw:SetTemplate("Transparent")
				hw.border.Show = function() end
				hw.border:Hide()
				hw.healthbar:SetStatusBarTexture(US.NormTex)
			end
		end
	end

	local function RefreshDXEBars(frame)
		if frame.refreshing then return end
		frame.refreshing = true
		local i = 1
		while _G["DXEAlertBar"..i] do
			local bar = _G["DXEAlertBar"..i]
			if not bar.skinned then
				bar:SetScale(1)
				bar.SetScale = function() return end
				SkinDXEBar(bar)
				bar.skinned = true
			end
			i = i + 1
		end
		frame.refreshing = false
	end

	local DXEAlerts = DXE:GetModule("Alerts")

	local frame = CreateFrame("Frame")
	frame.elapsed = 1
	frame:SetScript("OnUpdate", function(frame,elapsed)
		frame.elapsed = frame.elapsed + elapsed
		if(frame.elapsed >= 1) then
			RefreshDXEBars(DXEAlerts)
			frame.elapsed = 0
		end
	end)

	hooksecurefunc(DXEAlerts, "Simple", RefreshDXEBars)
	hooksecurefunc(DXEAlerts, "RefreshBars", RefreshDXEBars)

	DXE:LayoutHealthWatchers()
	DXE.Alerts:RefreshBars()

	if not DXEDB then DXEDB = {} end
	if not DXEDB["profiles"] then DXEDB["profiles"] = {} end
	if not DXEDB["profiles"][US.MyName.." - "..US.MyRealm] then DXEDB["profiles"][US.MyName.." - "..US.MyRealm] = {} end
	if not DXEDB["profiles"][US.MyName.." - "..US.MyRealm]["Globals"] then DXEDB["profiles"][US.MyName.." - "..US.MyRealm]["Globals"] = {} end
	DXEDB["profiles"][US.MyName.." - "..US.MyRealm]["Globals"]["BackgroundTexture"] = US.Blank
	DXEDB["profiles"][US.MyName.." - "..US.MyRealm]["Globals"]["BarTexture"] = US.NormTex
	DXEDB["profiles"][US.MyName.." - "..US.MyRealm]["Globals"]["Border"] = "None"
	DXEDB["profiles"][US.MyName.." - "..US.MyRealm]["Globals"]["Font"] = US.Font
	DXEDB["profiles"][US.MyName.." - "..US.MyRealm]["Globals"]["TimerFont"] = US.Font
end

US:RegisterSkin(name, US.SkinDXE)