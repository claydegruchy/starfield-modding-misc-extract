ScriptName Fragments:Scenes:SF_MQ302_196_ShiftTriggerCom_0015578F Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript ; #DEBUG_LINE_NO:7
  kmyQuest.SetPlayerControlsEnabled(False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript ; #DEBUG_LINE_NO:19
  kmyQuest.SetPlayerControlsEnabled(True) ; #DEBUG_LINE_NO:23
EndFunction
