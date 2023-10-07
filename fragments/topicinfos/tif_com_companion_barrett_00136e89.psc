ScriptName Fragments:TopicInfos:TIF_COM_Companion_Barrett_00136E89 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property COM_AffinityLevel_2_Affection Auto Const mandatory
GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.MakeRomantic() ; #DEBUG_LINE_NO:11
  kmyQuest.SetAffinityLevel(COM_AffinityLevel_3_Commitment) ; #DEBUG_LINE_NO:12
  kmyQuest.RomanceSceneEndedRomantic() ; #DEBUG_LINE_NO:13
EndFunction
