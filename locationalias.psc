ScriptName LocationAlias Extends Alias Native hidden

;-- Functions ---------------------------------------

Function Clear() Native

Function ForceLocationTo(Location akNewLocation) Native

Location Function GetLocation() Native

Function ClearAndRefillAlias()
  Self.Clear() ; #DEBUG_LINE_NO:14
  Self.RefillAlias() ; #DEBUG_LINE_NO:15
EndFunction
