ScriptName DDR018TowerLiftScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property myMoveHelper Auto Const mandatory
ObjectReference Property myMoveMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Utility.Wait(1.5) ; #DEBUG_LINE_NO:8
  myMoveHelper.TranslateToRef(myMoveMarker, 1.0, 0.0) ; #DEBUG_LINE_NO:9
EndEvent
