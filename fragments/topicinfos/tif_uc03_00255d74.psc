ScriptName Fragments:TopicInfos:TIF_UC03_00255D74 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC03_DrugNameIndexHolding Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  UC03_DrugNameIndexHolding.SetValue(3.0) ; #DEBUG_LINE_NO:8
EndFunction
