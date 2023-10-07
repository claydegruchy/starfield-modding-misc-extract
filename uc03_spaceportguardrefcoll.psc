ScriptName UC03_SpaceportGuardRefColl Extends RefCollectionAlias

;-- Functions ---------------------------------------

Function MarkCollectionIgnoreFriendlyHits(RefCollectionAlias akTargetCollection, Bool bIgnore)
  Int I = 0 ; #DEBUG_LINE_NO:4
  Int iCount = akTargetCollection.GetCount() ; #DEBUG_LINE_NO:5
  While I < iCount ; #DEBUG_LINE_NO:8
    ObjectReference currObj = akTargetCollection.GetAt(I) ; #DEBUG_LINE_NO:9
    currObj.IgnoreFriendlyHits(bIgnore) ; #DEBUG_LINE_NO:10
    I += 1 ; #DEBUG_LINE_NO:13
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:21
EndFunction
