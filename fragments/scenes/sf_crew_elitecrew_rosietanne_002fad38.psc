ScriptName Fragments:Scenes:SF_CREW_EliteCrew_RosieTanne_002FAD38 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.GiveItemSceneEnded() ; #DEBUG_LINE_NO:10
EndFunction
