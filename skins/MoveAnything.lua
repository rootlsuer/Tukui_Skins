if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local US = unpack(select(2,...))

local name = "MoveAnythingSkin"
function US:SkinMoveAnything()
	US:SkinFrame(MAOptions)
	MAScrollBorder:StripTextures(true)
	US:SkinScrollBar(MAScrollFrameScrollBar)
	US:SkinButton(MAOptionsSync)
	US:SkinButton(MAOptionsOpenBlizzardOptions)
	US:SkinButton(MAOptionsClose)
	US:SkinButton(GameMenuButtonMoveAnything)
	US:SkinBackdropFrame(GameMenuButtonMoveAnything)
	GameMenuButtonMoveAnything:ClearAllPoints()
	GameMenuButtonMoveAnything:Point("TOP", GameMenuFrame, "BOTTOM", 0, -3)
	US:SkinEditBox(MA_Search)
	US:SkinCheckBox(MAOptionsToggleModifiedFramesOnly)
	US:SkinCheckBox(MAOptionsToggleCategories)
	US:SkinCheckBox(MAOptionsToggleFrameStack)
	US:SkinCheckBox(MAOptionsToggleMovers)
	US:SkinCheckBox(MAOptionsToggleFrameEditors)
	for i = 1, 100 do
		if _G["MAMove"..i.."Reset"] then US:SkinButton(_G["MAMove"..i.."Reset"]) end
		if _G["MAMove"..i.."Reset"] then US:SkinButton(_G["MAMove"..i.."Reset"]) end
		if _G["MAMove"..i.."Backdrop"] then US:SkinFrame(_G["MAMove"..i.."Backdrop"]) end
		if _G["MAMove"..i.."Move"] then US:SkinCheckBox(_G["MAMove"..i.."Move"]) end
		if _G["MAMove"..i.."Hide"] then US:SkinCheckBox(_G["MAMove"..i.."Hide"]) end
	end
	US:SkinFrame(MANudger)
	US:SkinButton(MANudger_CenterMe)
	US:SkinButton(MANudger_CenterH)
	US:SkinButton(MANudger_CenterV)
	US:SkinButton(MANudger_NudgeUp)
	US:SkinButton(MANudger_NudgeDown)
	US:SkinButton(MANudger_NudgeLeft)
	US:SkinButton(MANudger_NudgeRight)
	US:SkinButton(MANudger_Detach)
	US:SkinButton(MANudger_Hide)
end

US:RegisterSkin(name, US.SkinMoveAnything)