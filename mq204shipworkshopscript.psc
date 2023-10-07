ScriptName MQ204ShipWorkshopScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property BuildArmillaryPrereqStage = 510 Auto Const
Int Property BuildArmillaryTurnOffStage = 620 Auto Const
Int Property BuildArmillaryTutorialStage = 520 Auto Const

;-- Functions ---------------------------------------

Event OnWorkshopMode(Bool aStart)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:8
  If myQuest.GetStageDone(BuildArmillaryPrereqStage) == True && myQuest.GetStageDone(BuildArmillaryTurnOffStage) == False && myQuest.GetStageDone(BuildArmillaryTutorialStage) == False ; #DEBUG_LINE_NO:9
    myQuest.SetStage(BuildArmillaryTutorialStage) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent
