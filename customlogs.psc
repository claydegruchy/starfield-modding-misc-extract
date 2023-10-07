ScriptName CustomLogs Extends ScriptObject

;-- Structs -----------------------------------------
Struct LogDatum
  String MainLogName
  { Main log to trace to }
  String SubLogName
  { Sub log to trace to }
  Bool PrefixTracesWithLogNames
  { if true, will prefix traces with log names }
  Bool PrefixTracesWithCallingObject
  { if true, will prefix traces with calling object }
  String Prefix
  { prefix to add to all traces (after log names if PrefixTracesWithLogNames == true) }
  Bool ShowNormalTraces
  { ALSO print to standard papyrus.0.log }
EndStruct


;-- Functions ---------------------------------------

Function AddCustomLog(customlogs:logdatum[] ArrayOfLogs, String MainLogName, String SubLogName, Bool PrefixTracesWithLogNames, Bool PrefixTracesWithCallingObject, String Prefix, Bool ShowNormalTraces) Global
  customlogs:logdatum newLog = new customlogs:logdatum ; #DEBUG_LINE_NO:24
  newLog.MainLogName = MainLogName ; #DEBUG_LINE_NO:25
  newLog.SubLogName = SubLogName ; #DEBUG_LINE_NO:26
  newLog.PrefixTracesWithLogNames = PrefixTracesWithLogNames ; #DEBUG_LINE_NO:27
  newLog.PrefixTracesWithCallingObject = PrefixTracesWithCallingObject ; #DEBUG_LINE_NO:28
  newLog.Prefix = Prefix ; #DEBUG_LINE_NO:29
  newLog.ShowNormalTraces = ShowNormalTraces ; #DEBUG_LINE_NO:30
  ArrayOfLogs.add(newLog, 1) ; #DEBUG_LINE_NO:32
EndFunction

Function Trace(customlogs:logdatum[] ArrayOfLogs, ScriptObject CallingObject, String asTextToPrint, Int aiSeverity) Global
  Int I = 0 ; #DEBUG_LINE_NO:36
  While I < ArrayOfLogs.Length ; #DEBUG_LINE_NO:37
    customlogs:logdatum currentLog = ArrayOfLogs[I] ; #DEBUG_LINE_NO:38
    If currentLog.Prefix != "" ; #DEBUG_LINE_NO:40
      asTextToPrint = currentLog.Prefix + ": " + asTextToPrint ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
    Debug.TraceLog(CallingObject, asTextToPrint, currentLog.MainLogName, currentLog.SubLogName, aiSeverity, currentLog.ShowNormalTraces, False, currentLog.PrefixTracesWithLogNames, currentLog.PrefixTracesWithCallingObject) ; #DEBUG_LINE_NO:44
    I += 1 ; #DEBUG_LINE_NO:46
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function warning(customlogs:logdatum[] ArrayOfLogs, ScriptObject CallingObject, String asTextToPrint) Global
  Int I = 0 ; #DEBUG_LINE_NO:51
  While I < ArrayOfLogs.Length ; #DEBUG_LINE_NO:52
    customlogs:logdatum currentLog = ArrayOfLogs[I] ; #DEBUG_LINE_NO:53
    If currentLog.Prefix != "" ; #DEBUG_LINE_NO:55
      asTextToPrint = currentLog.Prefix + ": " + asTextToPrint ; #DEBUG_LINE_NO:56
    EndIf ; #DEBUG_LINE_NO:
    Game.warning("WARNING!!! " + asTextToPrint) ; #DEBUG_LINE_NO:61
    I += 1 ; #DEBUG_LINE_NO:63
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
