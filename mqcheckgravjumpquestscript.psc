ScriptName MQCheckGravJumpQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property PreReqStageGravJumpRange = 12 Auto Const
Int Property StageToSetGravJumpRange = 13 Auto Const
Int Property GravJumpRangeToCheck = 28 Auto Const

;-- Functions ---------------------------------------

Function CheckSkillsMenu()
  Self.RegisterForMenuOpenCloseEvent("SkillsMenu") ; #DEBUG_LINE_NO:9
EndFunction

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "SkillsMenu" ; #DEBUG_LINE_NO:13
    If !abOpening ; #DEBUG_LINE_NO:14
      spaceshipreference MyShip = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:16
      Float myJumpRange = MyShip.GetGravJumpRange() ; #DEBUG_LINE_NO:17
      If myJumpRange >= GravJumpRangeToCheck as Float ; #DEBUG_LINE_NO:18
        If Self.GetStageDone(PreReqStageGravJumpRange) ; #DEBUG_LINE_NO:19
          Self.SetStage(StageToSetGravJumpRange) ; #DEBUG_LINE_NO:20
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
