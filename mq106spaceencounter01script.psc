ScriptName MQ106SpaceEncounter01Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TheHelix Auto Const mandatory
ReferenceAlias Property TheHelixMovetoMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  spaceshipreference HelixREF = TheHelix.GetShipRef() ; #DEBUG_LINE_NO:8
  HelixREF.moveto(TheHelixMovetoMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  HelixREF.EnableWithGravJump() ; #DEBUG_LINE_NO:10
EndEvent
