ScriptName Fragments:Scenes:SF_RI01_400_Imogene_Intervie_002C9B7A Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  ri01_questscript kmyQuest = Self.GetOwningQuest() as ri01_questscript ; #DEBUG_LINE_NO:7
  kmyQuest.UnfreezeControls() ; #DEBUG_LINE_NO:10
  Self.GetOwningQuest().SetStage(420) ; #DEBUG_LINE_NO:11
EndFunction
