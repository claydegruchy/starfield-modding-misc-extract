ScriptName TrapPressurizedTankScript Extends ObjectReference
{ Script that handles the pressurized tank trap }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapPressurizedTankData
  Float Property randomAngleRange = 45.0 Auto Const
  { Random range for force applied during boost. 0 = fly straight. }
  Float Property flyForce = 50.0 Auto Const
  { magnitude of the impluse applied on direction modification }
  Float Property impulsePeriod = 1.0 Auto Const
EndGroup

Group Audio
  wwiseevent Property WwiseEvent_TRP_PressurizedTank_AirRelease Auto Const mandatory
EndGroup


;-- State -------------------------------------------
State DestroyedState
EndState

;-- State -------------------------------------------
State FlyingState

  Event OnDestroyed(ObjectReference akDestroyer)
    Self.GotoState("DestroyedState") ; #DEBUG_LINE_NO:
  EndEvent

  Event OnTimer(Int aiTimerID)
    Float eulerAngleX = Self.getAngleX() + Utility.RandomFloat(-1.0 * randomAngleRange, randomAngleRange) ; #DEBUG_LINE_NO:
    Float eulerAngleY = Self.getAngleY() + Utility.RandomFloat(-1.0 * randomAngleRange, randomAngleRange) ; #DEBUG_LINE_NO:
    Float cosX = Math.cos(eulerAngleX) ; #DEBUG_LINE_NO:
    Float cosY = Math.cos(eulerAngleY) ; #DEBUG_LINE_NO:
    Float sinX = Math.sin(eulerAngleX) ; #DEBUG_LINE_NO:
    Float sinY = Math.sin(eulerAngleY) ; #DEBUG_LINE_NO:
    Float angleX = sinY ; #DEBUG_LINE_NO:
    Float angleY = -sinX * cosY ; #DEBUG_LINE_NO:
    Float angleZ = cosX * cosY ; #DEBUG_LINE_NO:
    Self.ApplyHavokImpulse(angleX, angleY, angleZ, flyForce) ; #DEBUG_LINE_NO:
    Self.StartTimer(impulsePeriod, 0) ; #DEBUG_LINE_NO:
  EndEvent

  Event OnBeginState(String asOldState)
    Self.StartTimer(impulsePeriod, 0) ; #DEBUG_LINE_NO:25
    WwiseEvent_TRP_PressurizedTank_AirRelease.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:26
  EndEvent
EndState

;-- State -------------------------------------------
Auto State IdleState

  Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
    Self.GotoState("FlyingState") ; #DEBUG_LINE_NO:19
  EndEvent
EndState
