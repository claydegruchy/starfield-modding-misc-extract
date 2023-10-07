ScriptName CreateCrewOnDockQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property CrewCollection Auto Const
{ collection of crew actors }
ReferenceAlias[] Property CrewMarkers Auto Const
{ array of marker aliases for all crew }
ReferenceAlias[] Property CrewAliases Auto Const
{ array of ref aliases for individual crew actors }
ActorValue Property SpaceshipCrew Auto Const
{ tracks number of crew on a ship }
ReferenceAlias Property Ship Auto Const
ReferenceAlias Property PilotChair Auto Const

;-- Functions ---------------------------------------

Event OnQuestStarted()
  ObjectReference shipRef = Ship.GetRef() ; #DEBUG_LINE_NO:20
  Self.RegisterForRemoteEvent((shipRef as spaceshipreference) as ScriptObject, "OnShipUndock") ; #DEBUG_LINE_NO:22
  Int crewValue = shipRef.GetValue(SpaceshipCrew) as Int ; #DEBUG_LINE_NO:23
  crewValue += -1 ; #DEBUG_LINE_NO:25
  Int I = 0 ; #DEBUG_LINE_NO:27
  While I < crewValue && I < CrewCollection.GetCount() ; #DEBUG_LINE_NO:28
    Actor theCrew = CrewCollection.GetAt(I) as Actor ; #DEBUG_LINE_NO:31
    If I < CrewMarkers.Length ; #DEBUG_LINE_NO:34
      ObjectReference theMarker = CrewMarkers[I].GetRef() ; #DEBUG_LINE_NO:35
      If theMarker ; #DEBUG_LINE_NO:36
        theCrew.MoveTo(theMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:37
        CrewAliases[I].ForceRefTo(theCrew as ObjectReference) ; #DEBUG_LINE_NO:38
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    theCrew.Enable(False) ; #DEBUG_LINE_NO:41
    I += 1 ; #DEBUG_LINE_NO:42
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference pilotChairRef = PilotChair.GetRef() ; #DEBUG_LINE_NO:45
  If pilotChairRef ; #DEBUG_LINE_NO:46
    pilotChairRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SpaceshipReference.OnShipUndock(spaceshipreference akSource, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  Self.Stop() ; #DEBUG_LINE_NO:54
EndEvent

Function testShip()
  ObjectReference shipRef = Ship.GetRef() ; #DEBUG_LINE_NO:58
EndFunction
