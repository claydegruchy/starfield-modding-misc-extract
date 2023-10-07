ScriptName Fragments:Scenes:SF_SQ_Doctors_Heal_Wounds_001895EE Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  sq_doctorsscript kmyQuest = Self.GetOwningQuest() as sq_doctorsscript ; #DEBUG_LINE_NO:7
  kmyQuest.HealWounds() ; #DEBUG_LINE_NO:10
EndFunction
