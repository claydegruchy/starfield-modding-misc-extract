ScriptName UC04_KilledByPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC04_AttackActive Auto Const mandatory
{ Global used to track if the attack if still currently active }
Int Property StagetoSet = 730 Auto Const
{ Stage to set if this NPC was killed by the player }

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  If UC04_AttackActive.GetValue() >= 1.0 ; #DEBUG_LINE_NO:10
    If akKiller == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:11
      Self.GetOwningQuest().SetStage(StagetoSet) ; #DEBUG_LINE_NO:12
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
