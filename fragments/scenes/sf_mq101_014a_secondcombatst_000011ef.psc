ScriptName Fragments:Scenes:SF_MQ101_014A_SecondCombatSt_000011EF Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.ShowHelpMessage("ShipLoot") ; #DEBUG_LINE_NO:10
EndFunction
