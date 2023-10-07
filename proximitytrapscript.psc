ScriptName ProximityTrapScript Extends ObjectReference Const
{ Damages itself when linked trigger is entered. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property TimeToExplode = 3.0 Auto Const
Float Property DamageToDo = 100.0 Auto Const
String Property SequenceName = "Play01" Auto Const
{ Effect Sequence to play when this is activated. }
ObjectReference Property TargetArt Auto Const
wwiseevent Property WarningSound Auto Const
Keyword Property IgnoredByTrapFloraKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:15
    Self.RegisterForRemoteEvent(Self.GetLinkedRef(None) as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:16
    Self.RegisterForRemoteEvent(Self.GetLinkedRef(None) as ScriptObject, "OnTriggerLeave") ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterForAllEvents() ; #DEBUG_LINE_NO:22
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  If !akActionRef.HasKeyword(IgnoredByTrapFloraKeyword) ; #DEBUG_LINE_NO:26
    If TimeToExplode != 0.0 ; #DEBUG_LINE_NO:27
      Self.StartTimer(TimeToExplode, 0) ; #DEBUG_LINE_NO:28
      WarningSound.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:31
    Else ; #DEBUG_LINE_NO:
      Self.Explode() ; #DEBUG_LINE_NO:33
      TargetArt.StartSequence(SequenceName, True, 1.0) ; #DEBUG_LINE_NO:34
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  Self.Explode() ; #DEBUG_LINE_NO:41
EndEvent

Function Explode()
  Self.DamageObject(DamageToDo) ; #DEBUG_LINE_NO:45
  Self.UnregisterForAllEvents() ; #DEBUG_LINE_NO:46
EndFunction
