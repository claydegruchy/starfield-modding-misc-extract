ScriptName Fragments:Scenes:SF_CREW_EliteCrew_LyleBrew_001C26D1_1 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_Begin()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.UpdateCost() ; #DEBUG_LINE_NO:10
EndFunction
