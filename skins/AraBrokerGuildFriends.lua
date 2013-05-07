if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "AraBrokerGuildFriendsSkin"
function US:SkinAraBrokerGuildFriends()
	AraBrokerGuildFriends:HookScript("OnUpdate", function(f) US:SkinFrame(f) end)
end

US:RegisterSkin(name, US.SkinAraBrokerGuildFriends)