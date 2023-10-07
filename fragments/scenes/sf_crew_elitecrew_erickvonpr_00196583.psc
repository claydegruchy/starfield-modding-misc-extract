ScriptName Fragments:Scenes:SF_CREW_EliteCrew_ErickvonPr_00196583 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.FollowSceneEnded() ; #DEBUG_LINE_NO:10
EndFunction
