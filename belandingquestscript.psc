ScriptName BELandingQuestScript Extends Quest
{ Script for BELandingQuest. }

;-- Variables ---------------------------------------
Int CONST_EncounterMode_Dropship = 1 Const
spaceshipreference shipRef

;-- Properties --------------------------------------
Group Properties
  ReferenceAlias Property Ship Auto Const mandatory
  ActorValue Property SpaceshipCrew Auto Const mandatory
  ActorValue Property SpaceshipLandedValue Auto Const mandatory
  Keyword Property BEDropship Auto Const mandatory
  Keyword Property BEEncounterTypeSurface Auto Const mandatory
  Keyword Property BESurfaceCrewSize_NoCrew Auto Const mandatory
  Keyword Property BESurfaceCrewSize_25Percent Auto Const mandatory
  Keyword Property BESurfaceCrewSize_50Percent Auto Const mandatory
  Keyword Property BESurfaceCrewSize_75Percent Auto Const mandatory
  Keyword Property SpaceshipPreventRampOpenOnLanding Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  shipRef = Ship.GetShipRef() ; #DEBUG_LINE_NO:28
  Self.RegisterForRemoteEvent(shipRef as ScriptObject, "OnShipLanding") ; #DEBUG_LINE_NO:29
  If shipRef.IsLanded() ; #DEBUG_LINE_NO:30
    Self.StartSurfaceEncounter() ; #DEBUG_LINE_NO:31
  Else ; #DEBUG_LINE_NO:
    shipRef.AddKeyword(SpaceshipPreventRampOpenOnLanding) ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SpaceshipReference.OnShipLanding(spaceshipreference akSource, Bool abComplete)
  Self.StartSurfaceEncounter() ; #DEBUG_LINE_NO:41
EndEvent

Function StartSurfaceEncounter()
  Int shipCrewPercent = 0 ; #DEBUG_LINE_NO:47
  If shipRef.HasKeyword(BESurfaceCrewSize_NoCrew) ; #DEBUG_LINE_NO:48
    shipCrewPercent = 0 ; #DEBUG_LINE_NO:49
  ElseIf shipRef.HasKeyword(BESurfaceCrewSize_25Percent) ; #DEBUG_LINE_NO:50
    shipCrewPercent = 25 ; #DEBUG_LINE_NO:51
  ElseIf shipRef.HasKeyword(BESurfaceCrewSize_50Percent) ; #DEBUG_LINE_NO:52
    shipCrewPercent = 50 ; #DEBUG_LINE_NO:53
  ElseIf shipRef.HasKeyword(BESurfaceCrewSize_75Percent) ; #DEBUG_LINE_NO:54
    shipCrewPercent = 75 ; #DEBUG_LINE_NO:55
  Else ; #DEBUG_LINE_NO:
    shipCrewPercent = 100 ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
  Int encounterMode = 0 ; #DEBUG_LINE_NO:61
  If shipRef.HasKeyword(BEDropship) ; #DEBUG_LINE_NO:62
    encounterMode = CONST_EncounterMode_Dropship ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
  BEEncounterTypeSurface.SendStoryEvent(shipRef.GetCurrentLocation(), None, shipRef as ObjectReference, shipCrewPercent, encounterMode) ; #DEBUG_LINE_NO:68
  Self.Stop() ; #DEBUG_LINE_NO:71
EndFunction
