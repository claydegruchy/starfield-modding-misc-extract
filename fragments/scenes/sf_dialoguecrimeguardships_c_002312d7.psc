ScriptName Fragments:Scenes:SF_DialogueCrimeGuardShips_C_002312D7 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  dialoguecrimeguardsquestscript kmyQuest = Self.GetOwningQuest() as dialoguecrimeguardsquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.PlayerSmuggling() ; #DEBUG_LINE_NO:10
EndFunction
