if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))
UISkinOptions = {}
local XS = {}
XS.skins = {}
XS.events = {}
XS.register = {}
AS.x = XS
local Skins = AS.Skins

XS.Init = function(self)
	if self.frame then return end

	local f = CreateFrame("Frame")
	f:RegisterEvent("PET_BATTLE_CLOSE")
	f:RegisterEvent("PET_BATTLE_OPENING_START")
	self.frame = f
	for skin, alldata in pairs(self.register) do
		for _, data in pairs(alldata) do
			if IsAddOnLoaded(Skins[skin].addon) then
				if UISkinOptions[skin] == nil or UISkinOptions[skin] == "Enabled" then
					UISkinOptions[skin] = true
				elseif UISkinOptions[skin] == "Disabled" then
					UISkinOptions[skin] = false
				end
				self:RegisterSkin(skin, data.func, data.events)
			end
		end
	end
	for skin, funcs in pairs(XS.skins) do
		if AS:CheckOption(skin) then
			for func, _ in pairs(funcs) do
				func(f, "PLAYER_ENTERING_WORLD")
			end
		end
	end
	f:SetScript("OnEvent", function(self, event, ...)
		if event == "PET_BATTLE_CLOSE" then
			AS:AddNonPetBattleFrames()
		elseif event == "PET_BATTLE_OPENING_START" then
			AS:RemoveNonPetBattleFrames()
		end 
		for skin, funcs in pairs(XS.skins) do
			if AS:CheckOption(skin) and XS.events[event] and XS.events[event][skin] then
				for func, _ in pairs(funcs) do
					local args = {}
					for i = 1, select('#',...) do
						local arg = select(i, ...)
						if not arg then break end
						tinsert(args, arg)
					end
					func(f, event, unpack(args))
				end
			end
		end
	end)

	self.frame = f
end

XS.RegisterSkin = function(self,skinName,func,events)
    if not self.skins[skinName] then self.skins[skinName] = {} end
    self.skins[skinName][func] = true
    for event,_ in pairs(events) do
        if not self.events[event] then self.frame:RegisterEvent(event); self.events[event] = {} end
        self.events[event][skinName] = true
    end
end

XS.UnregisterEvent = function(self,skinName,event)
	if not self.events[event] then return end
	if not self.events[event][skinName] then return end
	self.events[event][skinName] = nil
	local found = false
	for skin,_ in pairs(self.events[event]) do
		if skin then
			found = true
			break
		end
	end
	if not found then
		self.frame:UnregisterEvent(event)
	end
end

local XSFrame = CreateFrame("Frame")
XSFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
XSFrame:SetScript("OnEvent", function(self, event)
	self:UnregisterEvent(event)
	if UISkinOptions["RecountBackdrop"] == nil then UISkinOptions["RecountBackdrop"] = true end
	if UISkinOptions["SkadaBackdrop"] == nil then UISkinOptions["SkadaBackdrop"] = true end
	if UISkinOptions["CLCProtSkin"] == nil then UISkinOptions["CLCProtSkin"] = true end
	if UISkinOptions["CLCRetSkin"] == nil then UISkinOptions["CLCRetSkin"] = true end
	if UISkinOptions["DBMSkinHalf"] == nil then UISkinOptions["DBMSkinHalf"] = false end
	if UISkinOptions["WeakAurasSkin"] == nil then UISkinOptions["WeakAurasSkin"] = true end
	if UISkinOptions["EmbedOoC"] == nil then UISkinOptions["EmbedOoC"] = false end
	if UISkinOptions["EmbedOmen"] == nil then UISkinOptions["EmbedOmen"] = false end
	if UISkinOptions["EmbedTinyDPS"] == nil then UISkinOptions["EmbedTinyDPS"] = false end
	if UISkinOptions["EmbedSkada"] == nil then UISkinOptions["EmbedSkada"] = false end
	if UISkinOptions["EmbedRecount"] == nil then UISkinOptions["EmbedRecount"] = false end
	if UISkinOptions["EmbedCoolLine"] == nil then UISkinOptions["EmbedCoolLine"] = false end
	if UISkinOptions["EmbedLeft"] == nil then UISkinOptions["EmbedLeft"] = "Omen" end
	if UISkinOptions["EmbedRight"] == nil then UISkinOptions["EmbedRight"] = "Skada" end
	if UISkinOptions["SkadaBelowTop"] == nil then UISkinOptions["SkadaBelowTop"] = false end
	if UISkinOptions["SkadaTwoThirds"] == nil then UISkinOptions["SkadaTwoThirds"] = false end
	UISkinOptions["MiscFixes"] = true
	XS:Init()
	print(AS.Title.." by |cFFFF7D0AAzilroka|r - Version: |cFF1784D1"..AS.Version.."|r Loaded!")
	if IsAddOnLoaded("Enhanced_Config") then AS:Ace3Options() else AS:LegacyOptions() end
end)