ScriptName Fragments:Scenes:SF_SQ_GuardShipsSceneCOPY000_001581ED Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.ClearScanStatus() ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Phase_04_End()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript ; #DEBUG_LINE_NO:18
  kmyQuest.ScanForContraband() ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Phase_06_Begin()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript ; #DEBUG_LINE_NO:29
  kmyQuest.debugAlarmStatus() ; #DEBUG_LINE_NO:32
EndFunction
