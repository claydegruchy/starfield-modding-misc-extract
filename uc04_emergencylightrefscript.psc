ScriptName UC04_EmergencyLightRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC04_AttackActive Auto Const mandatory
{ Global used to manage the attack state }

;-- Functions ---------------------------------------

Event OnLoad()
  If UC04_AttackActive.GetValue() < 1.0 ; #DEBUG_LINE_NO:7
    Self.PlayAnimation("TurnOffFull") ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
