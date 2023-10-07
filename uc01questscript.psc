ScriptName UC01QuestScript Extends Quest conditional

;-- Structs -----------------------------------------
Struct ReleaseDatum
  ReferenceAlias TargetAlias
  Int ActivationStage
EndStruct


;-- Variables ---------------------------------------
Bool bInCooldown
Bool bProcessing
Int iTimerID = 1 Const

;-- Properties --------------------------------------
Group Globals
  GlobalVariable Property UC01_SectorReleaseCountActivated Auto Const mandatory
  { Global tracking how many releases the player has activated }
  GlobalVariable Property UC01_SectorReleaseCountTotal Auto Const mandatory
  { Global tracking how many total releases the player needs to activate }
EndGroup

Group QuestStagesAndObjs
  Int Property StartExamStage = 300 Auto Const
  { Direct the player to proceed to the examination hall }
  Int Property AdaptabilityObj = 310 Auto Const
  { Objective index for the adaptability exam }
  Int Property UnlockPilotingStage = 400 Auto Const
  { Player's completed the Adaptability exam. Unlock the piloting exam. }
EndGroup

Group ReferenceAliases
  ReferenceAlias[] Property OrientationTargets Auto Const mandatory
  { Array of alias for the orientation targets }
  ReferenceAlias Property CurrentOrientationTarget Auto Const mandatory
  { Alias for the currently active orientation target }
EndGroup


;-- Functions ---------------------------------------

Function UpdateOrientationTarget()
  Int I = 0 ; #DEBUG_LINE_NO:40
  Int iLength = OrientationTargets.Length ; #DEBUG_LINE_NO:41
  While I < iLength ; #DEBUG_LINE_NO:43
    ReferenceAlias currAlias = OrientationTargets[I] ; #DEBUG_LINE_NO:44
    ObjectReference currRef = currAlias.GetRef() ; #DEBUG_LINE_NO:45
    ObjectReference ActiveTarget = CurrentOrientationTarget.GetRef() ; #DEBUG_LINE_NO:46
    If currRef as Bool && currRef != ActiveTarget ; #DEBUG_LINE_NO:48
      CurrentOrientationTarget.ForceRefTo(currRef) ; #DEBUG_LINE_NO:49
      Return  ; #DEBUG_LINE_NO:50
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:53
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function DisplaySceneComplete(ObjectReference akTargetRef)
  While bProcessing ; #DEBUG_LINE_NO:
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:60
  EndWhile ; #DEBUG_LINE_NO:
  bProcessing = True ; #DEBUG_LINE_NO:62
  Int I = 0 ; #DEBUG_LINE_NO:65
  Int iLength = OrientationTargets.Length ; #DEBUG_LINE_NO:66
  Bool bFoundTarget = False ; #DEBUG_LINE_NO:67
  While I < iLength && !bFoundTarget ; #DEBUG_LINE_NO:69
    ReferenceAlias currAlias = OrientationTargets[I] ; #DEBUG_LINE_NO:70
    ObjectReference currRef = currAlias.GetRef() ; #DEBUG_LINE_NO:71
    If currRef == akTargetRef ; #DEBUG_LINE_NO:74
      currAlias.Clear() ; #DEBUG_LINE_NO:76
      Self.UpdateOrientationTarget() ; #DEBUG_LINE_NO:77
      bFoundTarget = True ; #DEBUG_LINE_NO:78
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:81
  EndWhile ; #DEBUG_LINE_NO:
  Int j = iLength - 1 ; #DEBUG_LINE_NO:84
  Bool bScenesRemaining = False ; #DEBUG_LINE_NO:85
  While j >= 0 && !bScenesRemaining ; #DEBUG_LINE_NO:88
    ReferenceAlias curralias = OrientationTargets[j] ; #DEBUG_LINE_NO:89
    ObjectReference AvailableRef = curralias.GetRef() ; #DEBUG_LINE_NO:90
    If curralias.GetRef() != None ; #DEBUG_LINE_NO:93
      bScenesRemaining = True ; #DEBUG_LINE_NO:95
    EndIf ; #DEBUG_LINE_NO:
    j -= 1 ; #DEBUG_LINE_NO:99
  EndWhile ; #DEBUG_LINE_NO:
  If !bScenesRemaining ; #DEBUG_LINE_NO:105
    Self.SetStage(StartExamStage) ; #DEBUG_LINE_NO:106
  EndIf ; #DEBUG_LINE_NO:
  bProcessing = False ; #DEBUG_LINE_NO:109
EndFunction

Function DEBUGSkipCurrentDisplay()
  Self.DisplaySceneComplete(CurrentOrientationTarget.GetRef()) ; #DEBUG_LINE_NO:113
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:120
EndFunction
