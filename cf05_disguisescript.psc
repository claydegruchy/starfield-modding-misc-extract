ScriptName CF05_DisguiseScript Extends Quest

;-- Variables ---------------------------------------
Int CF05TimerID = 10 Const

;-- Properties --------------------------------------
Faction[] Property MyFaction Auto Const mandatory
Keyword Property CF05_EnsignArmorKeyword_Disguise Auto Const mandatory
Float Property TimeDelay Auto Const mandatory

;-- Functions ---------------------------------------

Function AddPlayerToFaction()
  Int I = 0 ; #DEBUG_LINE_NO:10
  While I < MyFaction.Length ; #DEBUG_LINE_NO:11
    Game.GetPlayer().AddtoFaction(MyFaction[I]) ; #DEBUG_LINE_NO:12
    I += 1 ; #DEBUG_LINE_NO:13
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RemovePlayerFromFaction()
  Int I = 0 ; #DEBUG_LINE_NO:18
  While I < MyFaction.Length ; #DEBUG_LINE_NO:19
    Game.GetPlayer().RemoveFromFaction(MyFaction[I]) ; #DEBUG_LINE_NO:20
    I += 1 ; #DEBUG_LINE_NO:21
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RunTimer()
  Self.CancelTimer(CF05TimerID) ; #DEBUG_LINE_NO:26
  Self.StartTimer(TimeDelay, CF05TimerID) ; #DEBUG_LINE_NO:27
EndFunction

Event OnTimer(Int timerID)
  If timerID == CF05TimerID ; #DEBUG_LINE_NO:31
    Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:32
    If PlayerRef.WornHasKeyword(CF05_EnsignArmorKeyword_Disguise) ; #DEBUG_LINE_NO:34
      Self.AddPlayerToFaction() ; #DEBUG_LINE_NO:35
    Else ; #DEBUG_LINE_NO:
      Self.RemovePlayerFromFaction() ; #DEBUG_LINE_NO:37
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
