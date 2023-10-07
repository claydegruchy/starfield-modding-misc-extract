ScriptName COM_Quest_SamCoe_ShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property PlayerShipInteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipModule Auto Const mandatory
ReferenceAlias Property LillianSceneMarker Auto Const mandatory
ReferenceAlias Property LillianHart Auto Const mandatory
Int Property LillianOnShipStage Auto Const mandatory
Int Property LillianOffShipStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akNewLoc == PlayerShipInteriorLocation.GetLocation() ; #DEBUG_LINE_NO:16
    Alias_PlayerShipModule.RefillDependentAliases() ; #DEBUG_LINE_NO:17
    Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:18
    If myQuest.GetStageDone(LillianOnShipStage) && !myQuest.GetStageDone(LillianOffShipStage) ; #DEBUG_LINE_NO:19
      LillianHart.GetRef().MoveTo(LillianSceneMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
