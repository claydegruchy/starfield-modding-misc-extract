ScriptName Fragments:Scenes:SF_COM_Andreja_QuestEvent_Cr_000EBC5B Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_CrimsonFleet Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_09_Begin()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_CrimsonFleet) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Phase_16_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:18
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_CrimsonFleet) ; #DEBUG_LINE_NO:21
EndFunction
