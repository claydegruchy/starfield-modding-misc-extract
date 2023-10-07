ScriptName CastSpellOnActivate Extends ObjectReference
{ Casts a spell with user as target }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property SpellToCast Auto Const mandatory

;-- Functions ---------------------------------------

Function ArcElectricityToTarget(ObjectReference target)
  If target ; #DEBUG_LINE_NO:16
    SpellToCast.Cast(Self as ObjectReference, target) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State Busy

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GoToState("Busy") ; #DEBUG_LINE_NO:8
    Self.ArcElectricityToTarget(akActionRef) ; #DEBUG_LINE_NO:9
    Self.GoToState("Waiting") ; #DEBUG_LINE_NO:10
  EndEvent
EndState
