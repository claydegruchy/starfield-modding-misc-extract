ScriptName MQ204PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Int EyePathRunToShipPrereq = 480
Int EyePathRunToShipStage = 490
Int NewAtlantisToShipPrereqStage = 110
Int NewAtlantisToShipStage = 135

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property BuildArmillaryPrereqStage = 510 Auto Const
Int Property BuildArmillaryStage = 620 Auto Const
Int Property EyePathPostRescuedEyeStage = 455 Auto Const
Int Property EyePathPostRescuedEyePrereq = 450 Auto Const
ActorValue Property MQArmillaryShipBuilderCheck Auto Const mandatory
Keyword Property ShipTypeStarborn Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEnterShipInterior(ObjectReference akShip)
  Quest myMQ204 = Self.GetOwningQuest() ; #DEBUG_LINE_NO:20
  spaceshipreference PlayerShipREF = PlayerShip.GetShipReference() ; #DEBUG_LINE_NO:21
  If akShip == PlayerShipREF as ObjectReference ; #DEBUG_LINE_NO:22
    If myMQ204.GetStageDone(NewAtlantisToShipPrereqStage) ; #DEBUG_LINE_NO:23
      myMQ204.SetStage(NewAtlantisToShipStage) ; #DEBUG_LINE_NO:24
    EndIf ; #DEBUG_LINE_NO:
    If myMQ204.GetStageDone(EyePathRunToShipPrereq) ; #DEBUG_LINE_NO:26
      myMQ204.SetStage(EyePathRunToShipStage) ; #DEBUG_LINE_NO:27
    EndIf ; #DEBUG_LINE_NO:
    If myMQ204.GetStageDone(EyePathPostRescuedEyePrereq) ; #DEBUG_LINE_NO:29
      myMQ204.SetStage(EyePathPostRescuedEyeStage) ; #DEBUG_LINE_NO:30
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
