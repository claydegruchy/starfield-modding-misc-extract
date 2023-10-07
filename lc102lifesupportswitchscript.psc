ScriptName LC102LifeSupportSwitchScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool lifeSupportMachineReset = False

;-- Properties --------------------------------------
GlobalVariable Property LC102LifeSupportResetCount Auto Const
wwiseevent Property WwiseEvent_QST_CF04_LifeSupport_Power_Off Auto Const
wwiseevent Property LifeSupportMachineOffEvent Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If lifeSupportMachineReset == False ; #DEBUG_LINE_NO:10
    Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:11
    ObjectReference machineRunningSoundMarker = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:13
    If machineRunningSoundMarker ; #DEBUG_LINE_NO:15
      machineRunningSoundMarker.Disable(False) ; #DEBUG_LINE_NO:16
    EndIf ; #DEBUG_LINE_NO:
    LifeSupportMachineOffEvent.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:19
    LC102LifeSupportResetCount.value = LC102LifeSupportResetCount.value + 1.0 ; #DEBUG_LINE_NO:21
    If LC102LifeSupportResetCount.value >= 3.0 ; #DEBUG_LINE_NO:23
      WwiseEvent_QST_CF04_LifeSupport_Power_Off.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:24
    EndIf ; #DEBUG_LINE_NO:
    lifeSupportMachineReset = True ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndEvent
