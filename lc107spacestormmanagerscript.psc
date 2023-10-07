ScriptName LC107SpaceStormManagerScript Extends ObjectReference
{ Script for the LC107 Space Storm Manager object. }

;-- Variables ---------------------------------------
Float CONST_AmbientShakeDurationMax = 0.5 Const
Float CONST_AmbientShakeDurationMin = 0.200000003 Const
Float CONST_AmbientShakeStrengthMax = 0.050000001 Const
Float CONST_AmbientShakeStrengthMin = 0.01 Const
Float CONST_AmbientShakeTimerDelayMax = 5.0 Const
Float CONST_AmbientShakeTimerDelayMin = 3.0 Const
Int CONST_AmbientShakeTimerID = 1 Const
Int CONST_FarTravelStateDeparture = 0 Const
Int CONST_GravJumpStateAnimStarted = 1 Const
Bool spaceStormIsActive

;-- Properties --------------------------------------
Group RequiredProperties
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
EndGroup

Group AutofillProperties
  VisualEffect Property Space_HazardLightning_BG_00 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnCellAttach()
  Self.StartSpaceStormVFX() ; #DEBUG_LINE_NO:30
EndEvent

Event OnCellDetach()
  Self.StopSpaceStormVFX() ; #DEBUG_LINE_NO:34
EndEvent

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSource, Location aDepartureLocation, Location aArrivalLocation, Int aState)
  Self.StopSpaceStormVFX() ; #DEBUG_LINE_NO:38
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSource, Location aDestination, Int aState)
  If aState == CONST_GravJumpStateAnimStarted ; #DEBUG_LINE_NO:42
    Self.StopSpaceStormVFX() ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartSpaceStormVFX()
  spaceStormIsActive = True ; #DEBUG_LINE_NO:49
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipFarTravel") ; #DEBUG_LINE_NO:50
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipGravJump") ; #DEBUG_LINE_NO:51
  Space_HazardLightning_BG_00.Play(PlayerShip.GetShipRef() as ObjectReference, -1.0, None) ; #DEBUG_LINE_NO:52
  Self.StartTimer(Utility.RandomFloat(CONST_AmbientShakeTimerDelayMin, CONST_AmbientShakeTimerDelayMax), CONST_AmbientShakeTimerID) ; #DEBUG_LINE_NO:53
EndFunction

Function StopSpaceStormVFX()
  spaceStormIsActive = False ; #DEBUG_LINE_NO:57
  Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipFarTravel") ; #DEBUG_LINE_NO:58
  Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipGravJump") ; #DEBUG_LINE_NO:59
  Space_HazardLightning_BG_00.Stop(PlayerShip.GetShipRef() as ObjectReference) ; #DEBUG_LINE_NO:60
EndFunction

Event OnTimer(Int timerID)
  If spaceStormIsActive ; #DEBUG_LINE_NO:64
    Self.PlayAmbientShake() ; #DEBUG_LINE_NO:65
    Self.StartTimer(Utility.RandomFloat(CONST_AmbientShakeTimerDelayMin, CONST_AmbientShakeTimerDelayMax), CONST_AmbientShakeTimerID) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function PlayAmbientShake()
  Float shakeStrength = Utility.RandomFloat(CONST_AmbientShakeStrengthMin, CONST_AmbientShakeStrengthMax) ; #DEBUG_LINE_NO:71
  Float shakeDuration = Utility.RandomFloat(CONST_AmbientShakeDurationMin, CONST_AmbientShakeDurationMax) ; #DEBUG_LINE_NO:72
  Game.ShakeCamera(None, shakeStrength, shakeDuration) ; #DEBUG_LINE_NO:74
EndFunction
