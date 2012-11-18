-- Camealion's Functions File
-- Added ccolor for class coloring. - Azilroka
-- Restructured Functions file. - Azilroka
-- Added Skinning features for ease of skinning and smaller size skins. - Azilroka

local U = unpack(select(2,...))
local s = U.s
local c = U.c

function cUpdateColor(self)
	if UISkinOptions.ColorTemplate == "ClassColor" then
		--local color = RAID_CLASS_COLORS[U.ccolor]
		self:SetBackdropBorderColor(RAID_CLASS_COLORS[U.ccolor].r, RAID_CLASS_COLORS[U.ccolor].g, RAID_CLASS_COLORS[U.ccolor].b)
	else
		self:SetBackdropBorderColor(unpack(c["media"].bordercolor))
	end
end

function cColorScrollBar(self)
	if _G[self:GetName().."ScrollUpButton"] and _G[self:GetName().."ScrollDownButton"] then
		cUpdateColor(_G[self:GetName().."ScrollUpButton"])
		cUpdateColor(_G[self:GetName().."ScrollDownButton"])
		if UISkinOptions.ColorTemplate == "ClassColor" then
			local color = RAID_CLASS_COLORS[U.ccolor]
			_G[self:GetName().."ScrollUpButton"].texture:SetVertexColor(color.r, color.g, color.b)
			_G[self:GetName().."ScrollDownButton"].texture:SetVertexColor(color.r, color.g, color.b)
		else
			_G[self:GetName().."ScrollUpButton"].texture:SetVertexColor(unpack(c["media"].bordercolor))
			_G[self:GetName().."ScrollDownButton"].texture:SetVertexColor(unpack(c["media"].bordercolor))
		end
	end
	if self.trackbg then cUpdateColor(self.trackbg) end
	if self.thumbbg then cUpdateColor(self.thumbbg) end
end

function cColorSlideBar(self)
	cUpdateColor(self)
	if UISkinOptions.ColorTemplate == "ClassColor" then
		local color = RAID_CLASS_COLORS[U.ccolor]
		self:GetThumbTexture():SetVertexColor(color.r, color.g, color.b)
	else
		self:GetThumbTexture():SetVertexColor(unpack(c["media"].bordercolor))
	end
end

local function cSkinButton(self,strip)
	self:SkinButton(strip)
	cUpdateColor(self)
	self:HookScript("OnEnter", TSSetModifiedBackdrop)
	self:HookScript("OnLeave", TSSetOriginalBackdrop)
end

U.SkinButton = cSkinButton

local function cSkinScrollBar(self)
	self:SkinScrollBar()
	cColorScrollBar(self)
end

U.SkinScrollBar = cSkinScrollBar

local function cSkinTab(self, strip, hook)
	if strip then self:StripTextures(True) end
	self:SkinTab()
	cUpdateColor(self.backdrop)
	self:HookScript("OnEnter", TSSetModifiedBackdrop)
	self:HookScript("OnLeave", TSSetOriginalBackdrop)
end

U.SkinTab = cSkinTab

local function cSkinNextPrevButton(self, horizonal)
	self:SkinNextPrevButton(horizonal)
	cUpdateColor(self)
end

U.SkinNextPrevButton = cSkinNextPrevButton

local function cSkinRotateButton(self)
	self:SkinRotateButton()
	cUpdateColor(self)
end

U.SkinRotateButton = cSkinRotateButton

local function cSkinEditBox(self, width, height)
	self:SkinEditBox()
	if width then self:SetWidth(width) end
	if height then self:SetHeight(height) end
	cUpdateColor(self.backdrop)
end

U.SkinEditBox = cSkinEditBox

local function cSkinDropDownBox(self, width)
	self:SkinDropDownBox(width)
	cUpdateColor(self.backdrop)
	local button = _G[self:GetName().."Button"]
	cUpdateColor(button)
end

U.SkinDropDownBox = cSkinDropDownBox

local function cSkinCheckBox(self)
	self:SkinCheckBox()
	cUpdateColor(self.backdrop)
end

U.SkinCheckBox = cSkinCheckBox

local function cSkinCloseButton(self)
	self:SkinCloseButton()
end

U.SkinCloseButton = cSkinCloseButton

local function cSkinSlideBar(self, height, movetext)
	self:SkinSlideBar(height, movetext)
	cColorSlideBar(self)
end

U.SkinSlideBar = cSkinSlideBar

function cRegisterForPetBattleHide(frame)
	if frame.IsVisible and frame:GetName() then
		U.FrameLocks[frame:GetName()] = { shown = false }
	end
end

local function cSkinFrame(self, overridestrip)
	if not overridestrip then self:StripTextures(True) end
	self:SetTemplate("Transparent")
	cUpdateColor(self)
end

U.SkinFrame = cSkinFrame

local function cSkinFrameD(self, overridestrip)
	if not overridestrip then self:StripTextures(True) end
	self:SetTemplate()
	cUpdateColor(self)
end

U.SkinFrameD = cSkinFrameD

local function cSkinBackdropFrame(self, strip, icon)
	if strip then self:StripTextures(True) end
	if not icon then self:CreateBackdrop() cUpdateColor(self.backdrop) end
	if icon then
		if self.icon then self.icon:SetTexCoord(0.12, 0.88, 0.12, 0.88) end
		if _G[self:GetName().."_Background"] then _G[self:GetName().."_Background"]:SetTexCoord(0.12, 0.88, 0.12, 0.88) end
	end
end

U.SkinBackdropFrame = cSkinBackdropFrame

local function cSkinStatusBar(self, ClassColor)
	local s = U.s
	local c = U.c
	self:StripTextures(True)
	self:CreateBackdrop()
	print(self)
	tinsert(U.ColorBackdrop, self:GetName()..".backdrop")
	cUpdateColor(self.backdrop)
	self:SetStatusBarTexture(c["media"].normTex)
	if ClassColor then
		local color = RAID_CLASS_COLORS[U.ccolor]
		self:SetStatusBarColor(color.r, color.g, color.b)
	end
end

U.SkinStatusBar = cSkinStatusBar

local function cDesaturate(f, point)
	for i=1, f:GetNumRegions() do
		local region = select(i, f:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetDesaturated(1)
			if region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Corner" then
				region:Kill()
			end
		end
	end	

	if point then
		f:Point("TOPRIGHT", point, "TOPRIGHT", 2, 2)
	end
end

U.Desaturate = cDesaturate

local function cCheckOption(optionName,...)
	for i = 1,select('#',...) do
		local addon = select(i,...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	return UISkinOptions[optionName] == "Enabled"
end

U.CheckOption = cCheckOption

local function cDisableOption(optionName)
	UISkinOptions[optionName] = "Disabled"
end

U.DisableOption = cDisableOption

local function cEnableOption(optionName)
	UISkinOptions[optionName] = "Enabled"
end

U.EnableOption = cEnableOption

local function cToggleOption(optionName)
	if cCheckOption(optionName) then
		cDisableOption(optionName)
	else
		cEnableOption(optionName)
	end
end

U.ToggleOption = cToggleOption

local function cRegisterSkin(skinName,skinFunc,...)
	local XS = U.x
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

U.RegisterSkin = cRegisterSkin

local function cUnregisterEvent(skinName,frame,event)
	local XS = U.x
	XS:UnregisterEvent(skinName,event)
end

U.UnregisterEvent = cUnregisterEvent

function cAddNonPetBattleFrames()
	for frame,data in pairs(U.FrameLocks) do
		if data.shown then
			_G[frame]:Show()
		end
	end
end

U.AddNonPetBattleFrames = cAddNonPetBattleFrames

function cRemoveNonPetBattleFrames()
	for frame,data in pairs(U.FrameLocks) do
		if(_G[frame]:IsVisible()) then
			data.shown = true
			_G[frame]:Hide()
		else
			data.shown = false
		end
	end
end

U.RemoveNonPetBattleFrames = cRemoveNonPetBattleFrames

--Add time before calling a function
local waitTable = {}
local waitFrame
function cDelay(delay, func, ...)
	if(type(delay)~="number" or type(func)~="function") then
		return false
	end
	if(waitFrame == nil) then
		waitFrame = CreateFrame("Frame","WaitFrame", UIParent)
		waitFrame:SetScript("onUpdate",function (self,elapse)
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

function TSSetModifiedBackdrop(self)
	local color = RAID_CLASS_COLORS[U.ccolor]
	self:SetBackdropBorderColor(color.r, color.g, color.b)
end

function TSSetOriginalBackdrop(self)
	local color = RAID_CLASS_COLORS[U.ccolor]
	if UISkinOptions.ColorTemplate == "ClassColor" then
		self:SetBackdropBorderColor(color.r, color.g, color.b)
	else
		self:SetBackdropBorderColor(unpack(c["media"].bordercolor))
	end
end