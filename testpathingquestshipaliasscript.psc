ScriptName TestPathingQuestShipAliasScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.GetShipRef().SetExteriorLoadDoorInaccessible(False) ; #DEBUG_LINE_NO:5
EndEvent
