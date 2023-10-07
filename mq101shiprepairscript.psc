ScriptName MQ101ShipRepairScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ101 Auto Const

;-- State -------------------------------------------
Auto State WaitingForTrigger

  Event OnEffectStart(ObjectReference akShipTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
    If MQ101.GetStageDone(525) ; #DEBUG_LINE_NO:7
      Self.gotoState("hasbeentriggered") ; #DEBUG_LINE_NO:8
      MQ101.SetStage(530) ; #DEBUG_LINE_NO:9
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State hasbeentriggered
EndState
