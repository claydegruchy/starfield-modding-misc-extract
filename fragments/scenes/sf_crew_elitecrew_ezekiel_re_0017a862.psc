ScriptName Fragments:Scenes:SF_CREW_EliteCrew_Ezekiel_Re_0017A862 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.Recruited() ; #DEBUG_LINE_NO:10
EndFunction
