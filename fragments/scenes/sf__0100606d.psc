ScriptName Fragments:Scenes:SF__0100606D Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  sq_doctorsscript kmyQuest = Self.GetOwningQuest() as sq_doctorsscript ; #DEBUG_LINE_NO:7
  kmyQuest.HealAddictions() ; #DEBUG_LINE_NO:10
EndFunction
