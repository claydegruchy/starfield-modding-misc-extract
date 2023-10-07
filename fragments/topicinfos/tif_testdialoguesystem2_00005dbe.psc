ScriptName Fragments:TopicInfos:TIF_TestDialogueSystem2_00005DBE Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
affinityevent Property TestWillAffinityEvent Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  TestWillAffinityEvent.Send(None) ; #DEBUG_LINE_NO:8
EndFunction
