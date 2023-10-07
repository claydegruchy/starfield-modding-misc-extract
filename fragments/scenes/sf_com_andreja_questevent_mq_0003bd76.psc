ScriptName Fragments:Scenes:SF_COM_Andreja_QuestEvent_MQ_0003BD76 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_MQ106 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_13_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_MQ106) ; #DEBUG_LINE_NO:10
EndFunction
