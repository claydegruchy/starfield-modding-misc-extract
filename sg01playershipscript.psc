ScriptName SG01PlayerShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ShipSystem Auto Const

;-- Functions ---------------------------------------

Event OnShipSystemDamaged(ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  If akSystem == ShipSystem && aFullyDamaged && Self.GetOwningQuest().GetStageDone(700) ; #DEBUG_LINE_NO:8
    Self.GetOwningQuest().SetStage(750) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
