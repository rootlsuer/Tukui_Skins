if not(IsAddOnLoaded("ElvUI") or IsAddOnLoaded("Tukui")) or not IsAddOnLoaded("ChocolateBar") then return end
local U = unpack(select(2,...))
local name = "ChocolateBarSkin"
local function SkinCB(self)
		for i = 1, 20 do   	
		local f = _G["ChocolateBar"..i]
			if f then
				U.SkinFrameD(f)
			end
		end

		local BarOne = _G["ChocolateBar1"]
		BarOne:SetScript("OnUpdate", UpdateRepExpBar)

		local CB_Skin_OptionsFrame = CreateFrame("FRAME", "CB_Skin_OptionsFrame", UIParent)
		CB_Skin_OptionsFrame:SetMovable(true)
		CB_Skin_OptionsFrame:EnableMouse(true)
		CB_Skin_OptionsFrame:RegisterForDrag("LeftButton")
		CB_Skin_OptionsFrame:SetScript("OnDragStart", CB_Skin_OptionsFrame.StartMoving)
		CB_Skin_OptionsFrame:SetScript("OnDragStop", CB_Skin_OptionsFrame.StopMovingOrSizing)
		CB_Skin_OptionsFrame:SetSize(250)
		CB_Skin_OptionsFrame:SetPoint("CENTER", UIParent, "CENTER")
		CB_Skin_OptionsFrame:SetTemplate('Transparent')
		CB_Skin_OptionsFrame:Hide()

		CB_Skin_OptionsFrame.Title = CB_Skin_OptionsFrame:CreateFontString(nil, 'OVERLAY')
		CB_Skin_OptionsFrame.Title:SetFont([[Interface\AddOns\Tukui\medias\fonts\normal_font.ttf]], 17, nil)
		CB_Skin_OptionsFrame.Title:SetPoint("TOP", 0, -5)
		CB_Skin_OptionsFrame.Title:SetText("ChocolateBar Skin Options")
		CB_Skin_OptionsFrame.Title:SetTextColor(23/255, 132/255, 209/255)

		CB_Skin_OptionsFrame.btn2 = CreateFrame("BUTTON", "CB_Skin_CancelButton", CB_Skin_OptionsFrame, "UIPanelButtonTemplate")
		CB_Skin_OptionsFrame.btn2:SetWidth(80)
		CB_Skin_OptionsFrame.btn2:SetHeight(22)
		CB_Skin_OptionsFrame.btn2:SetText("Close")
		CB_Skin_OptionsFrame.btn2:SetPoint("BOTTOMRIGHT", CB_Skin_OptionsFrame, "BOTTOMRIGHT", -10, 10)
		CB_Skin_OptionsFrame.btn2:SetScript("OnClick", function() CB_Skin_OptionsFrame:Hide() end)
		CB_Skin_OptionsFrame.btn2:SetAlpha(1)
		CB_Skin_OptionsFrame.btn2:Show()

		CB_Skin_OptionsFrame.btn = CreateFrame("BUTTON", "CB_Skin_ReloadUIButton", CB_Skin_OptionsFrame, "UIPanelButtonTemplate")
		CB_Skin_OptionsFrame.btn:SetWidth(80)
		CB_Skin_OptionsFrame.btn:SetHeight(22)
		CB_Skin_OptionsFrame.btn:SetText("Reload")
		CB_Skin_OptionsFrame.btn:SetPoint("RIGHT", CB_Skin_CancelButton, "LEFT", -10, 0)
		CB_Skin_OptionsFrame.btn:SetScript("OnClick", function() ReloadUI() end)
		CB_Skin_OptionsFrame.btn:SetAlpha(1)
		CB_Skin_OptionsFrame.btn:Show()

		U.SkinButton(CB_Skin_OptionsFrame.btn)
		U.SkinButton(CB_Skin_OptionsFrame.btn2)

		local EnableBars = CreateFrame("CheckButton", "cbskin_checkbox", CB_Skin_OptionsFrame, "OptionsBaseCheckButtonTemplate")
		EnableBars:SetPoint("TOPLEFT", CB_Skin_OptionsFrame, "TOPLEFT", 16, -35)
		EnableBars.Title = EnableBars:CreateFontString(nil, 'OVERLAY')
		EnableBars.Title:SetFont([[Interface\AddOns\Tukui\medias\fonts\normal_font.ttf]], 12, nil)
		EnableBars.Title:SetPoint("LEFT", EnableBars, "RIGHT", 5, 0)
		EnableBars.Title:SetText("Enable Bar 2 and Bar 3 at top")
		U.SkinCheckBox(EnableBars)
		EnableBars:SetScript("OnClick" or "OnUpdate", function(frame)
				if frame:GetChecked() then
					if ChocolateBar2 and ChocolateBar3 then
							CBEnableSpecialBars = true
					else
						DEFAULT_CHAT_FRAME:AddMessage("|cff1784d1ElvUI|r CB Skin: You need to make sure you have created Bars 2 and 3.")
						RaidNotice_AddMessage(RaidWarningFrame, "You need to make sure you have created Bars 2 and 3.", ChatTypeInfo["RAID_WARNING"])
					end
				else
					CBEnableSpecialBars = nil
				end
			end)

