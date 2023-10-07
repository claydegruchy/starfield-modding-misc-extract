ScriptName CompanionDebugScript Extends Actor
{ holds various functions for ease of debugging that you can call directly on the actor from the console }

;-- Structs -----------------------------------------
Struct QuestStageDatum
  Quest QuestToSet
  Int StageToSet
EndStruct


;-- Variables ---------------------------------------
companionactorscript CompanionRef

;-- Properties --------------------------------------
ActorValue Property COM_DEBUG_OnPlayerShip Auto Const mandatory
{ autofill }
companiondebugscript:queststagedatum[] Property QuestStageData Auto Const
{ set quest stages when Calling DebugMakeActiveCompanion to prepare them for being testable as companions }
sq_companions_activecompanionscript Property ActiveCompanion Auto Const mandatory
{ pointer to ActiveCompanion alias in SQ_Companions }

;-- Functions ---------------------------------------

Function DebugIsPlayerLoitering()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function DebugTestConditionForm(conditionform ConditionFormToTest)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnInit()
  CompanionRef = (Self as Actor) as companionactorscript ; #DEBUG_LINE_NO:21
EndEvent

Function DebugMakeAvailableCompanion()
  CompanionRef.SQ_Companions.SetRoleAvailable(Self as Actor, True) ; #DEBUG_LINE_NO:26
  CompanionRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
EndFunction

Function DebugMakeActiveCompanion()
  If QuestStageData.Length > 0 ; #DEBUG_LINE_NO:33
    Int I = 0 ; #DEBUG_LINE_NO:34
    While I < QuestStageData.Length ; #DEBUG_LINE_NO:35
      companiondebugscript:queststagedatum currentDatum = QuestStageData[I] ; #DEBUG_LINE_NO:36
      currentDatum.QuestToSet.SetStage(currentDatum.StageToSet) ; #DEBUG_LINE_NO:37
      I += 1 ; #DEBUG_LINE_NO:38
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  CompanionRef.RemoveKeyword(CompanionRef.COM_PreventStoryGateScenes) ; #DEBUG_LINE_NO:42
  CompanionRef.SQ_Companions.SetRoleActive(Self as Actor, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:43
  CompanionRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function DebugMakeInactiveCompanion()
  CompanionRef.SQ_Companions.SetRoleInactive(Self as Actor, True, False, True) ; #DEBUG_LINE_NO:49
EndFunction

Function DebugSetAffinityLevel(GlobalVariable AffinityLevel)
  CompanionRef.SQ_Companions.SetAffinityLevel(Self as Actor, AffinityLevel) ; #DEBUG_LINE_NO:54
EndFunction

Function DebugModAffinity(Float Amount)
  CompanionRef.SQ_Companions.DebugModAffinity(Self as Actor, Amount) ; #DEBUG_LINE_NO:59
EndFunction

Function DebugSetStoryGateTimerComplete()
  CompanionRef.COM_CompanionQuest.DebugSetStoryGateTimerComplete() ; #DEBUG_LINE_NO:64
EndFunction

Function DebugSetAngerLevel(GlobalVariable AngerLevel, GlobalVariable AngerReason)
  CompanionRef.COM_CompanionQuest.SetAngerLevel(AngerLevel, AngerReason) ; #DEBUG_LINE_NO:69
EndFunction

Function DebugExpireAngerCoolDownTimer()
  CompanionRef.COM_CompanionQuest.ExpireAngerCoolDownTimer() ; #DEBUG_LINE_NO:74
EndFunction

Function DebugAwardSecondChance()
  CompanionRef.COM_CompanionQuest.AwardSecondChance() ; #DEBUG_LINE_NO:79
EndFunction

Function DebugMakeRomantic()
  ActorValue COM_AffinityLevel = CompanionRef.SQ_Companions.COM_AffinityLevel ; #DEBUG_LINE_NO:83
  GlobalVariable COM_AffinityLevel_2_Affection = CompanionRef.SQ_Companions.COM_AffinityLevel_2_Affection ; #DEBUG_LINE_NO:84
  If CompanionRef.GetValue(COM_AffinityLevel) < COM_AffinityLevel_2_Affection.GetValue() ; #DEBUG_LINE_NO:86
    CompanionRef.COM_CompanionQuest.SetAffinityLevel(COM_AffinityLevel_2_Affection) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
  CompanionRef.COM_CompanionQuest.MakeRomantic() ; #DEBUG_LINE_NO:91
EndFunction

Function DebugSetOnPlayerShip()
  CompanionRef.SetValue(COM_DEBUG_OnPlayerShip, 1.0) ; #DEBUG_LINE_NO:105
EndFunction

Function DebugExpireFlirtCooldown()
  CompanionRef.SetValue(CompanionRef.COM_CompanionQuest.COM_FlirtCooldownExpiry, 0.0) ; #DEBUG_LINE_NO:110
EndFunction

Function DebugExpireTravelAffinityCoolDown()
  ActiveCompanion.StartTimer_AffinityTravelCoolDown(True) ; #DEBUG_LINE_NO:115
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:122
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:126
EndFunction
