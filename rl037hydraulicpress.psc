ScriptName RL037HydraulicPress Extends ObjectReference
{ Script for the Hydraulic Lift used for the Mantis' ship. }

;-- Variables ---------------------------------------
Float CONST_DistanceAlongHelper = 0.449999988 Const

;-- Properties --------------------------------------
ObjectReference Property MovementHelperRef Auto Const mandatory
ObjectReference Property LandingEnableRef Auto Const mandatory
ObjectReference Property CollisionEnableRef Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.getPlayer() as ObjectReference ; #DEBUG_LINE_NO:16
      Self.GotoState("Done") ; #DEBUG_LINE_NO:17
      ObjectReference soundMarker = Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:18
      spaceshipreference mantisShipRef = Self.GetLinkedRef(LinkCustom02) as spaceshipreference ; #DEBUG_LINE_NO:19
      CollisionEnableRef.Enable(False) ; #DEBUG_LINE_NO:20
      mantisShipRef.Enable(False) ; #DEBUG_LINE_NO:21
      LandingEnableRef.Enable(False) ; #DEBUG_LINE_NO:22
      sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript ; #DEBUG_LINE_NO:25
      SQ_PlayerShip.AddPlayerOwnedShip(mantisShipRef) ; #DEBUG_LINE_NO:26
      soundMarker.Enable(False) ; #DEBUG_LINE_NO:30
      MovementHelperRef.SetAnimationVariableFloat("Speed", 0.025) ; #DEBUG_LINE_NO:31
      MovementHelperRef.SetAnimationVariableFloat("Position", CONST_DistanceAlongHelper) ; #DEBUG_LINE_NO:32
      MovementHelperRef.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:33
      soundMarker.Disable(False) ; #DEBUG_LINE_NO:34
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
