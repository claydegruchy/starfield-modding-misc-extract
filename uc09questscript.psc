ScriptName UC09QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias[] Property CabinetNPCAliases Auto Const mandatory
{ Array of Cabinet NPC aliases we use to get everyone in place for the big conversation }
ReferenceAlias Property EmergencyRecording Auto
{ Holding alias for the emergency recording the player uses in the Cabinet scene }

;-- Functions ---------------------------------------

Function GetNPCsInPlace()
  Int I = 0 ; #DEBUG_LINE_NO:10
  Int iLength = CabinetNPCAliases.Length ; #DEBUG_LINE_NO:11
  While I < iLength ; #DEBUG_LINE_NO:13
    Actor currACT = CabinetNPCAliases[I].GetActorRef() ; #DEBUG_LINE_NO:14
    If currACT ; #DEBUG_LINE_NO:17
      currACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:18
      currACT.MoveToPackageLocation() ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:24
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StaggeredEvalPackages()
  Int I = 0 ; #DEBUG_LINE_NO:29
  Int iLength = CabinetNPCAliases.Length ; #DEBUG_LINE_NO:30
  Float minwait = 0.200000003 ; #DEBUG_LINE_NO:31
  Float maxwait = 0.400000006 ; #DEBUG_LINE_NO:32
  While I < iLength ; #DEBUG_LINE_NO:34
    Float fRand = Utility.RandomFloat(minwait, maxwait) ; #DEBUG_LINE_NO:35
    Actor currACT = CabinetNPCAliases[I].GetActorRef() ; #DEBUG_LINE_NO:36
    Utility.Wait(fRand) ; #DEBUG_LINE_NO:37
    currACT.EvaluatePackage(False) ; #DEBUG_LINE_NO:38
    I += 1 ; #DEBUG_LINE_NO:40
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:50
EndFunction
