ScriptName Fragments:Scenes:SF_COM_SamCoe_QEvent_MQ204_000D3AEB Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_MQ204 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_15_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_MQ204) ; #DEBUG_LINE_NO:10
EndFunction
