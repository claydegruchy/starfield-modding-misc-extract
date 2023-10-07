ScriptName CF05_HuanShipOnLoadScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF05_HuanShipDoor Auto Const mandatory
ReferenceAlias Property Alias_CF05_HuanShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If !Self.GetOwningQuest().GetStageDone(721) ; #DEBUG_LINE_NO:8
    Alias_CF05_HuanShip.GetShipRef().SetExteriorLoadDoorInaccessible(False) ; #DEBUG_LINE_NO:9
    Self.RefillDependentAliases() ; #DEBUG_LINE_NO:10
    Alias_CF05_HuanShipDoor.RefillAlias() ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndEvent
