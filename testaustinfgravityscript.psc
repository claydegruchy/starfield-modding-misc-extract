ScriptName TestAustinFGravityScript Extends ObjectReference
{ test script to change gravity on a cell }

;-- Variables ---------------------------------------
Cell currentCell

;-- Properties --------------------------------------
Group RequiredProperties
  Float Property currentGravity Auto Const
  { the gravity you want to set on the cell }
  Float Property modifiedGravity Auto Const
EndGroup

Group OptionalProperties
  Cell Property myCell Auto Const
  { set if you want to change gravity on a cell that the player is not currently in }
EndGroup


;-- State -------------------------------------------
State allDone
EndState

;-- State -------------------------------------------
Auto State waiting

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.getPlayer() as ObjectReference ; #DEBUG_LINE_NO:
      If myCell ; #DEBUG_LINE_NO:
        myCell.setGravityScale(currentGravity) ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        currentCell.setGravityScale(currentGravity) ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.getPlayer() as ObjectReference ; #DEBUG_LINE_NO:
      currentCell.setGravityScale(modifiedGravity) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnTriggerLeave(ObjectReference akActionRef)
    currentCell.setGravityScale(currentGravity) ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    currentCell = Self.getParentCell() ; #DEBUG_LINE_NO:25
  EndEvent
EndState
