ScriptName Fragments:Scenes:SF_UC_CY_HeatleechScene_Scen_0018B2B2 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:7
  OQ.SetStage(210) ; #DEBUG_LINE_NO:8
  OQ.SetStage(250) ; #DEBUG_LINE_NO:9
EndFunction
