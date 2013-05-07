if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))
local debug = true

function US:Round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

function US:SkinButton(self, strip)
	if not debug then
		if self == nil then return end
	end
	self:SkinButton(strip)
end

function US:SkinScrollBar(self)
	if not debug then
		if self == nil then return end
	end
	self:SkinScrollBar()
end

function US:SkinTab(self, strip)
	if not debug then
		if self == nil then return end
	end
	if strip then self:StripTextures(true) end
	self:SkinTab()
end

function US:SkinNextPrevButton(self, horizonal)
	if not debug then
		if self == nil then return end
	end
	self:SkinNextPrevButton(horizonal)
end

function US:SkinRotateButton(self)
	if not debug then
		if self == nil then return end
	end
	self:SkinRotateButton()
end

function US:SkinEditBox(self, width, height)
	if not debug then
		if self == nil then return end
	end
	self:SkinEditBox()
	if width then self:SetWidth(width) end
	if height then self:SetHeight(height) end
end

function US:SkinDropDownBox(self, width)
	if not debug then
		if self == nil then return end
	end
	self:SkinDropDownBox(width)
end

function US:SkinCheckBox(self)
	if not debug then
		if self == nil then return end
	end
	self:SkinCheckBox()
end

function US:SkinCloseButton(self)
	if not debug then
		if self == nil then return end
	end
	self:SkinCloseButton()
end

function US:SkinSlideBar(self, height, movetext)
	if not debug then
		if self == nil then return end
	end
	self:SkinSlideBar(height, movetext)
end

function US:RegisterForPetBattleHide(frame)
	if frame.IsVisible and frame:GetName() then
		US.FrameLocks[frame:GetName()] = { shown = false }
	end
end

function US:SkinFrame(self, template, overridestrip)
	if not debug then
		if self == nil then return end
	end
	if not template then template = "Transparent" end
	if not overridestrip then self:StripTextures(true) end
	self:SetTemplate(template)
end

function US:SkinBackdropFrame(self, strip, icon)
	if not debug then
		if self == nil then return end
	end
	if strip then self:StripTextures(true) end
	if not icon then
		self:CreateBackdrop()
	else
		if self.icon then self.icon:SetTexCoord(0.12, 0.88, 0.12, 0.88) end
		if _G[self:GetName().."_Background"] then _G[self:GetName().."_Background"]:SetTexCoord(0.12, 0.88, 0.12, 0.88) end
	end
end

function US:SkinStatusBar(self, ClassColor)
	if not debug then
		if self == nil then return end
	end
	US:SkinBackdropFrame(self, true)
	self:SetStatusBarTexture(US.NormTex)
	if ClassColor then
		local color = RAID_CLASS_COLORS[US.MyClass]
		self:SetStatusBarColor(color.r, color.g, color.b)
	end
end

function US:SkinTooltip(tooltip, scale)
	if not debug then
		if tooltip == nil then return end
	end
	tooltip:HookScript("OnShow", function(self)
		self:SetTemplate("Transparent")
		if scale then self:SetScale(US.UIScale) end
	end)
end

function US:SkinTexture(self)
	if not debug then
		if self == nil then return end
	end
	self:SetTexCoord(0.12, 0.88, 0.12, 0.88)
end

function US:SkinIconButton(self, strip, style, shrinkIcon)
	if not debug then
		if self == nil then return end
	end
	if self.isSkinned then return end

	if strip then self:StripTextures() end
	self:CreateBackdrop("Default", true)
	if style then self:StyleButton() end

	local icon = self.icon
	if self:GetName() and _G[self:GetName().."IconTexture"] then
		icon = _G[self:GetName().."IconTexture"]
	elseif self:GetName() and _G[self:GetName().."Icon"] then
		icon = _G[self:GetName().."Icon"]
	end

	if icon then
		icon:SetTexCoord(.08,.88,.08,.88)

		if shrinkIcon then
			self.Backdrop:SetAllPoints()
			icon:SetInside(self)
		else
			self.Backdrop:SetOutside(icon)
		end
		icon:SetParent(self.Backdrop)
	end
	self.isSkinned = true
end

function US:Desaturate(self, point)
	if not debug then
		if self == nil then return end
	end
	for i = 1, self:GetNumRegions() do
		local region = select(i, self:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetDesaturated(1)
			if region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Corner" then
				region:Kill()
			end
		end
	end	

	if point then
		self:Point("TOPRIGHT", point, "TOPRIGHT", 2, 2)
	end
end

function US:CheckOption(optionName,...)
	for i = 1,select('#',...) do
		local addon = select(i,...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	return UISkinOptions[optionName]
end

function US:DisableOption(optionName)
	UISkinOptions[optionName] = false
end

function US:EnableOption(optionName)
	UISkinOptions[optionName] = true
end

function US:ToggleOption(optionName)
	if US:CheckOption(optionName) then
		US:DisableOption(optionName)
	else
		US:EnableOption(optionName)
	end
end

function US:RegisterSkin(skinName,skinFunc,...)
	local XS = US.x
	local events = {}
	for i = 1,select('#',...) do
		local event = select(i,...)
		if not event then break end
		events[event] = true
	end
	local registerMe = { func = skinFunc, events = events }
	if not XS.register[skinName] then XS.register[skinName] = {} end
	XS.register[skinName][skinFunc] = registerMe
end

function US:UnregisterEvent(skinName,frame,event)
	local XS = US.x
	XS:UnregisterEvent(skinName,event)
end

function US:AddNonPetBattleFrames()
	for frame,data in pairs(US.FrameLocks) do
		if data.shown then
			_G[frame]:Show()
		end
	end
end

function US:RemoveNonPetBattleFrames()
	for frame,data in pairs(US.FrameLocks) do
		if _G[frame]:IsVisible() then
			data.shown = true
			_G[frame]:Hide()
		else
			data.shown = false
		end
	end
end

local waitTable = {}
local waitFrame
function US:Delay(delay, func, ...)
	if(type(delay)~="number" or type(func)~="function") then
		return false
	end
	if(waitFrame == nil) then
		waitFrame = CreateFrame("Frame")
		waitFrame:SetScript("OnUpdate",function (self,elapse)
			local count = #waitTable
			local i = 1
			while(i<=count) do
				local waitRecord = tremove(waitTable,i)
				local d = tremove(waitRecord,1)
				local f = tremove(waitRecord,1)
				local p = tremove(waitRecord,1)
				if(d>elapse) then
				  tinsert(waitTable,i,{d-elapse,f,p})
				  i = i + 1
				else
				  count = count - 1
				  f(unpack(p))
				end
			end
		end)
	end
	tinsert(waitTable,{delay,func,{...}})
	return true
end