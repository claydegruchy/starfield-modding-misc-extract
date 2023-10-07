ScriptName Fragments:Scenes:SF_MQ302_100_Space_InitialCo_00187143 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_07_End()
  lc165spacequestscript kmyQuest = Self.GetOwningQuest() as lc165spacequestscript ; #DEBUG_LINE_NO:7
  kmyQuest.ForceCloakStarbornShips() ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Phase_09_End()
  lc165spacequestscript kmyQuest = Self.GetOwningQuest() as lc165spacequestscript ; #DEBUG_LINE_NO:18
  kmyQuest.ForceCloakStarbornShips() ; #DEBUG_LINE_NO:21
EndFunction
