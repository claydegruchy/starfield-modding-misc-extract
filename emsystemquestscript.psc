ScriptName EMSystemQuestScript Extends Quest hidden

;-- Variables ---------------------------------------
Int ActorsActive
Int ActorsTotal
Int EncountersActive
Int EncountersInactive
Int EncountersLoaded
Int EncountersTotal

;-- Functions ---------------------------------------

Function IncrementTotal()
  EncountersTotal += 1 ; #DEBUG_LINE_NO:12
EndFunction

Function DecrementTotal()
  EncountersTotal -= 1 ; #DEBUG_LINE_NO:16
EndFunction

Function IncrementActive()
  EncountersActive += 1 ; #DEBUG_LINE_NO:22
EndFunction

Function DecrementActive()
  EncountersActive -= 1 ; #DEBUG_LINE_NO:26
EndFunction

Function UpdateInactive()
  EncountersInactive = EncountersTotal - EncountersActive ; #DEBUG_LINE_NO:31
EndFunction

Function IncrementLoaded()
  EncountersLoaded += 1 ; #DEBUG_LINE_NO:37
EndFunction

Function DecrementLoaded()
  EncountersLoaded -= 1 ; #DEBUG_LINE_NO:41
EndFunction

Function AddToActorsActive(Int AmountToAdd)
  ActorsActive += AmountToAdd ; #DEBUG_LINE_NO:47
EndFunction

Function SubtractFromActorsActive(Int AmounttoSubtract)
  ActorsActive -= AmounttoSubtract ; #DEBUG_LINE_NO:51
EndFunction

Function AddToActorsTotal(Int AmountToAdd)
  ActorsTotal += AmountToAdd ; #DEBUG_LINE_NO:55
EndFunction

Function SubtractFromActorsTotal(Int AmounttoSubtract)
  ActorsTotal -= AmounttoSubtract ; #DEBUG_LINE_NO:59
EndFunction

Function UpdateActorsTotal(Int AmounttoSubtract, Int AmountToAdd)
  ActorsTotal -= AmounttoSubtract ; #DEBUG_LINE_NO:63
  ActorsTotal += AmountToAdd ; #DEBUG_LINE_NO:64
EndFunction

Function UpdateActorsActive(Int AmounttoSubtract, Int AmountToAdd)
  ActorsActive -= AmounttoSubtract ; #DEBUG_LINE_NO:68
  ActorsActive += AmountToAdd ; #DEBUG_LINE_NO:69
EndFunction
