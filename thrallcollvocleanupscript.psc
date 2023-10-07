ScriptName ThrallCollVOCleanUpScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
Int iTimerID = 1 Const

;-- Properties --------------------------------------
MagicEffect Property CrTerrormorphMindControlEffect_NPC Auto Const mandatory
{ The NPC mind control property }
Int Property TimerLength = 5 Auto Const
{ How frequently we check to see if there's any NPCs in the list that need their VO cleaned up }
VoiceType Property NPCFTerrormorphThrall Auto Const mandatory
{ Female Terrormorph voicetype }
VoiceType Property NPCMTerrormorphThrall Auto Const mandatory
{ Male Terrormorph voicetype }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.StartCheck() ; #DEBUG_LINE_NO:18
EndEvent

Function StartCheck()
  Self.StartTimer(TimerLength as Float, iTimerID) ; #DEBUG_LINE_NO:22
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID ; #DEBUG_LINE_NO:26
    If Self.GetCount() > 0 ; #DEBUG_LINE_NO:27
      Self.RunVOCleanUp() ; #DEBUG_LINE_NO:28
    Else ; #DEBUG_LINE_NO:
      Self.StartCheck() ; #DEBUG_LINE_NO:30
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function RunVOCleanUp()
  Int I = Self.GetCount() - 1 ; #DEBUG_LINE_NO:36
  While I >= 0 ; #DEBUG_LINE_NO:38
    Actor currAct = Self.GetAt(I) as Actor ; #DEBUG_LINE_NO:39
    If currAct != None ; #DEBUG_LINE_NO:41
      Self.AttemptVOCleanUp(currAct) ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:45
  EndWhile ; #DEBUG_LINE_NO:
  Self.StartCheck() ; #DEBUG_LINE_NO:48
EndFunction

Function AttemptVOCleanUp(Actor akActorRef)
  If !akActorRef.HasMagicEffect(CrTerrormorphMindControlEffect_NPC) ; #DEBUG_LINE_NO:52
    VoiceType currVoiceType = akActorRef.GetVoiceType() ; #DEBUG_LINE_NO:53
    If currVoiceType == NPCFTerrormorphThrall || currVoiceType == NPCMTerrormorphThrall ; #DEBUG_LINE_NO:54
      akActorRef.SetOverrideVoiceType(None) ; #DEBUG_LINE_NO:55
    EndIf ; #DEBUG_LINE_NO:
    Self.RemoveRef(akActorRef as ObjectReference) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
EndFunction
