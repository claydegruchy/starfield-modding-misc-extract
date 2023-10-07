ScriptName Fragments:Scenes:SF_MQ101_013B_SpaceCombatSce_000058C0 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.ShowHelpMessage("WeaponGroup1") ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Phase_07_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript ; #DEBUG_LINE_NO:18
  kmyQuest.ShowHelpMessage("WeaponGroup3") ; #DEBUG_LINE_NO:21
EndFunction
