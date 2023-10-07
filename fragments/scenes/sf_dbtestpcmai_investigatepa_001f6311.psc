ScriptName Fragments:Scenes:SF_DBTestPCMAI_InvestigatePa_001F6311 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  dbtestpcmaiscript kmyQuest = Self.GetOwningQuest() as dbtestpcmaiscript ; #DEBUG_LINE_NO:7
  kmyQuest.CheckForNearbyPackin() ; #DEBUG_LINE_NO:10
EndFunction
