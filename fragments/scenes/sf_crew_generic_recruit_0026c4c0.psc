ScriptName Fragments:Scenes:SF_CREW_Generic_Recruit_0026C4C0 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  crew_genericcrewquestscript kmyQuest = Self.GetOwningQuest() as crew_genericcrewquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.UpdateCost() ; #DEBUG_LINE_NO:10
EndFunction
