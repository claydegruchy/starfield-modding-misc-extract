ScriptName Fragments:TopicInfos:TIF_MQ207C_Support_0022D4C4 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Nishina01_I_SecurityOfficeTerminal Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  Alias_Nishina01_I_SecurityOfficeTerminal.GetRef().Unlock(False) ; #DEBUG_LINE_NO:9
EndFunction
