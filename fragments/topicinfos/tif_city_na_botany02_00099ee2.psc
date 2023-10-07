ScriptName Fragments:TopicInfos:TIF_City_NA_Botany02_00099EE2 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SlateVariable Auto Const
ReferenceAlias Property Alias_DataSlate Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  SlateVariable.Mod(1.0) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().AddItem(Alias_DataSlate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:9
EndFunction
