ScriptName SpaceStormBoltEffectScript Extends ActiveMagicEffect
{ Script for SpaceStormBoltVFXEffect, the space storm bolt strike effect. }

;-- Variables ---------------------------------------
Float CONST_CameraShakeStrength_Max_InPilotSeat = 0.600000024 Const
Float CONST_CameraShakeStrength_Max_NotInPilotSeat = 0.100000001 Const
Float CONST_CameraShakeStrength_Min_InPilotSeat = 0.200000003 Const
Float CONST_CameraShakeStrength_Min_NotInPilotSeat = 0.01 Const
Float CONST_ControllerShakeStrength_Max_InPilotSeat = 0.600000024 Const
Float CONST_ControllerShakeStrength_Max_NotInPilotSeat = 0.100000001 Const
Float CONST_ControllerShakeStrength_Min_InPilotSeat = 0.200000003 Const
Float CONST_ControllerShakeStrength_Min_NotInPilotSeat = 0.01 Const
Float CONST_IgnoreChance_NotInPilotSeat = 0.5 Const
Float CONST_ShakeDuration_Max_InPilotSeat = 0.899999976 Const
Float CONST_ShakeDuration_Max_NotInPilotSeat = 0.600000024 Const
Float CONST_ShakeDuration_Min_InPilotSeat = 0.5 Const
Float CONST_ShakeDuration_Min_NotInPilotSeat = 0.300000012 Const

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const mandatory
ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Float cameraShakeStrength = 0.0 ; #DEBUG_LINE_NO:30
  Float controllerShakeStrength = 0.0 ; #DEBUG_LINE_NO:31
  Float shakeDuration = 0.0 ; #DEBUG_LINE_NO:32
  If akTarget == PlayerShip.GetRef() ; #DEBUG_LINE_NO:33
    If Game.GetPlayer().GetFurnitureUsing() == PlayerShipPilotSeat.GetRef() ; #DEBUG_LINE_NO:34
      cameraShakeStrength = Utility.RandomFloat(CONST_CameraShakeStrength_Min_NotInPilotSeat, CONST_CameraShakeStrength_Max_NotInPilotSeat) ; #DEBUG_LINE_NO:35
      controllerShakeStrength = Utility.RandomFloat(CONST_ControllerShakeStrength_Min_NotInPilotSeat, CONST_ControllerShakeStrength_Max_NotInPilotSeat) ; #DEBUG_LINE_NO:36
      shakeDuration = Utility.RandomFloat(CONST_ShakeDuration_Min_NotInPilotSeat, CONST_ShakeDuration_Max_NotInPilotSeat) ; #DEBUG_LINE_NO:37
    ElseIf Utility.RandomFloat(0.0, 1.0) < CONST_IgnoreChance_NotInPilotSeat ; #DEBUG_LINE_NO:38
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      cameraShakeStrength = Utility.RandomFloat(CONST_CameraShakeStrength_Min_InPilotSeat, CONST_CameraShakeStrength_Max_InPilotSeat) ; #DEBUG_LINE_NO:41
      controllerShakeStrength = Utility.RandomFloat(CONST_ControllerShakeStrength_Min_InPilotSeat, CONST_ControllerShakeStrength_Max_InPilotSeat) ; #DEBUG_LINE_NO:42
      shakeDuration = Utility.RandomFloat(CONST_ShakeDuration_Min_InPilotSeat, CONST_ShakeDuration_Max_InPilotSeat) ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
    If shakeDuration > 0.0 ; #DEBUG_LINE_NO:46
      Game.ShakeController(controllerShakeStrength, controllerShakeStrength, shakeDuration) ; #DEBUG_LINE_NO:47
      Game.ShakeCamera(None, cameraShakeStrength, shakeDuration) ; #DEBUG_LINE_NO:48
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
