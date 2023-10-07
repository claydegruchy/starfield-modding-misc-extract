ScriptName LC044DialogueCrimeGuardsScript Extends Quest
{ special cases for LC044 }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Guard Auto Const mandatory

;-- Functions ---------------------------------------

Function PlayerWinSpeechChallenge()
  Actor guardRef = Alias_Guard.GetActorRef() ; #DEBUG_LINE_NO:7
  Faction crimeFaction = guardRef.GetCrimeFaction() ; #DEBUG_LINE_NO:8
  Self.ClearPlayerBounty(crimeFaction) ; #DEBUG_LINE_NO:10
  Alias_Guard.TryToPlayerPayFine(False, False) ; #DEBUG_LINE_NO:11
EndFunction

Function PlayerGoToDetention()
  Actor guardRef = Alias_Guard.GetActorRef() ; #DEBUG_LINE_NO:15
  Faction crimeFaction = guardRef.GetCrimeFaction() ; #DEBUG_LINE_NO:16
  Self.ClearPlayerBounty(crimeFaction) ; #DEBUG_LINE_NO:18
  crimeFaction.SendPlayerToJail(False, True) ; #DEBUG_LINE_NO:19
EndFunction

Function ClearPlayerBounty(Faction crimeFaction)
  If crimeFaction ; #DEBUG_LINE_NO:23
    crimeFaction.SetCrimeGold(0) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndFunction
