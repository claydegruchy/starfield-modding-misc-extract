ScriptName OE_MissionTerminalQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  LocationAlias Property CurrentMissionTerminalLocation Auto Const mandatory
  ReferenceAlias Property CurrentMissionTerminal Auto Const mandatory
EndGroup

Int Property MissionTerminalObjective = 10 Auto Const

;-- Functions ---------------------------------------

Function PlayerToldAboutMissionTerminal(ObjectReference SpeakerRef)
  Location currentLocation = SpeakerRef.GetCurrentLocation() ; #DEBUG_LINE_NO:13
  CurrentMissionTerminalLocation.ForceLocationTo(currentLocation) ; #DEBUG_LINE_NO:15
  CurrentMissionTerminal.ClearAndRefillAlias() ; #DEBUG_LINE_NO:17
  ObjectReference currentTerminalRef = CurrentMissionTerminal.GetReference() ; #DEBUG_LINE_NO:19
  If currentTerminalRef ; #DEBUG_LINE_NO:23
    Self.SetObjectiveActive(MissionTerminalObjective, True) ; #DEBUG_LINE_NO:24
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveSkipped(MissionTerminalObjective) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlayerActivateMissionTerminal()
  Self.SetObjectiveCompleted(MissionTerminalObjective, True) ; #DEBUG_LINE_NO:33
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:40
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:44
EndFunction
