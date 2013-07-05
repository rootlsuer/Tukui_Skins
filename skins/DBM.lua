if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "DBMSkin"
function AS:SkinDBM(event, addon)
	if event == "PLAYER_ENTERING_WORLD" then
		local croprwicons = true
		local buttonsize = 22
		local function SkinBars(self)
			for bar in self:GetBarIterator() do
				if not bar.injected then
					bar.ApplyStyle = function()
						local frame = bar.frame
						local tbar = _G[frame:GetName().."Bar"]
						local spark = _G[frame:GetName().."BarSpark"]
						local texture = _G[frame:GetName().."BarTexture"]
						local icon1 = _G[frame:GetName().."BarIcon1"]
						local icon2 = _G[frame:GetName().."BarIcon2"]
						local name = _G[frame:GetName().."BarName"]
						local timer = _G[frame:GetName().."BarTimer"]

						if not frame.styled then
							icon1.backdrop = CreateFrame("Frame", nil, tbar)
							icon1.backdrop:SetTemplate()
							icon1.backdrop:SetBackdropColor(0,0,0,0)
							icon1.backdrop:Size(buttonsize)
							icon1.backdrop:Point("BOTTOMRIGHT", frame, "BOTTOMLEFT", -3, 0)
							icon1:SetTexCoord(0.08, 0.92, 0.08, 0.92)
							icon1:ClearAllPoints()
							icon1:SetInside(icon1.backdrop, 1, 1)
							icon1:SetDrawLayer("OVERLAY")

							icon2.backdrop = CreateFrame("Frame", nil, tbar)
							icon2.backdrop:SetTemplate()
							icon2.backdrop:SetBackdropColor(0,0,0,0)
							icon2.backdrop:Size(buttonsize)
							icon2.backdrop:Point("BOTTOMLEFT", frame, "BOTTOMRIGHT", 3, 0)
							icon2:SetTexCoord(0.08, 0.92, 0.08, 0.92)
							icon2:ClearAllPoints()
							icon2:SetInside(icon2.backdrop, 1, 1)
							icon2:SetDrawLayer("OVERLAY")
							if bar.color then
								tbar:SetStatusBarColor(bar.color.r, bar.color.g, bar.color.b)
							else
								tbar:SetStatusBarColor(bar.owner.options.StartColorR, bar.owner.options.StartColorG, bar.owner.options.StartColorB)
							end

							if bar.enlarged then
								frame:Width(bar.owner.options.HugeWidth)
								tbar:Width(bar.owner.options.HugeWidth)
							else
								frame:SetWidth(bar.owner.options.Width)
								tbar:SetWidth(bar.owner.options.Width)
							end

							AS:SkinFrame(frame)
							spark:SetAlpha(0)
							spark:SetTexture(nil)
							texture:SetTexture(AS.NormTex)
							tbar:SetStatusBarTexture(AS.NormTex)
							tbar:SetInside(frame)
							name:ClearAllPoints()
							name:SetWidth(165)
							name:SetHeight(8)
							name:SetFont(DBT_SavedOptions["DBM"].Font, 12, "OUTLINE")
							name:SetJustifyH("LEFT")
							name:SetShadowColor(0, 0, 0, 0)
							name.SetFont = AS.Noop
							timer:ClearAllPoints()
							timer:SetFont(DBT_SavedOptions["DBM"].Font, 12, "OUTLINE")
							timer:SetJustifyH("RIGHT")
							timer:SetShadowColor(0, 0, 0, 0)
							timer.SetFont = AS.Noop
							tbar:SetAlpha(1)
							frame:SetAlpha(1)
							texture:SetAlpha(1)
							frame:Show()
							bar:Update(0)
							if AS:CheckOption("DBMSkinHalf") then
								frame:SetHeight(buttonsize/3)
								name:Point("BOTTOMLEFT", frame, "TOPLEFT", 0, 4)
								timer:Point("BOTTOMRIGHT", frame, "TOPRIGHT", -1, 2)
							else
								frame:SetHeight(buttonsize)
								name:Point("LEFT", frame, "LEFT", 4, 0)
								timer:Point("RIGHT", frame, "RIGHT", -4, 0)
							end
							frame.styled = true
							bar.injected = true
						end
					end
					bar:ApplyStyle()
				end
			end
		end

		local SkinBossTitle = function()
			local anchor = DBMBossHealthDropdown:GetParent()
			if not anchor.styled then
				local header={anchor:GetRegions()}
					if header[1]:IsObjectType("FontString") then
						header[1]:SetFont(DBT_SavedOptions["DBM"].Font, 12, "OUTLINE")
						header[1]:SetTextColor(1,1,1,1)
						header[1]:SetShadowColor(0, 0, 0, 0)
						anchor.styled = true	
					end
				header = nil
			end
			anchor = nil
		end

		local SkinBoss = function()
			local count = 1
			while (_G[format("DBM_BossHealth_Bar_%d", count)]) do
				local bar = _G[format("DBM_BossHealth_Bar_%d", count)]
				local background = _G[bar:GetName().."BarBorder"]
				local progress = _G[bar:GetName().."Bar"]
				local name = _G[bar:GetName().."BarName"]
				local timer = _G[bar:GetName().."BarTimer"]
				local prev = _G[format("DBM_BossHealth_Bar_%d", count-1)]	

				if (count == 1) then
					local	_, anch, _ ,_, _ = bar:GetPoint()
					bar:ClearAllPoints()
					if DBM_SavedOptions.HealthFrameGrowUp then
						bar:Point("BOTTOM", anch, "TOP" , 0 , 12)
					else
						bar:Point("TOP", anch, "BOTTOM" , 0, -buttonsize)
					end
				else
					bar:ClearAllPoints()
					if DBM_SavedOptions.HealthFrameGrowUp then
						bar:Point("TOPLEFT", prev, "TOPLEFT", 0, buttonsize+4)
					else
						bar:Point("TOPLEFT", prev, "TOPLEFT", 0, -(buttonsize+4))
					end
				end

				if not bar.styled then
					bar:SetHeight(buttonsize)
					if AS:CheckOption("DBMSkinHalf") then bar:SetHeight(buttonsize/3) end
					AS:SkinFrame(bar)
					background:SetNormalTexture(nil)
					bar.styled = true
				end	

				if not progress.styled then
					progress:SetStatusBarTexture(AS.NormTex)
					progress.styled = true
				end				
				progress:ClearAllPoints()
				progress:Point("TOPLEFT", bar, "TOPLEFT", 2, -2)
				progress:Point("BOTTOMRIGHT", bar, "BOTTOMRIGHT", -2, 2)

				if not name.styled then
					name:ClearAllPoints()
					name:Point("LEFT", bar, "LEFT", 4, 0)
					if AS:CheckOption("DBMSkinHalf") then name:Point("BOTTOMLEFT", bar, "TOPLEFT", 1, 4) end
					name:SetFont(DBT_SavedOptions["DBM"].Font, 12, "OUTLINE")
					name:SetJustifyH("LEFT")
					name:SetShadowColor(0, 0, 0, 0)
					name.styled = true
				end

				if not timer.styled then
					timer:ClearAllPoints()
					timer:Point("RIGHT", bar, "RIGHT", -4, 0)
					if AS:CheckOption("DBMSkinHalf") then timer:Point("BOTTOMLEFT", bar, "TOPLEFT", 0, 2) end
					timer:SetFont(DBT_SavedOptions["DBM"].Font, 12, "OUTLINE")
					timer:SetJustifyH("RIGHT")
					timer:SetShadowColor(0, 0, 0, 0)
					timer.styled = true
				end
				count = count + 1
			end
		end

		hooksecurefunc(DBT, "CreateBar", SkinBars)
		hooksecurefunc(DBM.BossHealth, "Show", SkinBossTitle)
		hooksecurefunc(DBM.BossHealth, "AddBoss", SkinBoss)
		hooksecurefunc(DBM.BossHealth, "UpdateSettings", SkinBoss)
		if not DBM_SavedOptions["DontShowRangeFrame"] then
			DBM.RangeCheck:Show()
			DBM.RangeCheck:Hide()
			DBMRangeCheck:HookScript("OnShow",function(self) self:SetTemplate("Transparent") end)
			DBMRangeCheckRadar:SetTemplate("Transparent")
		end
		if not DBM_SavedOptions["DontShowInfoFrame"] then
			DBM.InfoFrame:Show(5, "test")
			DBM.InfoFrame:Hide()
			DBMInfoFrame:HookScript("OnShow",function(self) self:SetTemplate("Transparent") end)
		end
		if croprwicons then
			local RaidNotice_AddMessage_ = RaidNotice_AddMessage
			RaidNotice_AddMessage = function(noticeFrame, textString, colorInfo)
				if textString:find(" |T") then
					textString = string.gsub(textString,"(:12:12)",":20:20:0:0:64:64:4:60:4:60")
				end
				return RaidNotice_AddMessage_(noticeFrame, textString, colorInfo)
			end
		end
		DBM_SavedOptions.Enabled = true
		DBT_SavedOptions["DBM"].Texture = AS.NormTex
		DBT_SavedOptions["DBM"].Font = AS.Font
	end

	if addon == "DBM-GUI" then
		DBM_GUI_OptionsFrame:HookScript("OnShow", function()
			AS:SkinFrame(DBM_GUI_OptionsFrame)
			AS:SkinFrame(DBM_GUI_OptionsFrameBossMods)
			AS:SkinFrame(DBM_GUI_OptionsFrameDBMOptions)
			AS:SkinFrame(DBM_GUI_OptionsFramePanelContainer)
		end)
		AS:SkinTab(DBM_GUI_OptionsFrameTab1)
		AS:SkinTab(DBM_GUI_OptionsFrameTab2)
		AS:SkinButton(DBM_GUI_OptionsFrameOkay, true)	
		AS:SkinScrollBar(DBM_GUI_OptionsFramePanelContainerFOVScrollBar)
		AS:UnregisterEvent(name, event)
	end
end

AS:RegisterSkin(name, AS.SkinDBM, "ADDON_LOADED")