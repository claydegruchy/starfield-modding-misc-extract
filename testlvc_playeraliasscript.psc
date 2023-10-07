ScriptName TestLVC_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TESTLVC_ScanPercentTestMessage Auto Const mandatory
{ Message used to display scan percentage }
GlobalVariable Property TestLVC_EnableScanningPercentDisplay Auto Const mandatory
{ Global used to manage the display of the scanned percentage of the current actor on screen }

;-- Functions ---------------------------------------

Event OnPlayerScannedObject(ObjectReference akScannedRef)
  If TestLVC_EnableScanningPercentDisplay.GetValue() >= 1.0 ; #DEBUG_LINE_NO:10
    Float fPercentScanned = 0.0 ; #DEBUG_LINE_NO:11
    TESTLVC_ScanPercentTestMessage.Show(fPercentScanned, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:13
    ActorBase[] currBiomeActors = None ; #DEBUG_LINE_NO:15
    ActorBase[] currBiomeFlora = None ; #DEBUG_LINE_NO:16
    Int I = 0 ; #DEBUG_LINE_NO:21
    Int iLength = currBiomeActors.Length ; #DEBUG_LINE_NO:22
    While I < iLength ; #DEBUG_LINE_NO:24
      ActorBase currBase = currBiomeActors[I] ; #DEBUG_LINE_NO:25
      I += 1 ; #DEBUG_LINE_NO:27
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:39
EndFunction
