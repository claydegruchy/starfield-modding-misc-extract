ScriptName Fragments:Scenes:SF_UC02_607_TanksPrimed_0026DD07 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_Begin()
  uc02_questscript kmyQuest = Self.GetOwningQuest() as uc02_questscript ; #DEBUG_LINE_NO:7
  kmyQuest.TriggerPumpPrimeAudio(0.0) ; #DEBUG_LINE_NO:10
EndFunction
