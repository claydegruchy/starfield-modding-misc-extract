ScriptName Fragments:Scenes:SF_DialogueFCRyujinTower_Min_0000BF58 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property LC044_DRONEDemoRunning Auto Const mandatory
ReferenceAlias Property DemoMiniBot Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  DemoMiniBot.GetActorRef().SetUnconscious(False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Phase_02_End()
  LC044_DRONEDemoRunning.SetValue(0.0) ; #DEBUG_LINE_NO:15
  DemoMiniBot.GetActorRef().SetUnconscious(True) ; #DEBUG_LINE_NO:16
EndFunction
