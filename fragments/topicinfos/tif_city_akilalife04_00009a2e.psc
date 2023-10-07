ScriptName Fragments:TopicInfos:TIF_City_AkilaLife04_00009A2E Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property City_AkilaLife04_400_StonerootInn Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  City_AkilaLife04_400_StonerootInn.Start() ; #DEBUG_LINE_NO:9
EndFunction
