ScriptName Fragments:Scenes:SF_COM_Barrett_QuestEvent_MQ_00318665 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_MQ104A Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_09_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_MQ104A) ; #DEBUG_LINE_NO:10
EndFunction
