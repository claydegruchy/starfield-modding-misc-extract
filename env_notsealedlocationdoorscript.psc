ScriptName ENV_NotSealedLocationDoorScript Extends ObjectReference Const
{ Script checks planet for oxygen atmosphere and if not found, applies the ENV_Loc_NotSealedEnvironment keyword to the location }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  Keyword Property ENV_Loc_NotSealedEnvironment Auto Const mandatory
  conditionform Property ENV_CND_NotSealedLocationDoorScript_BreathableAtmosphere Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If ENV_CND_NotSealedLocationDoorScript_BreathableAtmosphere.IsTrue(Self as ObjectReference, None) ; #DEBUG_LINE_NO:10
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Location doorLocation = Self.GetCurrentLocation() ; #DEBUG_LINE_NO:14
    doorLocation.AddKeyword(ENV_Loc_NotSealedEnvironment) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:26
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:30
EndFunction
