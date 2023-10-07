ScriptName MQCheckGravCrewAssignScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PreReqStageGravJumpRange = 12 Auto Const
Int Property StageToSetGravJumpRange = 13 Auto Const
Int Property GravJumpRangeToCheck = 28 Auto Const

;-- Functions ---------------------------------------

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  spaceshipreference MyShip = Self.GetShipRef() ; #DEBUG_LINE_NO:9
  If MyShip.GetGravJumpRange() >= GravJumpRangeToCheck as Float ; #DEBUG_LINE_NO:10
    Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:11
    If myQuest.GetStageDone(PreReqStageGravJumpRange) ; #DEBUG_LINE_NO:12
      myQuest.SetStage(StageToSetGravJumpRange) ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
