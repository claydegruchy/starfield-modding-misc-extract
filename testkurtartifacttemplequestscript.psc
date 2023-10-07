ScriptName TestKurtArtifactTempleQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
LocationAlias Property PlanetWithTrait Auto Const mandatory
Keyword Property LocTypeMajorOrbital Auto Const mandatory
LocationAlias Property TempleLocation Auto Const mandatory
Int Property LandingSetStage = 30 Auto Const
Int Property PowerSetStage = 50 Auto Const
ReferenceAlias Property TemplePowerTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipLanding") ; #DEBUG_LINE_NO:18
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnExitShipInterior") ; #DEBUG_LINE_NO:19
  Self.RegisterForRemoteEvent(TemplePowerTrigger as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:20
EndEvent

Event ReferenceAlias.OnShipLanding(ReferenceAlias akSource, Bool abComplete)
  If abComplete ; #DEBUG_LINE_NO:25
    Self.RefillTemple() ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RefillTemple()
  Location landingLocation = PlayerShip.GetRef().GetCurrentLocation() ; #DEBUG_LINE_NO:31
  Location planetLocation = PlanetWithTrait.GetLocation() ; #DEBUG_LINE_NO:32
  If landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital) ; #DEBUG_LINE_NO:34
    TempleLocation.RefillAlias() ; #DEBUG_LINE_NO:36
    TempleLocation.RefillDependentAliases() ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnExitShipInterior(Actor akSource, ObjectReference akShip)
  Location landingLocation = akShip.GetCurrentLocation() ; #DEBUG_LINE_NO:42
  Location planetLocation = PlanetWithTrait.GetLocation() ; #DEBUG_LINE_NO:43
  If landingLocation.IsSameLocation(planetLocation, LocTypeMajorOrbital) ; #DEBUG_LINE_NO:44
    Self.SetStage(LandingSetStage) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  Self.RegisterForCustomEvent((TemplePowerTrigger.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent") ; #DEBUG_LINE_NO:51
EndEvent

Event SBPowerCollectionActivatorScript.PowerAcquiredEvent(sbpowercollectionactivatorscript akSender, Var[] akArgs)
  If (akSender as ObjectReference == TemplePowerTrigger.GetRef()) && Self.GetStageDone(PowerSetStage) == False ; #DEBUG_LINE_NO:55
    Self.SetStage(PowerSetStage) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
EndEvent
