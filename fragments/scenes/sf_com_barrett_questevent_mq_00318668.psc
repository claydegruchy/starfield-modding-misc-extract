ScriptName Fragments:Scenes:SF_COM_Barrett_QuestEvent_MQ_00318668 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_MQ207 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_16_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_MQ207) ; #DEBUG_LINE_NO:10
EndFunction
