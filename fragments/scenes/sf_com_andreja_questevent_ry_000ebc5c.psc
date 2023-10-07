ScriptName Fragments:Scenes:SF_COM_Andreja_QuestEvent_Ry_000EBC5C Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_RyujinFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_12_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_RyujinFaction) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Phase_21_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:18
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_RyujinFaction) ; #DEBUG_LINE_NO:21
EndFunction
