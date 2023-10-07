ScriptName Fragments:Scenes:SF_MS03_Juno_BoardInstalle_000D2880_1 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Juno00 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End()
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Phase_02_Begin()
  Juno00.PlayAnimation("SequenceA02") ; #DEBUG_LINE_NO:15
EndFunction
