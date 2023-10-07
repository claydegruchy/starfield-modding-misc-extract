ScriptName Fragments:Scenes:SF_SQ_AlarmSceneCOPY0001_00289563 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  sq_alarmscript kmyQuest = Self.GetOwningQuest() as sq_alarmscript ; #DEBUG_LINE_NO:7
  kmyQuest.SetAlarmed(True) ; #DEBUG_LINE_NO:10
EndFunction
