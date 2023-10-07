ScriptName FavorQuestScript Extends Quest

;-- Variables ---------------------------------------
Location StartLocation

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:6
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:7
  StartLocation = PlayerREF.GetCurrentLocation() ; #DEBUG_LINE_NO:8
  If Self.GetStage() >= 200 ; #DEBUG_LINE_NO:11
    Self.Stop() ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender.IsInLocation(StartLocation) == True ; #DEBUG_LINE_NO:22
     ; #DEBUG_LINE_NO:
  ElseIf Self.GetStage() < 10 ; #DEBUG_LINE_NO:25
    Self.Stop() ; #DEBUG_LINE_NO:26
  Else ; #DEBUG_LINE_NO:
    Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent
