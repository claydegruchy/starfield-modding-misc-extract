ScriptName HavokCorpseOnLoad Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property DoOnce = False Auto

;-- Functions ---------------------------------------

Event OnLoad()
  If DoOnce == False ; #DEBUG_LINE_NO:7
    DoOnce = True ; #DEBUG_LINE_NO:8
    Self.ApplyHavokImpulse(1.0, 1.0, 1.0, 1.0) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
