ScriptName Fragments:Scenes:SF_CREW_EliteCrew_RosieTanne_001D3CD1 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_Begin()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.UpdateCost() ; #DEBUG_LINE_NO:10
EndFunction
