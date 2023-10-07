ScriptName CF01QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionUC Auto Const mandatory
{ UC crime faction for handling jail/bounty/etc. }

;-- Functions ---------------------------------------

Function SendPlayerToJail()
  CrimeFactionUC.SendPlayerToJail(True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function ModCrimeGold(Int amount)
  CrimeFactionUC.ModCrimeGold(amount, False) ; #DEBUG_LINE_NO:11
EndFunction

Function RemovePlayerContraband()
  CrimeFactionUC.RemovePlayerContrabandAndStolenItems() ; #DEBUG_LINE_NO:15
EndFunction
