if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "DailyTamerCheckSkin"
function US:SkinDailyTamerCheck()
	local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
	local _tamerquestcheck
	if not _tamerquestcheck then
		_tamerquestcheck = SlashCmdList["DAILYTAMERCHECK"]
		SlashCmdList["DAILYTAMERCHECK"] = function()
			_tamerquestcheck()
			US:SkinFrame(DailyTamerCheck_mainframe)
		end
		local DTC = ldb:GetDataObjectByName("DailyTamerCheck")
		DTC.OnClick = function(frame, button)
			_tamerquestcheck()
			US:SkinFrame(DailyTamerCheck_mainframe)
		end
	end
end

US:RegisterSkin(name, US.SkinDailyTamerCheck)