ScriptName BEObjectiveBlockPilotSeatScript Extends ReferenceAlias
{ For BEObjective, a variant of BEBlockPilotSeatScript to handle the alias being force-filled by a different quest. }

;-- Variables ---------------------------------------
Bool blockedUntilAllCrewDead
Bool blockedUntilGravityRestored
bescript owningBEQuest

;-- Properties --------------------------------------
RefCollectionAlias Property AllCrew Auto Const mandatory
{ BEObjective's AllCrew RefCollectionAlias. }
Message Property BE_Objective_SecureShipMessage Auto Const mandatory
{ Message to display when the player tries to sit in the ship's pilot seat while the block is in place. }

;-- Functions ---------------------------------------

Function BlockTakeover(bescript ownerQuest)
  owningBEQuest = ownerQuest ; #DEBUG_LINE_NO:17
  (Self.GetRef() as pilotseatfurniturescript).SuppressDefaultActivationBlockedMessage(True) ; #DEBUG_LINE_NO:18
  If AllCrew.GetCount() > 0 ; #DEBUG_LINE_NO:19
    blockedUntilAllCrewDead = True ; #DEBUG_LINE_NO:20
    Self.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:21
    Self.RegisterForCustomEvent(owningBEQuest as ScriptObject, "bescript_BEAllCrewDead") ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
  If owningBEQuest.ShipGravity < 1.0 ; #DEBUG_LINE_NO:24
    blockedUntilGravityRestored = True ; #DEBUG_LINE_NO:25
    Self.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event BEScript.BEAllCrewDead(bescript source, Var[] akArgs)
  blockedUntilAllCrewDead = False ; #DEBUG_LINE_NO:31
EndEvent

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActivator)
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:37
    If blockedUntilAllCrewDead ; #DEBUG_LINE_NO:38
      BE_Objective_SecureShipMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:39
    ElseIf blockedUntilGravityRestored ; #DEBUG_LINE_NO:
      blockedUntilGravityRestored = False ; #DEBUG_LINE_NO:41
      owningBEQuest.SetShipGravity(1.0) ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
    If blockedUntilAllCrewDead || blockedUntilGravityRestored ; #DEBUG_LINE_NO:44
      Self.GotoState("Waiting") ; #DEBUG_LINE_NO:45
    Else ; #DEBUG_LINE_NO:
      Self.GotoState("Done") ; #DEBUG_LINE_NO:47
      ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:48
      myRef.BlockActivation(False, False) ; #DEBUG_LINE_NO:49
      Self.UnregisterForCustomEvent(owningBEQuest as ScriptObject, "bescript_BEAllCrewDead") ; #DEBUG_LINE_NO:50
      myRef.Activate(akActivator, False) ; #DEBUG_LINE_NO:51
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
