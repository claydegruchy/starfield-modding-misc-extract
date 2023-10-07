ScriptName Fragments:Scenes:SF_COM_SamCoe_QEvent_RyujinI_000DF48F Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_RyujinFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_11_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_RyujinFaction) ; #DEBUG_LINE_NO:10
EndFunction