local AceGUI = LibStub("AceGUI-3.0")		
	local slider = AceGUI:Create("Slider")
	slider.frame:SetParent("CB_Skin_OptionsFrame")
	slider:SetPoint("TOPLEFT", cbskin_checkbox, "BOTTOMLEFT", 0, -10)
	slider:SetLabel("Set Width of Bar 2 and 3.")
	slider:SetSliderValues(75,300,1)
	slider:SetCallback("OnValueChanged", function(self, value) CBBar2and3Width = self.value ChocolateBar3:SetWidth(CBBar2and3Width) ChocolateBar2:SetWidth(CBBar2and3Width)end)

	local slider2 = AceGUI:Create("Slider")
	slider2.frame:SetParent("CB_Skin_OptionsFrame")
	slider2:SetPoint("TOPLEFT", cbskin_checkbox, "BOTTOMLEFT", 0, -70)
	slider2:SetLabel("Set Position of Bar 2 and 3. from center")
	slider2:SetSliderValues(10,500,1)
	slider2:SetCallback("OnValueChanged", function(self, value) CBBar2and3Position = self.value local x = CBBar2and3Position local y = ChocolateBar1:GetHeight() + ChocolateBar2:GetHeight()/2 + 1 ChocolateBar2:SetPoint("TOPRIGHT", WorldFrame, "TOP", -x, -y) ChocolateBar3:SetPoint("TOPLEFT", WorldFrame, "TOP", x, -y) end)

	if CBEnableSpecialBars == true then
	if ChocolateBar2 and ChocolateBar3 then -- Do they really exist!

	if CBBar2and3Position == nil then
		x = WorldFrame:GetWidth()/5 
	else
		x = CBBar2and3Position
	end

	local y = ChocolateBar1:GetHeight() + ChocolateBar2:GetHeight()/2 + 1

	ChocolateBar2:SetFrameStrata("FULLSCREEN")
		if CBBar2and3Width == nil then 
			ChocolateBar2:SetWidth(125)
		else
			ChocolateBar2:SetWidth(CBBar2and3Width)
		end

		ChocolateBar2:SetHeight(23)
		ChocolateBar2:ClearAllPoints()
		ChocolateBar2:SetPoint("TOPRIGHT", WorldFrame, "TOP", -x, -y)
		ChocolateBar2:CreateShadow("Default")			
		ChocolateBar3:SetFrameStrata("FULLSCREEN")	
		if CBBar2and3Width == nil then 
			ChocolateBar3:SetWidth(125)
		else
			ChocolateBar3:SetWidth(CBBar2and3Width)
		end
		ChocolateBar3:SetHeight(23)
		ChocolateBar3:ClearAllPoints()
		ChocolateBar3:SetPoint("TOPLEFT", WorldFrame, "TOP", x, -y)
		ChocolateBar3:CreateShadow("Default")			

	local x = ChocolateBar2:GetWidth()/4

		cbBar2Left = CreateFrame('Frame', nil, ChocolateBar2)
		cbBar2Left:Point('BOTTOM', ChocolateBar2, 'TOP',-x,0)
		cbBar2Left:Width(2)
		cbBar2Left:Height(ChocolateBar2:GetHeight()/2)
		cbBar2Left:SetTemplate('Default')
		cbBar2Left:SetFrameLevel(ChocolateBar2:GetFrameLevel())

		cbBar2Right = CreateFrame('Frame', nil, ChocolateBar2)
		cbBar2Right:Point('BOTTOM', ChocolateBar2, 'TOP', x,0)
		cbBar2Right:Width(2)
		cbBar2Right:Height(ChocolateBar2:GetHeight()/2)
		cbBar2Right:SetTemplate('Default')	
		cbBar2Right:SetFrameLevel(ChocolateBar2:GetFrameLevel())

		cbBar3Left = CreateFrame('Frame', nil, ChocolateBar3)
		cbBar3Left:Point('BOTTOM', ChocolateBar3, 'TOP',-x,0)
		cbBar3Left:Width(2)
		cbBar3Left:Height(ChocolateBar3:GetHeight()/2)
		cbBar3Left:SetTemplate('Default')
		cbBar3Left:SetFrameLevel(ChocolateBar3:GetFrameLevel())

		cbBar3Right = CreateFrame('Frame', nil, ChocolateBar3)
		cbBar3Right:Point('BOTTOM', ChocolateBar3, 'TOP', x,0)
		cbBar3Right:Width(2)
		cbBar3Right:Height(ChocolateBar3:GetHeight()/2)
		cbBar3Right:SetTemplate('Default')	
		cbBar3Right:SetFrameLevel(ChocolateBar3:GetFrameLevel())
	end
end

	local cbskin = CreateFrame("Frame", "cbskin", CB_Skin_OptionsFrame)
		cbskin:SetScript("OnUpdate", function()
			if ChocolateBar2 and ChocolateBar3 then -- Do they really exist!
				cbskin_checkbox:SetChecked(CBEnableSpecialBars)
			else
				cbskin_checkbox:SetChecked(nil)
			end
			if CBBar2and3Width == nil then
				slider:SetValue(125)
			else
				slider:SetValue(CBBar2and3Width)
			end
			if CBBar2and3Position == nil then
				local x = WorldFrame:GetWidth()/5
				slider2:SetValue(x)
			else
				slider2:SetValue(CBBar2and3Position)
			end
	end)
	
	SLASH_CBSKIN1, SLASH_CBSKIN2 = '/cbskin', '/cbskin show'
	function SlashCmdList.CBSKIN(msg, editbox)
		CB_Skin_OptionsFrame:Show()
	end
end

U.RegisterSkin(name,SkinCB)
