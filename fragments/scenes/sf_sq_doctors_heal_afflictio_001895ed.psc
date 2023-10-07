ScriptName Fragments:Scenes:SF_SQ_Doctors_Heal_Afflictio_001895ED Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  sq_doctorsscript kmyQuest = Self.GetOwningQuest() as sq_doctorsscript ; #DEBUG_LINE_NO:7
  kmyQuest.HealAfflictions() ; #DEBUG_LINE_NO:10
EndFunction
