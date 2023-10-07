ScriptName LC119PuzzleButtonScript Extends ObjectReference
{ Turret puzzle button script for LC119. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LC119TurretKeyword Auto Const mandatory
Keyword Property LC119PuzzleDoorLink Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Done") ; #DEBUG_LINE_NO:9
    Self.GetLinkedRef(LC119PuzzleDoorLink).SetOpen(True) ; #DEBUG_LINE_NO:10
    ObjectReference[] turretLinks = Self.GetLinkedRefChain(LC119TurretKeyword, 100) ; #DEBUG_LINE_NO:11
    Int I = 0 ; #DEBUG_LINE_NO:12
    While I < turretLinks.Length ; #DEBUG_LINE_NO:13
      (turretLinks[I] as Actor).SetUnconscious(True) ; #DEBUG_LINE_NO:14
      I += 1 ; #DEBUG_LINE_NO:15
    EndWhile ; #DEBUG_LINE_NO:
  EndEvent
EndState
