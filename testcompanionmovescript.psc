ScriptName TestCompanionMoveScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Actor Property TestCompanion Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActivator)
  TestCompanion.SetPlayerTeammate(True, True, False) ; #DEBUG_LINE_NO:6
EndEvent
