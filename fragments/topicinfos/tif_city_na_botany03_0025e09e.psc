ScriptName Fragments:TopicInfos:TIF_City_NA_Botany03_0025E09E Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TreeBranch Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Game.GetPlayer().AddItem(TreeBranch.GetReference() as Form, 1, False) ; #DEBUG_LINE_NO:8
EndFunction
