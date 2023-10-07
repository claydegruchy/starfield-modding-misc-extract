ScriptName COM_CoraHandlerQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  ReferenceAlias Property Cora Auto Const mandatory
  ReferenceAlias Property SamCoe Auto Const mandatory
  LocationAlias Property PlayerShipLocation Auto Const mandatory
  ReferenceAlias Property PlayerShipCrewMarker Auto Const mandatory
  LocationAlias Property LodgeLocation Auto Const mandatory
  ReferenceAlias Property LodgeSandboxMarker Auto Const mandatory
  conditionform Property COM_CND_Cora_OnPlayerShip Auto Const mandatory
  conditionform Property COM_CND_Cora_AtLodge Auto Const mandatory
  conditionform Property COM_Cora_HandlerTeleportingAllowed Auto Const mandatory
  { when this is true and quest has started (MQ103 stage 100 starts it), Cora will teleport to player ship or lodge as needed. }
  ActorValue Property FollowerState Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor SamCoeRef = SamCoe.GetActorReference() ; #DEBUG_LINE_NO:23
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:25
  Self.RegisterForRemoteEvent(SamCoeRef as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:26
  Self.RegisterForActorValueChangedEvent(SamCoeRef as ObjectReference, FollowerState) ; #DEBUG_LINE_NO:27
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  Actor CoraRef = Cora.GetActorReference() ; #DEBUG_LINE_NO:32
  If COM_Cora_HandlerTeleportingAllowed.IsTrue(CoraRef as ObjectReference, None) == False ; #DEBUG_LINE_NO:35
    Return  ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  Location playerShipLoc = PlayerShipLocation.GetLocation() ; #DEBUG_LINE_NO:41
  Location lodgeLoc = LodgeLocation.GetLocation() ; #DEBUG_LINE_NO:42
  ObjectReference moveToRef = None ; #DEBUG_LINE_NO:43
  If (playerShipLoc as Bool && CoraRef.GetCurrentLocation() != playerShipLoc) && COM_CND_Cora_OnPlayerShip.IsTrue(CoraRef as ObjectReference, None) ; #DEBUG_LINE_NO:46
    moveToRef = PlayerShipCrewMarker.GetReference() ; #DEBUG_LINE_NO:47
  ElseIf (lodgeLoc as Bool && CoraRef.GetCurrentLocation() != lodgeLoc) && COM_CND_Cora_AtLodge.IsTrue(CoraRef as ObjectReference, None) ; #DEBUG_LINE_NO:48
    moveToRef = LodgeSandboxMarker.GetReference() ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
  If moveToRef ; #DEBUG_LINE_NO:52
    CoraRef.MoveTo(moveToRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:54
    CoraRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
  ObjectReference SamCoeRef = SamCoe.GetReference() ; #DEBUG_LINE_NO:62
  If akObjRef == SamCoeRef && akActorValue == FollowerState ; #DEBUG_LINE_NO:63
    Float value = SamCoeRef.GetValue(FollowerState) ; #DEBUG_LINE_NO:64
    Cora.GetReference().SetValue(FollowerState, value) ; #DEBUG_LINE_NO:65
    Self.RegisterForActorValueChangedEvent(SamCoeRef, FollowerState) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function TestLodgeCondition()
  Actor CoraRef = Cora.GetActorReference() ; #DEBUG_LINE_NO:74
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:85
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:89
EndFunction
