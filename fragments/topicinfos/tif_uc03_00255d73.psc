ScriptName Fragments:TopicInfos:TIF_UC03_00255D73 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC03_DrugNameIndex Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  UC03_DrugNameIndex.SetValue(1.0) ; #DEBUG_LINE_NO:8
EndFunction
