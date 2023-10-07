ScriptName Fragments:Scenes:SF_MQ101_016_KreetOrbitScene_00063800 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.ShowHelpMessage("PlanetLanding01") ; #DEBUG_LINE_NO:10
EndFunction
