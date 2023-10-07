ScriptName Fragments:Scenes:SF_MQ302_Battle_02_Courtyard_000DBA81 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript ; #DEBUG_LINE_NO:7
  kmyQuest.PerformCourtyardScriptedMassReanimateNoWait() ; #DEBUG_LINE_NO:10
EndFunction
