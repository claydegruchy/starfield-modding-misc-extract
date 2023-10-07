ScriptName Fragments:Scenes:SF_MQ101_013A_FlightScene05__0024E1D2 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_03_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript ; #DEBUG_LINE_NO:7
  Self.GetOwningQuest().SetObjectiveCompleted(106, True) ; #DEBUG_LINE_NO:11
  kmyQuest.ShowHelpMessage("ShipWeapons") ; #DEBUG_LINE_NO:12
EndFunction
