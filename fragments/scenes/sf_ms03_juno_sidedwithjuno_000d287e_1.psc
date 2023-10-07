ScriptName Fragments:Scenes:SF_MS03_Juno_SidedWithJuno_000D287E_1 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Juno00 Auto Const
ObjectReference Property JunoPromptTrigger Auto Const

;-- Functions ---------------------------------------

Function Fragment_End()
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:7
  Juno00.PlayAnimation("Play02") ; #DEBUG_LINE_NO:10
  JunoPromptTrigger.BlockActivation(True, True) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Phase_06_Begin()
  Juno00.PlayAnimation("SequenceA03") ; #DEBUG_LINE_NO:21
EndFunction
