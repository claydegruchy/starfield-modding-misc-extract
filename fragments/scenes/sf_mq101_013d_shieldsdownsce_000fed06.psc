ScriptName Fragments:Scenes:SF_MQ101_013d_ShieldsDownSce_000FED06 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.ShowHelpMessage("WeaponGroup2") ; #DEBUG_LINE_NO:10
EndFunction
