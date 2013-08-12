if Tukui and tonumber(GetAddOnMetadata('Tukui', 'Version')) < 16 then return end

local DataText = AS["DataTexts"]

local Update = function(self)
	local Text = ''
	if AS:CheckOption('EmbedRecount', 'Recount') then Text = 'Recount' end
	if AS:CheckOption('EmbedRO', 'Recount', 'Omen') then Text = 'Recount/Omen' end
	if AS:CheckOption('EmbedSkada', 'Skada') then Text = 'Skada' end
	if AS:CheckOption('EmbedOmen', 'Omen') then Text = 'Omen' end
	if AS:CheckOption('EmbedTDPS', 'TinyDPS') then Text = 'TinyDPS' end
	self.Text:SetText(format('%s %s', L.DataText.Toggle, Text))
end

local function OnClick(self, button)
	if button == 'LeftButton' then
		AS:EmbedShow()
	elseif button == 'RightButton' then
		AS:EmbedHide()
	end
end

local function OnEnter(self)
	local Panel, Anchor, xOff, yOff = self:GetTooltipAnchor()
	GameTooltip:SetOwner(Panel, Anchor, xOff, yOff)
	GameTooltip:ClearLines()
	GameTooltip:AddLine('Left Click to Show')
	GameTooltip:AddLine('Right Click to Hide')
	GameTooltip:Show()
	self:Update()
end

local Enable = function(self)
	if (not self.Text) then
		local Text = self:CreateFontString(nil, 'OVERLAY')
		Text:SetFont(DataText.Font, DataText.Size, DataText.Flags)

		self.Text = Text
	end

	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:SetScript('OnEvent', Update)
	self:SetScript('OnEnter', OnEnter)
	self:SetScript('OnLeave', GameTooltip_Hide)
	self:Update()
end

local Disable = function(self)
	self.Text:SetText('')
	self:SetScript('OnEvent', nil)
	self:UnregisterAllEvents()
end

DataText:Register('EmbedSystem', Enable, Disable, Update)