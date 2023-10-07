ScriptName Fragments:Scenes:SF_SQ_GuardShipsSceneCOPY000_0011C0DE Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.ScanForContraband() ; #DEBUG_LINE_NO:10
EndFunction
