ScriptName Debug Extends ScriptObject Native hidden

;-- Functions ---------------------------------------

Function AutomatedTestLogDebug(String asMessage) Global Native

Function AutomatedTestLogError(String asMessage) Global Native

Function AutomatedTestLogProgress(String asMessage) Global Native

Function CenterOnCell(String asCellname) Global Native

Float Function CenterOnCellAndWait(String asCellname) Global Native

Function CloseUserLog(String asLogName) Global Native

Function DBSendPlayerPosition() Global Native

Function DumpAliasData(Quest akQuest) Global Native

Function DumpEventRegistrations(ScriptObject akScript) Global Native

Function EnableAI(Bool abEnable) Global Native

Function EnableCollisions(Bool abEnable) Global Native

Function EnableDetection(Bool abEnable) Global Native

Function EnableMenus(Bool abEnable) Global Native

Function ExecuteConsole(String aCommand) Global Native

String Function GetConfigName() Global Native

String Function GetPlatformName() Global Native

String Function GetVersionNumber() Global Native

Function MessageBox(String asMessageBoxText) Global Native

Function Notification(String asNotificationText) Global Native

Bool Function OpenUserLog(String asLogName) Global Native

Float Function PlayerMoveToAndWait(String asDestRef) Global Native

Function QuitGame() Global Native

Function SetFootIK(Bool abFootIK) Global Native

Function SetGodMode(Bool abGodMode) Global Native

Function ShowRefPosition(ObjectReference arRef) Global Native

Function StartScriptProfiling(String asScriptName) Global Native

Function StartStackProfiling() Global Native

Function StartStackRootProfiling(String asScriptName, ScriptObject akObj) Global Native

Function StopScriptProfiling(String asScriptName) Global Native

Function StopStackProfiling() Global Native

Function StopStackRootProfiling(String asScriptName, ScriptObject akObj) Global Native

Function Trace(String asTextToPrint, Int aiSeverity) Global Native

Function TraceFunction(String asTextToPrint, Int aiSeverity) Global Native

Function TraceStack(String asTextToPrint, Int aiSeverity) Global Native

Bool Function TraceUser(String asUserLog, String asTextToPrint, Int aiSeverity) Global Native

Function TraceConditionalGlobal(String TextToPrint, GlobalVariable ShowTrace) Global
{ As TraceConditional() but checks to make sure the global exists to avoid error messages in the log }
  If ShowTrace as Bool && ShowTrace.value as Bool ; #DEBUG_LINE_NO:117
    Debug.Trace(TextToPrint, 0) ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TraceConditional(String TextToPrint, Bool ShowTrace, Int Severity) Global
{ As Trace() but takes a second parameter bool ShowTrace (which if false suppresses the message). Used to turn off and on traces that might be otherwise annoying. }
  If ShowTrace ; #DEBUG_LINE_NO:126
    Debug.Trace(TextToPrint, Severity) ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TraceAndBox(String asTextToPrint, Int aiSeverity) Global
{ A convenience function to both throw a message box AND write to the trace log, since message boxes sometimes stack in weird ways and won't show up reliably. }
  Debug.MessageBox(asTextToPrint) ; #DEBUG_LINE_NO:134
  Debug.Trace(asTextToPrint, aiSeverity) ; #DEBUG_LINE_NO:135
EndFunction

Function TraceSelf(ScriptObject CallingScript, String FunctionName, String StringToTrace) Global
{ Convenient way to trace the script name and optional function name as a prefix to the trace string
Note, always pass in SELF as the CallingScript }
  FunctionName = "-->" + FunctionName + "():" ; #DEBUG_LINE_NO:143
  Debug.Trace((CallingScript as String + FunctionName) + " " + StringToTrace, 0) ; #DEBUG_LINE_NO:145
EndFunction

Bool Function TraceLog(ScriptObject CallingObject, String asTextToPrint, String logName, String SubLogName, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames, Bool bPrefixTracesWithCallingObject) Global
  String logNamePrefix = "" ; #DEBUG_LINE_NO:153
  String subLogNamePrefix = "" ; #DEBUG_LINE_NO:154
  If bPrefixTraceWithLogNames ; #DEBUG_LINE_NO:155
    logNamePrefix = logName + ": " ; #DEBUG_LINE_NO:156
    subLogNamePrefix = SubLogName + ": " ; #DEBUG_LINE_NO:157
  EndIf ; #DEBUG_LINE_NO:
  String callingObjectPrefix = "" ; #DEBUG_LINE_NO:160
  If bPrefixTracesWithCallingObject ; #DEBUG_LINE_NO:161
    callingObjectPrefix = CallingObject as String + ": " ; #DEBUG_LINE_NO:162
  EndIf ; #DEBUG_LINE_NO:
  String traceString = logNamePrefix + callingObjectPrefix + asTextToPrint ; #DEBUG_LINE_NO:165
  If bShowWarning ; #DEBUG_LINE_NO:167
    traceString = ("WARNING!!! " + CallingObject as String) + ": " + asTextToPrint ; #DEBUG_LINE_NO:169
  EndIf ; #DEBUG_LINE_NO:
  If bShowNormalTrace ; #DEBUG_LINE_NO:173
    Debug.Trace(traceString, aiSeverity) ; #DEBUG_LINE_NO:174
  EndIf ; #DEBUG_LINE_NO:
  Bool returnVal = False ; #DEBUG_LINE_NO:177
  Debug.OpenUserLog(logName) ; #DEBUG_LINE_NO:180
  returnVal = Debug.TraceUser(logName, traceString, aiSeverity) ; #DEBUG_LINE_NO:181
  If SubLogName != "" ; #DEBUG_LINE_NO:183
    SubLogName = logName + "_" + SubLogName ; #DEBUG_LINE_NO:185
    Debug.OpenUserLog(SubLogName) ; #DEBUG_LINE_NO:186
    returnVal = returnVal && Debug.TraceUser(SubLogName, traceString, aiSeverity) ; #DEBUG_LINE_NO:187
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:190
EndFunction
