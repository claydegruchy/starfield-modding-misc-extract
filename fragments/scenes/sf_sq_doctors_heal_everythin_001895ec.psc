ScriptName Fragments:Scenes:SF_SQ_Doctors_Heal_Everythin_001895EC Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  sq_doctorsscript kmyQuest = Self.GetOwningQuest() as sq_doctorsscript ; #DEBUG_LINE_NO:7
  kmyQuest.HealEverything() ; #DEBUG_LINE_NO:10
EndFunction
