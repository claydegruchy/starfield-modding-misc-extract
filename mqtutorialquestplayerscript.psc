ScriptName MQTutorialQuestPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property EnterPlayerShipStage = 10 Auto Const

;-- Functions ---------------------------------------

Event OnEnterShipInterior(ObjectReference akShip)
  If akShip == PlayerShip.GetRef() ; #DEBUG_LINE_NO:7
    Self.GetOwningQuest().SetStage(EnterPlayerShipStage) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
