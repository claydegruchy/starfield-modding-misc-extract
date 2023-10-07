ScriptName GenericMotorScript Extends ObjectReference
{ script for objects with powered rotating motors }

;-- Variables ---------------------------------------
Bool init = False

;-- Properties --------------------------------------
String Property MotorName Auto Const
Float Property MotorVelocity Auto Const
Int Property MotorRotationAxis Auto Const
{ 0 = x, 1 = y, 2 = z }
Float Property MotorForce Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  If init == False ; #DEBUG_LINE_NO:14
    init = True ; #DEBUG_LINE_NO:15
    Float aAxisX = 0.0 ; #DEBUG_LINE_NO:16
    Float aAxisY = 0.0 ; #DEBUG_LINE_NO:17
    Float aAxisZ = 0.0 ; #DEBUG_LINE_NO:18
    If MotorRotationAxis == 0 ; #DEBUG_LINE_NO:19
      aAxisX = MotorVelocity ; #DEBUG_LINE_NO:20
    ElseIf MotorRotationAxis == 1 ; #DEBUG_LINE_NO:21
      aAxisY = MotorVelocity ; #DEBUG_LINE_NO:22
    ElseIf MotorRotationAxis == 2 ; #DEBUG_LINE_NO:23
      aAxisZ = MotorVelocity ; #DEBUG_LINE_NO:24
    EndIf ; #DEBUG_LINE_NO:
    Self.ApplyFanMotor(MotorName, aAxisX, aAxisY, aAxisZ, MotorForce, False) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnPowerOff()
  Self.FanMotorOn(False) ; #DEBUG_LINE_NO:39
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
  If Self.IsDestroyed() == False ; #DEBUG_LINE_NO:44
    Self.FanMotorOn(True) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Self.StartTimer(2.0, 0) ; #DEBUG_LINE_NO:51
EndEvent

Event OnTimer(Int aiTimerID)
  Int openState = Self.GetOpenState() ; #DEBUG_LINE_NO:56
  If openState >= 3 && Self.IsPowered() == True ; #DEBUG_LINE_NO:59
    Self.FanMotorOn(True) ; #DEBUG_LINE_NO:60
  Else ; #DEBUG_LINE_NO:
    Self.FanMotorOn(False) ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  If Self.IsDestroyed() ; #DEBUG_LINE_NO:69
    Self.FanMotorOn(False) ; #DEBUG_LINE_NO:70
  ElseIf aiCurrentStage == 0 ; #DEBUG_LINE_NO:71
    Self.StartTimer(2.0, 0) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
EndEvent
