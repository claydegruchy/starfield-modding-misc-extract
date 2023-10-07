ScriptName Fragments:Scenes:SF_COM_Barrett_QuestEvent_MQ_00318669 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_MQ305 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_11_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_MQ305) ; #DEBUG_LINE_NO:10
EndFunction
