if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local name = 'LinkWranglerSkin'
function AS:SkinLinkWrangler()
	LWTukuiSkinner_Path = 'Interface\\AddOns\\Tukui_Skins\\skins\\Buttons\\'
	LWTukuiSkinner_Close = LWTukuiSkinner_Path..'close'
	LWTukuiSkinner_Min = LWTukuiSkinner_Path..'min'
	LWTukuiSkinner_Compare = LWTukuiSkinner_Path..'compare'
	LWTukuiSkinner_CompareDisabled = LWTukuiSkinner_Path..'compareDisable'
	LWTukuiSkinner_Whisper = LWTukuiSkinner_Path..'whisper'
	LWTukuiSkinner_Relink = LWTukuiSkinner_Path..'relink'
	LWTukuiSkinner_Dress = LWTukuiSkinner_Path..'dress'

	local function LWTukuiSkinner_SkinButton(button, tex, distex)
		if (button == nil) then
			return
		end
		button:SetNormalTexture(tex)
		button:SetDisabledTexture(distex)
		button:SetPushedTexture(tex)
		button:SetHighlightTexture(tex)
		return button
	end

	local function LWTukuiSkinner(frame, link)
		local r, g, b = GetItemInfo(link) and GetItemQualityColor(select(3,GetItemInfo(link))) or 1, 1, 0
		frame:SetTemplate('Default')
		frame:SetBackdropBorderColor(r, g, b)
		local closeButton = _G[frame:GetName()..'CloseButton']
		LWTukuiSkinner_SkinButton(closeButton, LWTukuiSkinner_Close)
		local minButton = _G[frame:GetName()..'MinButton']
		LWTukuiSkinner_SkinButton(minButton, LWTukuiSkinner_Min)
		local compButton = _G[frame:GetName()..'CompButton']
		LWTukuiSkinner_SkinButton(compButton, LWTukuiSkinner_Compare, LWTukuiSkinner_CompareDisabled)
		local whisperButton = _G[frame:GetName()..'WhisperButton']
		LWTukuiSkinner_SkinButton(whisperButton, LWTukuiSkinner_Whisper)
		local relinkButton = _G[frame:GetName()..'RelinkButton']
		LWTukuiSkinner_SkinButton(relinkButton, LWTukuiSkinner_Relink)
		local dressupButton = _G[frame:GetName()..'DressupButton']
		LWTukuiSkinner_SkinButton(dressupButton, LWTukuiSkinner_Dress)
		local captureButton = _G[frame:GetName()..'CaptureButton']
		LWTukuiSkinner_SkinButton(captureButton, LWTukuiSkinner_Compare)
	end

	LinkWrangler.RegisterCallback('Tukui_LinkWrangler_Skin', LWTukuiSkinner, 'show', 'showcomp')
end

AS:RegisterSkin(name, AS.SkinLinkWrangler)