ScriptName Fragments:Scenes:SF_MQ206A_007b_MatteoSpeech_002295AF Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property MatteoKhatri Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin()
  MatteoKhatri.GetActorRef().SetGhost(True) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_End()
  MatteoKhatri.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:15
  Self.GetOwningQuest().SetStage(220) ; #DEBUG_LINE_NO:16
EndFunction
