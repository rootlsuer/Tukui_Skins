if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "ExaminerSkin"
function US:SkinExaminer()
	US:SkinFrame(Examiner)
	US:SkinScrollBar(ExaminerStatsScrollScrollBar)
	US:SkinScrollBar(ExaminerFeatsScrollScrollBar)
	US:SkinScrollBar(ExaminerGearScrollScrollBar)
	for i = 1, Examiner:GetNumChildren() do
		local object = select(i, Examiner:GetChildren())
		if object:GetObjectType() == 'Button' then
			US:SkinButton(object, true)
		end
	end
end

US:RegisterSkin(name, US.SkinExaminer)