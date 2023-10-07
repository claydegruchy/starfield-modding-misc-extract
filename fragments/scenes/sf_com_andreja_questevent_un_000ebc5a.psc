ScriptName Fragments:Scenes:SF_COM_Andreja_QuestEvent_Un_000EBC5A Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_UnitedColonies Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_14_End()
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_UnitedColonies) ; #DEBUG_LINE_NO:10
EndFunction
