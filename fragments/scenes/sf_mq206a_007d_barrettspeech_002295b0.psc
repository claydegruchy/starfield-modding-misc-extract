ScriptName Fragments:Scenes:SF_MQ206A_007d_BarrettSpeech_002295B0 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Barrett Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin()
  Barrett.GetActorRef().SetGhost(True) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_End()
  Barrett.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:15
  Self.GetOwningQuest().SetStage(230) ; #DEBUG_LINE_NO:16
EndFunction
