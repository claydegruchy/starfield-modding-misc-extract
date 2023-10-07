ScriptName TestFossilHuntQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LocTypeFossilTarget Auto Const mandatory
{ keyword on location we're looking for }
LocationAlias Property FossilPlanetLocation Auto Const mandatory
{ planet we're looking for fossil on }
LocationAlias Property FossilOverlayLocation Auto Const mandatory
{ overlay the player needs to enter to complete objective }
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property FossilScanStage = 50 Auto Const
Int Property FossilCollectStage = 100 Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:20
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipScan") ; #DEBUG_LINE_NO:21
EndEvent

Event ReferenceAlias.OnShipScan(ReferenceAlias akSource, Location aPlanet, ObjectReference[] aMarkersArray)
  If aPlanet == FossilPlanetLocation.GetLocation() ; #DEBUG_LINE_NO:25
    Self.SetStage(FossilScanStage) ; #DEBUG_LINE_NO:26
    Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipScan") ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() || (akSender as ObjectReference == PlayerShip.GetRef()) ; #DEBUG_LINE_NO:34
    If akNewLoc.HasKeyword(LocTypeFossilTarget) && FossilPlanetLocation.GetLocation().IsChild(akNewLoc) && akNewLoc == FossilOverlayLocation.GetLocation() ; #DEBUG_LINE_NO:36
      Self.SetStage(FossilCollectStage) ; #DEBUG_LINE_NO:37
      Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:38
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
