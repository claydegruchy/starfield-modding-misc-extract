ScriptName Fragments:Scenes:SF_COM_Barrett_QuestEvent_Eo_00318661 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_FreestarCollective Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_05_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_FreestarCollective) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Phase_07_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:18
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_FreestarCollective) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Phase_09_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:29
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_FreestarCollective) ; #DEBUG_LINE_NO:32
EndFunction
