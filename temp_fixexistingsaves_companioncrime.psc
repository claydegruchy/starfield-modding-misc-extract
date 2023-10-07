ScriptName Temp_FixExistingSaves_CompanionCrime Extends Actor

;-- Variables ---------------------------------------
Bool Done

;-- Properties --------------------------------------
Faction Property PersonalCrimeFaction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  If Done == False ; #DEBUG_LINE_NO:8
    ((Self as Actor) as companioncrimeresponsescript).RegisterForEvents() ; #DEBUG_LINE_NO:10
    Self.SetValue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:11
    Self.SetCrimeFaction(PersonalCrimeFaction) ; #DEBUG_LINE_NO:13
    Done = True ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:23
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:27
EndFunction
