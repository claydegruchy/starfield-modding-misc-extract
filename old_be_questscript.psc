ScriptName OLD_BE_QuestScript Extends Quest conditional
{ parent script for BE quests }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TargetShip Auto Const
{ this ship }
RefCollectionAlias Property CrewCollection Auto Const
{ OPTIONAL: collection of crew actors
    if included, will move crew collection to matching markers in CrewMarkers array, and assign them to matching aliases in CrewAliases }
ReferenceAlias[] Property CrewMarkers Auto Const
{ OPTIONAL: collection of markers for crew
    only used with CrewCollection; if provided, will move crew collection to matching markers in CrewMarkers array, and assign them to matching aliases in CrewAliases }
ReferenceAlias[] Property CrewAliases Auto Const
{ array of ref aliases for individual crew actors }
ActorValue Property SpaceshipCrew Auto Const
{ tracks number of crew on a ship }
Bool Property StopQuestOnUndock = True Auto Const
{ stop quest when player undocks - should be TRUE unless you are doing special handling to shut down the quest some other way }

;-- Functions ---------------------------------------

Event OnQuestInit()
  spaceshipreference shipRef = TargetShip.GetShipRef() ; #DEBUG_LINE_NO:27
  Self.RegisterForRemoteEvent(shipRef as ScriptObject, "OnShipUndock") ; #DEBUG_LINE_NO:29
  Int crewValue = shipRef.GetValue(SpaceshipCrew) as Int ; #DEBUG_LINE_NO:31
  Int baseCrewValue = shipRef.GetBaseValue(SpaceshipCrew) as Int ; #DEBUG_LINE_NO:32
  If CrewCollection ; #DEBUG_LINE_NO:34
    Int i = 0 ; #DEBUG_LINE_NO:37
    While i < baseCrewValue && i < CrewCollection.GetCount() ; #DEBUG_LINE_NO:38
      Actor theCrew = CrewCollection.GetAt(i) as Actor ; #DEBUG_LINE_NO:40
      CrewAliases[i].ForceRefTo(theCrew as ObjectReference) ; #DEBUG_LINE_NO:42
      If CrewMarkers as Bool && i < CrewMarkers.Length ; #DEBUG_LINE_NO:44
        ObjectReference theMarker = CrewMarkers[i].GetRef() ; #DEBUG_LINE_NO:45
        If theMarker ; #DEBUG_LINE_NO:46
          theCrew.MoveTo(theMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:47
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      i += 1 ; #DEBUG_LINE_NO:50
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:56
  While I < baseCrewValue && I < CrewAliases.Length ; #DEBUG_LINE_NO:57
    Actor thecrew = CrewAliases[I].GetActorRef() ; #DEBUG_LINE_NO:60
    thecrew.EnableNoWait(False) ; #DEBUG_LINE_NO:62
    If I >= crewValue ; #DEBUG_LINE_NO:63
      thecrew.KillSilent(None) ; #DEBUG_LINE_NO:66
    EndIf ; #DEBUG_LINE_NO:
    Self.RegisterForRemoteEvent(thecrew as ScriptObject, "OnDying") ; #DEBUG_LINE_NO:69
    I += 1 ; #DEBUG_LINE_NO:70
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Function StartCombatWithPlayer()
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:79
  Int I = 0 ; #DEBUG_LINE_NO:80
  While I < CrewAliases.Length ; #DEBUG_LINE_NO:81
    Actor theCrew = CrewAliases[I].GetActorRef() ; #DEBUG_LINE_NO:83
    theCrew.StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:84
    I += 1 ; #DEBUG_LINE_NO:85
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event SpaceshipReference.OnShipUndock(spaceshipreference akSource, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  If StopQuestOnUndock ; #DEBUG_LINE_NO:91
    Self.Stop() ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
  spaceshipreference shipRef = TargetShip.GetShipRef() ; #DEBUG_LINE_NO:98
  shipRef.ModValue(SpaceshipCrew, -1.0) ; #DEBUG_LINE_NO:99
EndEvent
