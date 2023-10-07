ScriptName UC03_LouSceneComplete Extends Scene Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PlanSceneCompleteStage = 442 Auto Const
{ Stage that should be set if the player has heard Lou's plan }
Int Property AgreetoHelpJakobStage = 500 Auto Const
{ Stage that should be set if the player agreed to help }
Int Property CambridgeShoutsStage = 510 Auto Const
{ Stage to set once the player knows the plan }

;-- Functions ---------------------------------------

Event OnEnd()
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:13
  If myQuest.GetStageDone(PlanSceneCompleteStage) && myQuest.GetStageDone(AgreetoHelpJakobStage) ; #DEBUG_LINE_NO:14
    myQuest.SetStage(CambridgeShoutsStage) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent
