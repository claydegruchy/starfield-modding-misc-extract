ScriptName CrewRandomVoiceScript Extends Actor

;-- Variables ---------------------------------------
Bool voiceTypeSet = False

;-- Properties --------------------------------------
Group Autofill
  FormList Property CREW_VoiceTypes_Generic Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function TryToSetCrewVoiceType()
  Bool enabled = Self.IsEnabled() ; #DEBUG_LINE_NO:10
  Bool loaded = Self.Is3DLoaded() ; #DEBUG_LINE_NO:11
  If !voiceTypeSet && enabled && loaded ; #DEBUG_LINE_NO:13
    Self.GoToState("Done") ; #DEBUG_LINE_NO:14
    voiceTypeSet = True ; #DEBUG_LINE_NO:16
    VoiceType forcedVoice = Self.SetOverrideVoiceTypeRandom(CREW_VoiceTypes_Generic) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:41
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:45
EndFunction

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnLoad()
    Self.TryToSetCrewVoiceType() ; #DEBUG_LINE_NO:27
  EndEvent
EndState
