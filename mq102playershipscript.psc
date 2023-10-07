ScriptName MQ102PlayerShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property MoaraShip Auto Const mandatory
Int Property DockStageToSet Auto Const mandatory
ReferenceAlias Property NovaGalacticStaryard Auto Const mandatory
Int Property NovaDockStageToSet Auto Const mandatory
Int Property PreReqStage = 200 Auto Const

;-- Functions ---------------------------------------

Event OnShipDock(Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:10
  If akParent == MoaraShip.GetShipReference() && abComplete ; #DEBUG_LINE_NO:12
    MyQuest.SetStage(DockStageToSet) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
  If akParent == NovaGalacticStaryard.GetShipReference() && abComplete && MyQuest.GetStageDone(PreReqStage) ; #DEBUG_LINE_NO:16
    MyQuest.SetStage(NovaDockStageToSet) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent
