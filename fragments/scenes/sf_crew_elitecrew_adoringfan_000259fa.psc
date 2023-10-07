ScriptName Fragments:Scenes:SF_CREW_EliteCrew_AdoringFan_000259FA Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.PickupSceneEnded() ; #DEBUG_LINE_NO:10
  Self.GetOwningQuest().SetStage(10) ; #DEBUG_LINE_NO:11
EndFunction
