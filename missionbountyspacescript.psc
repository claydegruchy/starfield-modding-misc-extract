ScriptName MissionBountySpaceScript Extends MissionQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group BountySpace
  RefCollectionAlias Property Escorts Auto Const
  { optional - holds escorts to randomly enable }
  RefCollectionAlias Property SpawnMarkers Auto Const
  { optional - holds spawn markers for escorts }
  ReferenceAlias Property SpaceMapMarker Auto Const mandatory
  Int Property ArriveInSystemStage = 20 Auto Const
  { stage that's set when the player arrives in target system }
EndGroup


;-- Functions ---------------------------------------

Function MissionAccepted(Bool bAccepted)
  Parent.MissionAccepted(bAccepted) ; #DEBUG_LINE_NO:19
  If bAccepted ; #DEBUG_LINE_NO:21
    spaceshipreference targetShip = PrimaryRef.GetShipRef() ; #DEBUG_LINE_NO:23
    targetShip.Enable(False) ; #DEBUG_LINE_NO:24
    SpaceMapMarker.TryToEnableNoWait() ; #DEBUG_LINE_NO:27
    If Escorts as Bool && Escorts.GetCount() > 0 ; #DEBUG_LINE_NO:30
      Int numToEnable = Utility.RandomInt(1, Escorts.GetCount()) ; #DEBUG_LINE_NO:32
      If numToEnable > 0 ; #DEBUG_LINE_NO:34
        ObjectReference[] spawnMarkerArray = new ObjectReference[0] ; #DEBUG_LINE_NO:36
        If SpawnMarkers ; #DEBUG_LINE_NO:37
          spawnMarkerArray = SpawnMarkers.GetArray() ; #DEBUG_LINE_NO:38
        EndIf ; #DEBUG_LINE_NO:
        Int I = 0 ; #DEBUG_LINE_NO:41
        While I < numToEnable ; #DEBUG_LINE_NO:42
          spaceshipreference escortRef = Escorts.GetShipAt(I) ; #DEBUG_LINE_NO:43
          If escortRef ; #DEBUG_LINE_NO:44
            If spawnMarkerArray.Length > 0 ; #DEBUG_LINE_NO:45
              ObjectReference spawnMarkerRef = spawnMarkerArray[0] ; #DEBUG_LINE_NO:46
              escortRef.MoveTo(spawnMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:48
              spawnMarkerArray.remove(0, 1) ; #DEBUG_LINE_NO:49
            EndIf ; #DEBUG_LINE_NO:
            escortRef.Enable(False) ; #DEBUG_LINE_NO:51
          EndIf ; #DEBUG_LINE_NO:
          I += 1 ; #DEBUG_LINE_NO:53
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == ArriveInSystemStage ; #DEBUG_LINE_NO:62
    ObjectReference mapMarkerRef = SpaceMapMarker.GetRef() ; #DEBUG_LINE_NO:63
    mapMarkerRef.SetMarkerUndiscoveredVisibility(0) ; #DEBUG_LINE_NO:65
  ElseIf auiStageID == CompleteStage ; #DEBUG_LINE_NO:66
    ObjectReference mapmarkerref = SpaceMapMarker.GetRef() ; #DEBUG_LINE_NO:67
    mapmarkerref.Disable(False) ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
EndEvent
