ScriptName Gang03_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Gang03_HangoutsCleared Auto Const mandatory
ObjectReference Property Gang03_FinaleEntranceMarker Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory

;-- Functions ---------------------------------------

Int Function HangOutsCleared()
  Int nCleared = 0 ; #DEBUG_LINE_NO:5
  If Self.GetStageDone(400) ; #DEBUG_LINE_NO:8
    nCleared += 1 ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:11
    nCleared += 1 ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(600) ; #DEBUG_LINE_NO:14
    nCleared += 1 ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
  Gang03_HangoutsCleared.SetValue(nCleared as Float) ; #DEBUG_LINE_NO:19
  Self.UpdateCurrentInstanceGlobal(Gang03_HangoutsCleared) ; #DEBUG_LINE_NO:20
  Self.SetObjectiveDisplayed(700, True, True) ; #DEBUG_LINE_NO:21
  If nCleared >= 3 ; #DEBUG_LINE_NO:24
    Self.SetStage(700) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MoveStriker(Actor aStriker)
  ObjectReference oTarg = Gang03_FinaleEntranceMarker ; #DEBUG_LINE_NO:31
  aStriker.Disable(True) ; #DEBUG_LINE_NO:32
  aStriker.MoveTo(oTarg, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
  aStriker.RemoveFromFaction(PlayerFaction) ; #DEBUG_LINE_NO:34
  aStriker.Enable(True) ; #DEBUG_LINE_NO:35
EndFunction
