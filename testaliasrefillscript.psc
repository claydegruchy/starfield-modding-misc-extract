ScriptName TestAliasRefillScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Alias Property ActorFillFromLoadedArea Auto Const
Alias Property RefFillFromLocationAlias Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.StartTimer(5.0, 0) ; #DEBUG_LINE_NO:9
EndEvent

Event OnTimer(Int aiTimerID)
  ActorFillFromLoadedArea.RefillAlias() ; #DEBUG_LINE_NO:13
  RefFillFromLocationAlias.RefillAlias() ; #DEBUG_LINE_NO:14
  Self.StartTimer(5.0, 0) ; #DEBUG_LINE_NO:15
EndEvent
