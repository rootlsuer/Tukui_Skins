if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = 'DailyTamerCheckSkin'
local _tamerquestcheck
local function SkinDailyTamerCheck(self, event)
  local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
  -- Stupid hacks we need because of stupid addons :p
  if not _tamerquestcheck then
    _tamerquestcheck = SlashCmdList["DAILYTAMERCHECK"]
    SlashCmdList["DAILYTAMERCHECK"] = function()
      _tamerquestcheck()
      U.SkinFrame(DailyTamerCheck_mainframe)
    end
    local DTC = ldb:GetDataObjectByName("DailyTamerCheck")
    DTC.OnClick = function(self,button)
      _tamerquestcheck()
      U.SkinFrame(DailyTamerCheck_mainframe)
    end
  end
end

U.RegisterSkin(name, SkinDailyTamerCheck)
