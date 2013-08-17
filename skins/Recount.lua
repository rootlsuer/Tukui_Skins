if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'RecountSkin'
function AS:SkinRecount()
	local L = LibStub('AceLocale-3.0'):GetLocale('Recount')

	function Recount:ShowReset()
		AS:AcceptFrame(L['Reset Recount?'], function(self) Recount:ResetData() self:GetParent():Hide() end)
	end

	local function SkinFrame(frame)
		AS:SkinBackdropFrame(frame)
		frame.Backdrop:SetAllPoints()
		frame.Backdrop:SetPoint('TOPLEFT', frame, 'TOPLEFT', 0, -6)
		frame.CloseButton:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', -1, -9)
		frame:SetBackdrop(nil)
		frame.TitleBackground = CreateFrame('Frame', nil, frame)
		frame.TitleBackground:SetTemplate()
		frame.TitleBackground:SetPoint('TOP', frame, 'TOP', 0, -8)
		frame.TitleBackground:SetSize(frame:GetWidth() - 4, 22)
		frame.TitleBackground:SetFrameLevel(frame:GetFrameLevel())
		frame.Title:SetPoint('TOPLEFT', frame, 'TOPLEFT', 6, -12)
	end

	local RecountFrames = {
		Recount.MainWindow,
		Recount.ConfigWindow,
		Recount.GraphWindow,
		Recount.DetailWindow,
	}

	local RecountButtons = {
		Recount.MainWindow.CloseButton,
		Recount.MainWindow.ConfigButton,
		Recount.MainWindow.FileButton,
		Recount.MainWindow.LeftButton,
		Recount.MainWindow.ResetButton,
		Recount.MainWindow.ReportButton,
		Recount.MainWindow.RightButton,
		Recount.DetailWindow.CloseButton,
		Recount.DetailWindow.LeftButton,
		Recount.DetailWindow.ReportButton,
		Recount.DetailWindow.RightButton,
		Recount.DetailWindow.SummaryButton,
	}

	for _, frame in pairs(RecountFrames) do
		if frame then
			SkinFrame(frame)
		end
	end

	for _, button in pairs(RecountButtons) do
		if button then
			AS:Desaturate(button)
		end
	end

	AS:SkinScrollBar(Recount_MainWindow_ScrollBarScrollBar)

	hooksecurefunc(Recount, 'RefreshMainWindow', function()
	 	if not Recount.db.profile.MainWindow.ShowScrollbar then
			Recount_MainWindow_ScrollBarScrollBar:Hide()
		else
			Recount_MainWindow_ScrollBarScrollBar:Show()
		end
	end)

	hooksecurefunc(Recount, 'CreateFrame', function(frame) SkinFrame(frame) end)

	Recount.MainWindow.FileButton:HookScript('OnClick', function(self) if LibDropdownFrame0 then LibDropdownFrame0:SetTemplate() end end)

	hooksecurefunc(Recount, 'ShowReport', function(self)
		if Recount_ReportWindow.isSkinned then return end
		Recount_ReportWindow.isSkinned = true
		AS:SkinFrame(Recount_ReportWindow, 'Transparent')
		AS:SkinBackdropFrame(Recount_ReportWindow.Whisper)
		AS:SkinButton(Recount_ReportWindow.ReportButton)
		AS:SkinCloseButton(Recount_ReportWindow.CloseButton)
		AS:SkinSlideBar(Recount_ReportWindow_Slider, 8, true)
	end)
end

AS:RegisterSkin(name, AS.SkinRecount)