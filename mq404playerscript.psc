ScriptName MQ404PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property BuildArmillaryPrereqStage = 110 Auto Const
Int Property BuildArmillaryStage = 120 Auto Const
ActorValue Property MQArmillaryShipBuilderCheck Auto Const mandatory
Keyword Property ShipTypeStarborn Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnPlayerModifiedShip(spaceshipreference akShip)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:11
  If akShip.GetValue(MQArmillaryShipBuilderCheck) >= 1.0 ; #DEBUG_LINE_NO:12
    If myQuest.GetStageDone(BuildArmillaryPrereqStage) == True && myQuest.GetStageDone(BuildArmillaryStage) == False ; #DEBUG_LINE_NO:13
      myQuest.SetStage(BuildArmillaryStage) ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterShipInterior(ObjectReference akShip)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:21
  spaceshipreference PlayerShipREF = PlayerShip.GetShipReference() ; #DEBUG_LINE_NO:22
  If (akShip == PlayerShipREF as ObjectReference) && akShip.HasKeyword(ShipTypeStarborn) ; #DEBUG_LINE_NO:25
    If myQuest.GetStageDone(BuildArmillaryPrereqStage) == True && myQuest.GetStageDone(BuildArmillaryStage) == False ; #DEBUG_LINE_NO:26
      myQuest.SetStage(BuildArmillaryStage) ; #DEBUG_LINE_NO:27
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
