ScriptName MQ305ArmillaryAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
inputenablelayer MQ305ArmillaryEnableLayer

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const
GlobalVariable Property MQArmillaryCompleteGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  spaceshipreference PlayerShipREF = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:8
  If abRemove ; #DEBUG_LINE_NO:10
    PlayerShipREF.LockPowerAllocation(3, -1, False) ; #DEBUG_LINE_NO:12
    MQ305ArmillaryEnableLayer.EnableGravJump(True) ; #DEBUG_LINE_NO:15
    MQ305ArmillaryEnableLayer = None ; #DEBUG_LINE_NO:16
  ElseIf MQArmillaryCompleteGlobal.GetValueInt() == 1 ; #DEBUG_LINE_NO:17
    PlayerShipREF.LockPowerAllocation(3, -1, True) ; #DEBUG_LINE_NO:19
    PlayerShipREF.SetPartPower(3, -1, 0) ; #DEBUG_LINE_NO:20
    MQ305ArmillaryEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:23
    MQ305ArmillaryEnableLayer.EnableGravJump(False) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent
