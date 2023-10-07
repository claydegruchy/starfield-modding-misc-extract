ScriptName Fragments:TopicInfos:TIF_TraitQuest_00121730_1 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property Trait_RaisedEnlightenedBoxEnabler Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Trait_RaisedEnlightenedBoxEnabler.setstage(600) ; #DEBUG_LINE_NO:8
EndFunction
