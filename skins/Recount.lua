if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = "RecountSkin"
function AS:SkinRecount()
	local Recount = _G.Recount	

	local function SkinFrame(frame)
		frame.bgMain = CreateFrame("Frame", nil, frame)
		AS:SkinFrame(frame.bgMain, "Default")
		frame.bgMain:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
		frame.bgMain:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
		frame.bgMain:SetPoint("TOP", frame, "TOP", 0, -30)
		frame.bgMain:SetFrameLevel(frame:GetFrameLevel())
		frame.CloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -9)
		frame:SetBackdrop(nil)
		frame.TitleBackground = CreateFrame("Frame", nil, frame)
		frame.TitleBackground:SetPoint("TOP", frame, "TOP", 0, -7)
		frame.TitleBackground:SetPoint("LEFT", 0)
		frame.TitleBackground:SetPoint("RIGHT", 0)
		frame.TitleBackground:SetHeight(22)
		AS:SkinFrame(frame.TitleBackground, "Default")
		frame.Title:SetParent(frame.TitleBackground)
		frame.Title:ClearAllPoints()
		frame.Title:SetPoint("LEFT", 4, 0)
	end

	if Recount.MainWindow then SkinFrame(Recount.MainWindow) Recount.MainWindow:SetFrameStrata("MEDIUM") end
	if Recount.ConfigWindow then SkinFrame(Recount.ConfigWindow) end
	if Recount.GraphWindow then SkinFrame(Recount.GraphWindow) end
	if Recount.DetailWindow then SkinFrame(Recount.DetailWindow) end
	if Recount.ResetFrame then SkinFrame(Recount.ResetFrame) end
	if _G["Recount_Realtime_!RAID_DAMAGE"] then SkinFrame(_G["Recount_Realtime_!RAID_DAMAGE"].Window) end
	if _G["Recount_Realtime_!RAID_HEALING"] then SkinFrame(_G["Recount_Realtime_!RAID_HEALING"].Window) end
	if _G["Recount_Realtime_!RAID_HEALINGTAKEN"] then SkinFrame(_G["Recount_Realtime_!RAID_HEALINGTAKEN"].Window) end
	if _G["Recount_Realtime_!RAID_DAMAGETAKEN"] then SkinFrame(_G["Recount_Realtime_!RAID_DAMAGETAKEN"].Window) end
	if _G["Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH"] then SkinFrame(_G["Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH"].Window) end
	if _G["Recount_Realtime_FPS_FPS"] then SkinFrame(_G["Recount_Realtime_FPS_FPS"].Window) end
	if _G["Recount_Realtime_Latency_LAG"] then SkinFrame(_G["Recount_Realtime_Latency_LAG"].Window) end
	if _G["Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC"] then SkinFrame(_G["Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC"].Window) end
	if _G["Recount_Realtime_Upstream Traffic_UP_TRAFFIC"] then SkinFrame(_G["Recount_Realtime_Upstream Traffic_UP_TRAFFIC"].Window) end
	if not AS:CheckOption("RecountBackdrop") then Recount.MainWindow.bgMain:Hide() end
	Recount:UpdateBarTextures()

	AS:SkinScrollBar(Recount_MainWindow_ScrollBarScrollBar)
	hooksecurefunc(Recount,"RefreshMainWindow",function(self,datarefresh)
	 	if not Recount.db.profile.MainWindow.ShowScrollbar then
			Recount_MainWindow_ScrollBarScrollBar:Hide()
		else
			Recount_MainWindow_ScrollBarScrollBar:Show()
		end
	end)

	Recount.MainWindow.FileButton:HookScript("OnClick", function(self) if LibDropdownFrame0 then LibDropdownFrame0:SetTemplate() end end)

	local ReportSkinned = false
	hooksecurefunc(Recount, 'ShowReport', function(self)
		if ReportSkinned then return end
		ReportSkinned = true
		AS:SkinFrame(Recount_ReportWindow, 'Transparent')
		Recount_ReportWindow.Whisper:StripTextures()
		Recount_ReportWindow.Whisper:CreateBackdrop()
		AS:SkinButton(Recount_ReportWindow.ReportButton)
		AS:SkinCloseButton(Recount_ReportWindow.CloseButton)
		AS:SkinSlideBar(Recount_ReportWindow_Slider, 8, true)
	end)

	local MWbuttons = {
		Recount.MainWindow.CloseButton,
		Recount.MainWindow.RightButton,
		Recount.MainWindow.LeftButton,
		Recount.MainWindow.ResetButton,
		Recount.MainWindow.FileButton,
		Recount.MainWindow.ConfigButton,
		Recount.MainWindow.ReportButton,
		Recount.DetailWindow.ReportButton,
		Recount.DetailWindow.LeftButton,
		Recount.DetailWindow.RightButton,
		Recount.DetailWindow.SummaryButton,
		Recount.DetailWindow.CloseButton,
	}

	for _, button in pairs(MWbuttons) do
		if button then
			if button:GetNormalTexture() then
				button:GetNormalTexture():SetDesaturated(true)
			end
			if button:GetHighlightTexture() then
				button:GetHighlightTexture():SetDesaturated(true)
			end
		end
	end

	local ResetFrame = CreateFrame("Frame", nil, UIParent)
	ResetFrame:SetTemplate("Transparent")
	ResetFrame:SetSize(250, 70)
	ResetFrame:SetPoint("CENTER", UIParent, "CENTER")
	ResetFrame:SetFrameStrata("DIALOG")
	ResetFrame:Hide()
	ResetFrame:FontString("text", AS.PixelFont, 14) --"MONOCHROMEOUTLINE"
	ResetFrame.text:SetPoint("TOP", ResetFrame, "TOP", 0, -10)
	ResetFrame.text:SetText("Do you want to reset Recount?")

	local ResetAccept = CreateFrame("Button", nil, ResetFrame)
	AS:SkinButton(ResetAccept)
	ResetAccept:SetSize(70, 25)
	ResetAccept:SetPoint("RIGHT", ResetFrame, "BOTTOM", -1, 20)
	ResetAccept:SetScript("OnClick", function(self) Recount:ResetData() self:GetParent():Hide() end)
	ResetAccept:FontString("text", AS.PixelFont, 14) --"MONOCHROMEOUTLINE"
	ResetAccept.text:SetPoint("CENTER")
	ResetAccept.text:SetText(YES)

	local ResetClose = CreateFrame("Button", nil, ResetFrame)
	AS:SkinButton(ResetClose)
	ResetClose:SetSize(70, 25)
	ResetClose:SetPoint("LEFT", ResetFrame, "BOTTOM", 1, 20)
	ResetClose:SetScript("OnClick", function(self) self:GetParent():Hide() end)
	ResetClose:FontString("text", AS.PixelFont, 14) --"MONOCHROMEOUTLINE"
	ResetClose.text:SetPoint("CENTER")
	ResetClose.text:SetText(NO)

	function Recount:ShowReset()
		ResetFrame:Show()
	end
end

AS:RegisterSkin(name, AS.SkinRecount)