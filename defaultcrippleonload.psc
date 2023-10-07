ScriptName DefaultCrippleOnLoad Extends ObjectReference Const
{ Cripples both left and right mobility of a reference OnLoad() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill_Properties
  ActorValue Property LeftMobilityCondition Auto Const
  ActorValue Property RightMobilityCondition Auto Const
  ActorValue Property LeftAttackCondition Auto Const
  ActorValue Property RightAttackCondition Auto Const
EndGroup

Group CrippleData
  Bool Property LeftLeg = True Auto Const
  Bool Property RightLeg = True Auto Const
  Bool Property LeftArm = False Auto Const
  Bool Property RightArm = False Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If LeftLeg ; #DEBUG_LINE_NO:19
    Self.DamageValue(LeftMobilityCondition, 100.0) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
  If RightLeg ; #DEBUG_LINE_NO:22
    Self.DamageValue(RightMobilityCondition, 100.0) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
  If LeftArm ; #DEBUG_LINE_NO:25
    Self.DamageValue(LeftAttackCondition, 100.0) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
  If RightArm ; #DEBUG_LINE_NO:28
    Self.DamageValue(LeftAttackCondition, 100.0) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent
