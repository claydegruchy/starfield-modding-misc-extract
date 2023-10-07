ScriptName FXScripts:TestFXLandingRaycasts Extends ObjectReference
{ Test script for ship landing effects. }

;-- Variables ---------------------------------------
Int ImpactTimer = 10
ObjectReference ObjRef
Bool bPlayImpactEffects = False

;-- Properties --------------------------------------
ImpactDataSet Property ThrusterDustKickupImpacts Auto Const mandatory
{ The impact set that will be spawned from the ship thrusters. }
ImpactDataSet Property ThrusterFireKickupImpacts Auto Const mandatory
{ The impact set that will be spawned very close from the ship thrusters. }
ImpactDataSet Property ThrusterFireMidRangeKickupImpacts Auto Const mandatory
{ The impact set that will be spawned very close from the ship thrusters. }
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property ImpactRange = 45.0 Auto Const
Float Property ImpactMidRange = 13.0 Auto Const
Float Property ImpactCloseRange = 7.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference TestRef = Self as ObjectReference ; #DEBUG_LINE_NO:23
  If TestRef.IsBoundGameObjectAvailable() ; #DEBUG_LINE_NO:24
    Cell ShipCell = TestRef.GetParentCell() ; #DEBUG_LINE_NO:28
    ObjectReference ShipRef = ShipCell.GetParentRef() ; #DEBUG_LINE_NO:31
    ObjRef = TestRef ; #DEBUG_LINE_NO:33
    Self.RegisterForRemoteEvent((ShipRef as spaceshipreference) as ScriptObject, "OnShipLanding") ; #DEBUG_LINE_NO:35
    Self.RegisterForRemoteEvent((ShipRef as spaceshipreference) as ScriptObject, "OnShipTakeOff") ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SpaceshipReference.OnShipLanding(spaceshipreference akSender, Bool abComplete)
  Cell ShipCell = Self.GetParentCell() ; #DEBUG_LINE_NO:41
  ObjectReference ShipRef = ShipCell.GetParentRef() ; #DEBUG_LINE_NO:42
  If ShipRef ; #DEBUG_LINE_NO:44
    If abComplete == False ; #DEBUG_LINE_NO:45
      Self.RegisterForAnimationEvent(ShipRef, "StartImpactFX") ; #DEBUG_LINE_NO:46
      Self.RegisterForAnimationEvent(ShipRef, "StopImpactFX") ; #DEBUG_LINE_NO:47
    Else ; #DEBUG_LINE_NO:
      bPlayImpactEffects = False ; #DEBUG_LINE_NO:49
      Self.UnRegisterForAnimationEvent(ShipRef, "StartImpactFX") ; #DEBUG_LINE_NO:50
      Self.UnRegisterForAnimationEvent(ShipRef, "StopImpactFX") ; #DEBUG_LINE_NO:51
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SpaceshipReference.OnShipTakeOff(spaceshipreference akSender, Bool abComplete)
  Cell ShipCell = Self.GetParentCell() ; #DEBUG_LINE_NO:57
  ObjectReference ShipRef = ShipCell.GetParentRef() ; #DEBUG_LINE_NO:58
  If ShipRef ; #DEBUG_LINE_NO:60
    If abComplete == False ; #DEBUG_LINE_NO:61
      Self.RegisterForAnimationEvent(ShipRef, "StartImpactFX") ; #DEBUG_LINE_NO:62
      Self.RegisterForAnimationEvent(ShipRef, "StopImpactFX") ; #DEBUG_LINE_NO:63
    Else ; #DEBUG_LINE_NO:
      bPlayImpactEffects = False ; #DEBUG_LINE_NO:65
      Self.UnRegisterForAnimationEvent(ShipRef, "StartImpactFX") ; #DEBUG_LINE_NO:66
      Self.UnRegisterForAnimationEvent(ShipRef, "StopImpactFX") ; #DEBUG_LINE_NO:67
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == "StartImpactFX" ; #DEBUG_LINE_NO:80
    bPlayImpactEffects = True ; #DEBUG_LINE_NO:81
    Self.StartTimer(ImpactRecastDelay, ImpactTimer) ; #DEBUG_LINE_NO:83
  EndIf ; #DEBUG_LINE_NO:
  If asEventName == "StopImpactFX" ; #DEBUG_LINE_NO:86
    bPlayImpactEffects = False ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == ImpactTimer ; #DEBUG_LINE_NO:93
    If bPlayImpactEffects == True ; #DEBUG_LINE_NO:94
      If ObjRef ; #DEBUG_LINE_NO:95
        ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster01", 0.0, 0.0, -1.0, ImpactRange, True, False) ; #DEBUG_LINE_NO:96
        ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster01", 0.0, 0.0, -1.0, ImpactCloseRange, True, False) ; #DEBUG_LINE_NO:97
        ObjRef.PlayImpactEffect(ThrusterFireMidRangeKickupImpacts, "ThrusterRayCaster01", 0.0, 0.0, -1.0, ImpactMidRange, True, False) ; #DEBUG_LINE_NO:98
      EndIf ; #DEBUG_LINE_NO:
      Self.StartTimer(ImpactRecastDelay, ImpactTimer) ; #DEBUG_LINE_NO:100
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
