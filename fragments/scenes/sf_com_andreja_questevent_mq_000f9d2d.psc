ScriptName Fragments:Scenes:SF_COM_Andreja_QuestEvent_MQ_000F9D2D Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_MQ305 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_12_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_MQ305) ; #DEBUG_LINE_NO:10
EndFunction
