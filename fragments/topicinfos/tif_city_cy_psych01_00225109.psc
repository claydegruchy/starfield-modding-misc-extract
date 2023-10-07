ScriptName Fragments:TopicInfos:TIF_City_CY_Psych01_00225109 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property SlateMarker Auto Const
ReferenceAlias Property Samund Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  ObjectReference myMarker = SlateMarker.GetRef() ; #DEBUG_LINE_NO:8
  ObjectReference myNPC = Samund.GetRef() ; #DEBUG_LINE_NO:9
  myMarker.MoveTo(myNPC, 0.100000001, 0.200000003, 1.0, True, True) ; #DEBUG_LINE_NO:10
EndFunction
