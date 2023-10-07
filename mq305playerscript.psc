ScriptName Mq305PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property BuildArmillaryPrereqStage = 10 Auto Const
Int Property BuildArmillaryStage = 40 Auto Const
ActorValue Property MQArmillaryShipBuilderCheck Auto Const mandatory

;-- Functions ---------------------------------------

Event OnPlayerModifiedShip(spaceshipreference akShip)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:9
  If akShip.GetValue(MQArmillaryShipBuilderCheck) >= 1.0 ; #DEBUG_LINE_NO:10
    If myQuest.GetStageDone(BuildArmillaryPrereqStage) == True && myQuest.GetStageDone(BuildArmillaryStage) == False ; #DEBUG_LINE_NO:11
      myQuest.SetStage(BuildArmillaryStage) ; #DEBUG_LINE_NO:12
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterShipInterior(ObjectReference akShip)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:19
  If akShip.GetValue(MQArmillaryShipBuilderCheck) >= 1.0 ; #DEBUG_LINE_NO:20
    If myQuest.GetStageDone(BuildArmillaryPrereqStage) == True && myQuest.GetStageDone(BuildArmillaryStage) == False ; #DEBUG_LINE_NO:21
      myQuest.SetStage(BuildArmillaryStage) ; #DEBUG_LINE_NO:22
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
