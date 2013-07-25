if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local pairs, sort, tinsert, tremove, unpack, floor = pairs, sort, tinsert, tremove, unpack, floor

local function orderednext(t, n)
	local key = t[t.__next]
	if not key then return end
	t.__next = t.__next + 1
	return key, t.__source[key]
end

function AS:OrderedPairs(t, f)
	local keys, kn = {__source = t, __next = 1}, 1
	for k in pairs(t) do
		keys[kn], kn = k, kn + 1
	end
	sort(keys, f)
	return orderednext, keys
end

function AS:Round(num, idp)
	local mult = 10^(idp or 0)
	return floor(num * mult + 0.5) / mult
end

function AS:SkinButton(frame, strip)
	frame:SkinButton(strip)
end

function AS:SkinScrollBar(frame)
	frame:SkinScrollBar()
end

function AS:SkinTab(frame, strip)
	if strip then frame:StripTextures(true) end
	frame:SkinTab()
end

function AS:SkinNextPrevButton(frame, horizonal)
	frame:SkinNextPrevButton(horizonal)
end

function AS:SkinRotateButton(frame)
	frame:SkinRotateButton()
end

function AS:SkinEditBox(frame, width, height)
	frame:SkinEditBox()
	if width then frame:SetWidth(width) end
	if height then frame:SetHeight(height) end
end

function AS:SkinDropDownBox(frame, width)
	frame:SkinDropDownBox(width)
end

function AS:SkinCheckBox(frame)
	frame:SkinCheckBox()
end

function AS:SkinCloseButton(frame, point)
	frame:SkinCloseButton(point)
end

function AS:SkinSlideBar(frame, height, movetext)
	frame:SkinSlideBar(height, movetext)
end

function AS:RegisterForPetBattleHide(frame)
	if frame.IsVisible and frame:GetName() then
		AS.FrameLocks[frame:GetName()] = { shown = false }
	end
end

function AS:SkinFrame(frame, template, overridestrip)
	if not template then template = "Transparent" end
	if not overridestrip then frame:StripTextures(true) end
	frame:SetTemplate(template)
end

function AS:SkinBackdropFrame(frame, strip, icon)
	if strip then frame:StripTextures(true) end
	if not icon then
		frame:CreateBackdrop()
	else
		if frame.icon then frame.icon:SetTexCoord(0.12, 0.88, 0.12, 0.88) end
		if _G[frame:GetName().."_Background"] then _G[frame:GetName().."_Background"]:SetTexCoord(0.12, 0.88, 0.12, 0.88) end
	end
end

function AS:SkinStatusBar(frame, ClassColor)
	AS:SkinBackdropFrame(frame, true)
	frame:SetStatusBarTexture(AS.NormTex)
	if ClassColor then
		local color = RAID_CLASS_COLORS[AS.MyClass]
		frame:SetStatusBarColor(color.r, color.g, color.b)
	end
end

function AS:SkinTooltip(tooltip, scale)
	tooltip:HookScript("OnShow", function(frame)
		frame:SetTemplate("Transparent")
		if scale then frame:SetScale(AS.UIScale) end
	end)
end

function AS:SkinTexture(frame)
	frame:SetTexCoord(0.12, 0.88, 0.12, 0.88)
end

function AS:SkinIconButton(frame, strip, style, shrinkIcon)
	if frame.isSkinned then return end

	if strip then frame:StripTextures() end
	frame:CreateBackdrop("Default", true)
	if style then frame:StyleButton() end

	local icon = frame.icon
	if frame:GetName() and _G[frame:GetName().."IconTexture"] then
		icon = _G[frame:GetName().."IconTexture"]
	elseif frame:GetName() and _G[frame:GetName().."Icon"] then
		icon = _G[frame:GetName().."Icon"]
	end

	if icon then
		icon:SetTexCoord(.08,.88,.08,.88)

		if shrinkIcon then
			frame.backdrop:SetAllPoints()
			icon:SetInside(frame)
		else
			frame.backdrop:SetOutside(icon)
		end
		icon:SetParent(frame.backdrop)
	end
	frame.isSkinned = true
end

function AS:Desaturate(frame, point)
	for i = 1, frame:GetNumRegions() do
		local region = select(i, frame:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetDesaturated(1)
			if region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Corner" then
				region:Kill()
			end
		end
	end	

	if point then
		frame:Point("TOPRIGHT", point, "TOPRIGHT", 2, 2)
	end
end

function AS:CheckOption(optionName,...)
	for i = 1,select('#',...) do
		local addon = select(i,...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	return UISkinOptions[optionName]
end

function AS:DisableOption(optionName)
	UISkinOptions[optionName] = false
end

function AS:EnableOption(optionName)
	UISkinOptions[optionName] = true
end

function AS:ToggleOption(optionName)
	if AS:CheckOption(optionName) then
		AS:DisableOption(optionName)
	else
		AS:EnableOption(optionName)
	end
end

function AS:RegisterSkin(skinName,skinFunc,...)
	local events = {}
	local priority = 1
	for i = 1,select('#',...) do
		local event = select(i,...)
		if not event then break end
		if type(event) == 'number' then
			priority = event
		else
			events[event] = true
		end
	end
	local registerMe = { func = skinFunc, events = events, priority = priority }
	if not AS.register[skinName] then AS.register[skinName] = {} end
	AS.register[skinName][skinFunc] = registerMe
end

function AS:AddNonPetBattleFrames()
	for frame,data in pairs(AS.FrameLocks) do
		if data.shown then
			_G[frame]:Show()
		end
	end
end

function AS:RemoveNonPetBattleFrames()
	for frame,data in pairs(AS.FrameLocks) do
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
function AS:Delay(delay, func, ...)
	if(type(delay)~="number" or type(func)~="function") then
		return false
	end
	if(waitFrame == nil) then
		waitFrame = CreateFrame("Frame")
		waitFrame:SetScript("OnUpdate",function (frame, elapse)
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