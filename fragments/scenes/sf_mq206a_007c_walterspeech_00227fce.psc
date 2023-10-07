ScriptName Fragments:Scenes:SF_MQ206A_007c_WalterSpeech_00227FCE Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property WalterStroud Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin()
  WalterStroud.GetActorRef().SetGhost(True) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_End()
  WalterStroud.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:15
  Self.GetOwningQuest().SetStage(240) ; #DEBUG_LINE_NO:16
EndFunction
