ScriptName BE_KT02_GravitySwitchScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
bescript Property BE_KT02 Auto Const mandatory
wwiseevent Property PowerON Auto Const mandatory
wwiseevent Property PowerOFF Auto Const mandatory
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Minibot Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory

;-- Functions ---------------------------------------

Function GravitySwitch()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:16
  Float myGravity = PlayerRef.GetGravityScale() ; #DEBUG_LINE_NO:17
  If myGravity == 0.0 ; #DEBUG_LINE_NO:18
    BE_KT02.SetShipGravity(1.0) ; #DEBUG_LINE_NO:19
    PowerON.Play(PlayerRef, None, None) ; #DEBUG_LINE_NO:20
    Alias_EnableMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:21
    Alias_AllCrew.EvaluateAll() ; #DEBUG_LINE_NO:22
  Else ; #DEBUG_LINE_NO:
    BE_KT02.SetShipGravity(0.0) ; #DEBUG_LINE_NO:24
    PowerOFF.Play(PlayerRef, None, None) ; #DEBUG_LINE_NO:25
    Alias_EnableMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:26
    Alias_Minibot.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
  Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:29
  Self.goToState("waiting") ; #DEBUG_LINE_NO:30
EndFunction

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
Auto State waiting

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:35
      Self.goToState("Busy") ; #DEBUG_LINE_NO:36
      Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:37
      Self.GravitySwitch() ; #DEBUG_LINE_NO:38
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
