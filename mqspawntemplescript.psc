ScriptName MQSpawnTempleScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property TempleLocationPlaced Auto Const mandatory
ReferenceAlias Property TemplePlacedMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Var[] kargs = new Var[2] ; #DEBUG_LINE_NO:9
  kargs[0] = TempleLocationPlaced.GetLocation() as Var ; #DEBUG_LINE_NO:10
  kargs[1] = TemplePlacedMapMarker.GetRef() as Var ; #DEBUG_LINE_NO:11
  Self.SendCustomEvent("mqspawntemplescript_TempleSpawnedEvent", kargs) ; #DEBUG_LINE_NO:12
  Self.Stop() ; #DEBUG_LINE_NO:13
  Self.Reset() ; #DEBUG_LINE_NO:14
EndEvent
