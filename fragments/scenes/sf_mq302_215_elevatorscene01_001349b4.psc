ScriptName Fragments:Scenes:SF_MQ302_215_ElevatorScene01_001349B4 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript ; #DEBUG_LINE_NO:7
  kmyQuest.SetPlayerControlsEnabled(True) ; #DEBUG_LINE_NO:11
  kmyQuest.DisableElevator01() ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Phase_01_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript ; #DEBUG_LINE_NO:21
  kmyQuest.SetPlayerControlsEnabled(False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Phase_03_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript ; #DEBUG_LINE_NO:34
  kmyQuest.SetupElevators() ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Phase_06_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript ; #DEBUG_LINE_NO:46
  kmyQuest.PlayElevator01NoWait() ; #DEBUG_LINE_NO:50
EndFunction
