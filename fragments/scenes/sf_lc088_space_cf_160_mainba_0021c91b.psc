ScriptName Fragments:Scenes:SF_LC088_Space_CF_160_MainBa_0021C91B Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  UCSysDefFaction.SetAlly(PlayerFaction, True, True) ; #DEBUG_LINE_NO:7
  UCSysDefFaction.SetAlly(CrimeFactionCrimsonFleet, True, True) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_End()
  lc088_spacequestscript kmyQuest = Self.GetOwningQuest() as lc088_spacequestscript ; #DEBUG_LINE_NO:16
  UCSysDefFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:19
  UCSysDefFaction.SetEnemy(CrimeFactionCrimsonFleet, False, False) ; #DEBUG_LINE_NO:20
  kmyQuest.SetStageNoWait(161) ; #DEBUG_LINE_NO:21
EndFunction
