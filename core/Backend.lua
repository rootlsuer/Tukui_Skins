if not (Tukui or AsphyxiaUI or DuffedUI) then return end
local AS = unpack(select(2,...))

local format, gsub, strmatch, strfind = format, gsub, strmatch, strfind
local tinsert, pairs, ipairs, unpack, select, pcall = tinsert, pairs, ipairs, unpack, select, pcall

UISkinOptions = {}
AS.skins = {}
AS.events = {}
AS.register = {}

function AS:Init()
	if self.frame then return end

	self.frame = CreateFrame('Frame')
	self.frame:RegisterEvent('PET_BATTLE_CLOSE')
	self.frame:RegisterEvent('PET_BATTLE_OPENING_START')
	for skin, alldata in AS:OrderedPairs(self.register) do
		for _, data in pairs(alldata) do
			local addon
			local sdata = self.Skins[skin]
			if sdata and sdata.addon then
				addon = sdata.addon
			else
				addon = gsub(skin, 'Skin', '')
			end
			if AS:CheckOption(skin) == nil then AS:EnableOption(skin) end
			if skin == 'MiscFixes' or IsAddOnLoaded(addon) then
				self:RegisteredSkin(skin, data.priority, data.func, data.events)
			end
		end
	end
	for skin, funcs in AS:OrderedPairs(AS.skins) do
		if AS:CheckOption(skin) then
			for _, func in ipairs(funcs) do
				AS:CallSkin(skin, func, 'PLAYER_ENTERING_WORLD')
			end
		end
	end
	self.frame:SetScript('OnEvent', function(self, event, ...)
		if event == 'PET_BATTLE_CLOSE' then
			AS:AddNonPetBattleFrames()
		elseif event == 'PET_BATTLE_OPENING_START' then
			AS:RemoveNonPetBattleFrames()
		end 
		for skin, funcs in AS:OrderedPairs(AS.skins) do
			if AS:CheckOption(skin) and AS.events[event] and AS.events[event][skin] then
				for _, func in ipairs(funcs) do
					local args = {}
					for i = 1, select('#',...) do
						local arg = select(i, ...)
						if not arg then break end
						tinsert(args, arg)
					end
					AS:CallSkin(skin, func, event, unpack(args))
				end
			end
		end
	end)
end

function AS:CallSkin(skin, func, event, ...)
	local pass, error = pcall(func, self, event, ...)
	if not pass then
		local message = '%s: |cFFFF0000There was an error in the|r |cFF0AFFFF%s|r |cFFFF0000skin|r. Please report this to Azilroka immediately @ http://www.tukui.org/tickets/tukuiskins'
		local errormessage = '%s Error: %s'
		print(format(message, AS.Title, gsub(skin, 'Skin', '')))
		print(format(errormessage, gsub(skin, 'Skin', ''), error))
	end
end

function AS:RegisteredSkin(skinName, priority, func, events)
    local events = events
	for c,_ in pairs(events) do
		if strfind(c,'%[') then
			local conflict = strmatch(c,'%[([!%w_]+)%]')
			if IsAddOnLoaded(conflict) then return end
		end
	end
	if not self.skins[skinName] then self.skins[skinName] = {} end
	self.skins[skinName][priority] = func
	for event, _ in pairs(events) do
		if not strfind(event,'%[') then
			if not self.events[event] then
				self.frame:RegisterEvent(event)
				self.events[event] = {}
			end
			self.events[event][skinName] = true
		end
    end
end

function AS:UnregisterEvent(skinName, event)
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

local ASFrame = CreateFrame('Frame')
ASFrame:RegisterEvent('PLAYER_ENTERING_WORLD')
ASFrame:SetScript('OnEvent', function(self, event)
	self:UnregisterEvent(event)
	if AS:CheckOption('RecountBackdrop') == nil then AS:EnableOption('RecountBackdrop') end
	if AS:CheckOption('SkadaBackdrop') == nil then AS:EnableOption('SkadaBackdrop') end
	if AS:CheckOption('DBMSkinHalf') == nil then AS:DisableOption('DBMSkinHalf') end
	if AS:CheckOption('EmbedOoC') == nil then AS:DisableOption('EmbedOoC') end
	if AS:CheckOption('EmbedOmen') == nil then AS:DisableOption('EmbedOmen') end
	if AS:CheckOption('EmbedTinyDPS') == nil then AS:DisableOption('EmbedTinyDPS') end
	if AS:CheckOption('EmbedSkada') == nil then AS:DisableOption('EmbedSkada') end
	if AS:CheckOption('EmbedRecount') == nil then AS:DisableOption('EmbedRecount') end
	if AS:CheckOption('EmbedCoolLine') == nil then AS:DisableOption('EmbedCoolLine') end
	if AS:CheckOption('EmbedLeft') == nil then AS:SetOption('EmbedLeft', 'Omen') end
	if AS:CheckOption('EmbedRight') == nil then AS:SetOption('EmbedRight', 'Skada') end
	if AS:CheckOption('TransparentEmbed') == nil then AS:DisableOption('TransparentEmbed') end
	AS:EnableOption('MiscFixes')
	AS:Init()
	print(format('%s by |cFFFF7D0AAzilroka|r - Version: |cFF1784D1%s|r Loaded!', AS.Title, AS.Version))
	if IsAddOnLoaded('Enhanced_Config') then AS:Ace3Options() else AS:LegacyOptions() end
end)