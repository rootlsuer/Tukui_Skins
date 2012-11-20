local U = unpack(select(2,...))
local name = "ExaminerSkin"
local function SkinExaminer(self)

	-- Skin Examiner Frame
	U.SkinFrame(Examiner)
	U.SkinScrollBar(ExaminerStatsScrollScrollBar)
	U.SkinScrollBar(ExaminerFeatsScrollScrollBar)
	U.SkinScrollBar(ExaminerTalentsScrollChildScrollBar)
	U.SkinScrollBar(ExaminerGearScrollScrollBar)

	-- Skin Examiner Buttons
	for i = 1, Examiner:GetNumChildren() do
		local object = select(i, Examiner:GetChildren())
		if object:GetObjectType() == 'Button' then
			U.SkinButton(object, true)
		end
	end

	-- Skin Tabs
	U.SkinTab(ExaminerTab1)
	U.SkinTab(ExaminerTab2)
	U.SkinTab(ExaminerTab3)

	--Resize Tabs (Lua-Fu weak, Not obeying width settings)
	ExaminerTab1:Size(140, 26)
	ExaminerTab2:Size(140, 26)
	ExaminerTab3:Size(140, 26)
end

U.RegisterSkin(name,SkinExaminer)