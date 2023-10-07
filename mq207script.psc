ScriptName MQ207Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
inputenablelayer Property MQ207EnableLayer Auto hidden
ReferenceAlias Property Hunter Auto Const mandatory
VoiceType Property NPCMKeeperAquilus Auto Const mandatory
VoiceType Property StarbornNPCMHunter Auto Const mandatory
Idle Property Stage1 Auto Const mandatory
Idle Property Stage2 Auto Const mandatory
Idle Property Stage3 Auto Const mandatory
Idle Property Stage4 Auto Const mandatory
wwiseevent Property WwiseEvent_QST_MQ207_StarbornHelmetTransition Auto Const mandatory
Actor[] Property FollowersToldtoWait Auto

;-- Functions ---------------------------------------

Function SwitchToAquilus()
  Actor HunterREF = Hunter.GetActorRef() ; #DEBUG_LINE_NO:18
  HunterREF.SetOverrideVoiceType(NPCMKeeperAquilus) ; #DEBUG_LINE_NO:19
  HunterREF.PlayIdle(Stage3) ; #DEBUG_LINE_NO:20
  WwiseEvent_QST_MQ207_StarbornHelmetTransition.Play(HunterREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:21
EndFunction

Function SwitchToHunter()
  Actor HunterREF = Hunter.GetActorRef() ; #DEBUG_LINE_NO:26
  HunterREF.SetOverrideVoiceType(StarbornNPCMHunter) ; #DEBUG_LINE_NO:27
  HunterREF.PlayIdle(Stage4) ; #DEBUG_LINE_NO:28
  WwiseEvent_QST_MQ207_StarbornHelmetTransition.Play(HunterREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:29
EndFunction
