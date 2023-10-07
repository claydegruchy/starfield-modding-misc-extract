ScriptName Fragments:Scenes:SF_MQ101_013A_FlightScene02__0024E1CF Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_03_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.ShowHelpMessage("ShipSpeed") ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Phase_07_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript ; #DEBUG_LINE_NO:18
  kmyQuest.ShowHelpMessage("ShipBoost") ; #DEBUG_LINE_NO:21
EndFunction
