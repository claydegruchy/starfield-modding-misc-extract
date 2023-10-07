ScriptName BE_DerelictScript Extends Quest
{ Script to handle additional derelict functions }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group MusicProperties collapsedonbase
  MusicType[] Property MusicTrack Auto Const
  { The array of music tracks. }
  Int Property TrackNumber Auto
  { The music track number in the array we will play. }
  Bool Property RandomTrack = False Auto
  { Default=false. Do we want to play a random track each time the player enters the cell? }
EndGroup

ReferenceAlias Property ModuleCockpit Auto Const mandatory
{ The module cockpit. }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  ObjectReference enemyShipCockpit = ModuleCockpit.GetRef() ; #DEBUG_LINE_NO:20
  Self.RegisterForRemoteEvent(enemyShipCockpit as ScriptObject, "OnCellAttach") ; #DEBUG_LINE_NO:23
  Self.RegisterForRemoteEvent(enemyShipCockpit as ScriptObject, "OnCellDetach") ; #DEBUG_LINE_NO:24
EndEvent

Event ObjectReference.OnCellAttach(ObjectReference akSource)
  If RandomTrack == True ; #DEBUG_LINE_NO:28
    TrackNumber = Utility.RandomInt(0, MusicTrack.Length) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
  Self.PlayMusic(MusicTrack[TrackNumber], True) ; #DEBUG_LINE_NO:31
EndEvent

Event ObjectReference.OnCellDetach(ObjectReference akSource)
  Self.PlayMusic(MusicTrack[TrackNumber], False) ; #DEBUG_LINE_NO:35
EndEvent

Function PlayMusic(MusicType MusicTrack, Bool abPlay)
  If abPlay == True ; #DEBUG_LINE_NO:39
    MusicTrack[TrackNumber].Add() ; #DEBUG_LINE_NO:40
  Else ; #DEBUG_LINE_NO:
    MusicTrack[TrackNumber].Remove() ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
EndFunction
