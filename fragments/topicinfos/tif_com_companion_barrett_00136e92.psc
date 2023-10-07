ScriptName Fragments:TopicInfos:TIF_COM_Companion_Barrett_00136E92 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property COM_AffinityLevel_1_Friendship Auto Const mandatory
GlobalVariable Property COM_AffinityLevel_2_Affection Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  com_companionquestscript kmyQuest = Self.GetOwningQuest() as com_companionquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.MakeNotRomantic() ; #DEBUG_LINE_NO:11
  kmyQuest.MakeNotCommitted(False) ; #DEBUG_LINE_NO:12
EndFunction
