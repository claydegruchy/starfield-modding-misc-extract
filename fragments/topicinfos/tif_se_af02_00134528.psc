ScriptName Fragments:TopicInfos:TIF_SE_AF02_00134528 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SE_AF02_CreditCount Auto Const
GlobalVariable Property SE_AF02_CreditsMedium Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  SE_AF02_CreditCount.setvalue(SE_AF02_CreditsMedium.getvalue()) ; #DEBUG_LINE_NO:8
EndFunction
