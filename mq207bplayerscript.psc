ScriptName MQ207BPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property PreReqStageGravJumpRange = 12 Auto Const
Int Property StageToSetGravJumpRange = 13 Auto Const
Int Property GravJumpRangeToCheck = 28 Auto Const

;-- Functions ---------------------------------------

Event OnPlayerModifiedShip(spaceshipreference akShip)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:10
  Float myGravJumpRange = akShip.GetGravJumpRange() ; #DEBUG_LINE_NO:11
  If akShip == PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:12
    If myGravJumpRange >= GravJumpRangeToCheck as Float ; #DEBUG_LINE_NO:13
      If myQuest.GetStageDone(PreReqStageGravJumpRange) ; #DEBUG_LINE_NO:14
        myQuest.SetStage(StageToSetGravJumpRange) ; #DEBUG_LINE_NO:15
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHomeShipSet(spaceshipreference akShip, spaceshipreference akPrevious)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:22
  Float myGravJumpRange = akShip.GetGravJumpRange() ; #DEBUG_LINE_NO:23
  If myGravJumpRange >= GravJumpRangeToCheck as Float ; #DEBUG_LINE_NO:24
    If myQuest.GetStageDone(PreReqStageGravJumpRange) ; #DEBUG_LINE_NO:25
      myQuest.SetStage(StageToSetGravJumpRange) ; #DEBUG_LINE_NO:26
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
