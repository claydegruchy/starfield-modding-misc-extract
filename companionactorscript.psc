ScriptName CompanionActorScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  { autofill; this is a pointer to the main companion system quest and script }
  ActorValue Property COM_Affinity Auto Const mandatory
  { Autofill }
  Keyword Property COM_PreventStoryGateScenes Auto Const mandatory
  { Autofill }
EndGroup

Group Properties
  com_companionquestscript Property COM_CompanionQuest Auto Const mandatory
  { Filter for "COM_Companion_*" }
  GlobalVariable Property COM_CompanionID Auto Const mandatory
  { the global "enum" that means this companion. Can be stored in other globals, variables, etc. when needing a numeric ID for this companion }
  Activator Property COM_PQ_TxtReplace_QuestName Auto Const mandatory
  { holds a pointer to an activator with a name the same as the personal quest name, for use in message text replacement.
	
	Filter for:
	COM_PQ_TxtReplace_QuestName* }
EndGroup


;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  SQ_Companions.SetRoleInactive(Self as Actor, True, False, True) ; #DEBUG_LINE_NO:35
  SQ_Companions.SetRoleUnavailable(Self as Actor, True) ; #DEBUG_LINE_NO:36
EndEvent

GlobalVariable Function GetCompanionIDGlobal()
  Return COM_CompanionID ; #DEBUG_LINE_NO:41
EndFunction

Float Function GetCompanionIDValue()
  Return Self.GetCompanionIDGlobal().GetValue() ; #DEBUG_LINE_NO:46
EndFunction

Int Function GetCompanionIDValueInt()
  Return Self.GetCompanionIDGlobal().GetValue() as Int ; #DEBUG_LINE_NO:50
EndFunction

Function SetGlobalToCompanionID(GlobalVariable GlobalToSet)
  Float companionIDValue = Self.GetCompanionIDValue() ; #DEBUG_LINE_NO:56
  GlobalToSet.SetValue(companionIDValue) ; #DEBUG_LINE_NO:60
EndFunction

Bool Function HasGreaterAffinityThanTestedCompanion(CompanionActorScript TestedCompanion)
  Bool returnVal = False ; #DEBUG_LINE_NO:66
  If TestedCompanion == None ; #DEBUG_LINE_NO:69
    returnVal = True ; #DEBUG_LINE_NO:70
  ElseIf Self.GetValue(SQ_Companions.COM_AffinityLevel) > TestedCompanion.GetValue(SQ_Companions.COM_AffinityLevel) ; #DEBUG_LINE_NO:73
    returnVal = True ; #DEBUG_LINE_NO:74
  ElseIf Self.GetValue(SQ_Companions.COM_Affinity) > TestedCompanion.GetValue(SQ_Companions.COM_Affinity) ; #DEBUG_LINE_NO:77
    returnVal = True ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:82
EndFunction

Bool Function IsRomantic()
  Return SQ_Companions.IsCompanionRomantic(Self) ; #DEBUG_LINE_NO:87
EndFunction

Function AddAffinity(Int AmountToAdd)
  Self.AddPassiveAffinity(AmountToAdd as Float) ; #DEBUG_LINE_NO:92
  COM_CompanionQuest.CheckAndSetWantsToTalk(True) ; #DEBUG_LINE_NO:94
EndFunction

Function AllowStoryGatesAndRestartTimer()
  Self.RemoveKeyword(COM_PreventStoryGateScenes) ; #DEBUG_LINE_NO:100
  Self.RestartStoryGateTimer(1) ; #DEBUG_LINE_NO:101
EndFunction

Function RestartStoryGateTimer(Int nextStoryGate)
  COM_CompanionQuest.StartStoryGateTimer(nextStoryGate) ; #DEBUG_LINE_NO:105
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:112
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:116
EndFunction
