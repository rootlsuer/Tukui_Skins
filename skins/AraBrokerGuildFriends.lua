local U = unpack(select(2,...))

local function SkinAraGF(self, event, ...)
    local AraGuildFriends = _G["AraBrokerGuildFriends"]
        AraGuildFriends:StripTextures()
        AraGuildFriends:SetTemplate("Default")
end

local name = "AraBrokerGuildFriendsSkin"
local function SkinAraBrokerGuildFriends(self)
    local AraGuildFriends = _G["AraBrokerGuildFriends"]
    AraGuildFriends:SetScript("OnUpdate", SkinAraGF)
end

U.RegisterSkin(name,SkinAraBrokerGuildFriends)