ScriptName MQ305PlayerShipAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Armillary Auto Const mandatory
ActorValue Property SpaceshipGravJumpPower Auto Const mandatory
GlobalVariable Property MQArmillaryCompleteGlobal Auto Const mandatory
Scene Property MQ305_000_GravJumpUnity Auto Const mandatory

;-- Functions ---------------------------------------

Event OnShipSystemPowerChange(ActorValue akSystem, Bool abAddPower, Bool abDamageRelated)
  If akSystem == SpaceshipGravJumpPower && abAddPower && abDamageRelated == False ; #DEBUG_LINE_NO:11
    ObjectReference ArmillaryREF = Armillary.GetRef() ; #DEBUG_LINE_NO:13
    Int iArmillaryComplete = MQArmillaryCompleteGlobal.GetValueInt() ; #DEBUG_LINE_NO:14
    ObjectReference ArmillaryShipREF = ArmillaryREF.GetCurrentShipRef() as ObjectReference ; #DEBUG_LINE_NO:15
    spaceshipreference MyShipREF = Self.GetShipReference() ; #DEBUG_LINE_NO:16
    If (ArmillaryShipREF == MyShipREF as ObjectReference) && iArmillaryComplete >= 1 && MyShipREF.IsInSpace() ; #DEBUG_LINE_NO:18
      MQ305_000_GravJumpUnity.Start() ; #DEBUG_LINE_NO:19
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
