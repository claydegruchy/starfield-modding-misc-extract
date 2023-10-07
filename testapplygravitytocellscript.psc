ScriptName TestApplyGravityToCellScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group RequiredProperties
  Float Property targetGravity Auto Const
  { the gravity you want to set on the cell }
EndGroup


;-- Functions ---------------------------------------

Event OnCellLoad()
  Cell currentCell = Self.getParentCell() ; #DEBUG_LINE_NO:11
  currentCell.setGravityScale(targetGravity) ; #DEBUG_LINE_NO:13
EndEvent
