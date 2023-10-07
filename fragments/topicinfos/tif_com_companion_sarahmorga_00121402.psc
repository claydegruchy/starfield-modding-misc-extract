ScriptName Fragments:TopicInfos:TIF_COM_Companion_SarahMorga_00121402 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property COM_WantsToTalk_CrimsonFleet Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_CrimsonFleet) ; #DEBUG_LINE_NO:11
EndFunction
