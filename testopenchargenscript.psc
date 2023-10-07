ScriptName TestOpenCharGenScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Game.ShowRaceMenu(None, 0, None, None, None) ; #DEBUG_LINE_NO:4
  Self.RegisterForMenuOpenCloseEvent("ChargenMenu") ; #DEBUG_LINE_NO:5
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "ChargenMenu" ; #DEBUG_LINE_NO:9
    If abOpening == False ; #DEBUG_LINE_NO:10
      Self.UnRegisterForMenuOpenCloseEvent("ChargenMenu") ; #DEBUG_LINE_NO:11
      Game.FadeOutGame(False, True, 0.0, 0.100000001, False) ; #DEBUG_LINE_NO:12
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
