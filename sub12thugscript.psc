ScriptName Sub12ThugScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property City_NA_Viewport03_GangFaction_Combat Auto Const

;-- Functions ---------------------------------------

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  If aeCombatState == 1 ; #DEBUG_LINE_NO:6
    Self.AddToFaction(City_NA_Viewport03_GangFaction_Combat) ; #DEBUG_LINE_NO:7
  EndIf ; #DEBUG_LINE_NO:
EndEvent
