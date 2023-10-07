ScriptName Fragments:Scenes:SF_MS03_Forcegreet_Ryujin_00197E8B Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Juno00 Auto Const
ObjectReference Property JunoDoor Auto Const

;-- Functions ---------------------------------------

Function Fragment_End()
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Phase_01_Begin()
  Juno00.PlayAnimation("Play01") ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Phase_01_End()
  JunoDoor.SetOpen(False) ; #DEBUG_LINE_NO:23
  JunoDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:24
  JunoDoor.SetLockLevel(254) ; #DEBUG_LINE_NO:25
EndFunction
