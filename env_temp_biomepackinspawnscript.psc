ScriptName ENV_Temp_BiomePackinSpawnScript Extends ObjectReference Const
{ This is a temporary script until Biome Markers can place Packins directly }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
String Property PackinEditorID Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  String refHexFormID = Utility.IntToHex(Self.GetFormID()) ; #DEBUG_LINE_NO:8
  String consoleCommand = refHexFormID + ".placeatme " + PackinEditorID ; #DEBUG_LINE_NO:10
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:23
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:27
EndFunction
