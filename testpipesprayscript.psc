ScriptName TestPipeSprayScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkTraps Auto Const mandatory
ActorValue Property Health Auto Const mandatory
ActorValue Property HAZ_AV_Broken Auto Const mandatory
ActorValue Property HAZ_AV_Pressurized Auto Const mandatory
Float Property DamageThreshold = 90.0 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference PipeSegment = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:13
  Self.RegisterForActorValueLessThanEvent(PipeSegment, Health, DamageThreshold) ; #DEBUG_LINE_NO:14
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkTraps) as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:15
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.GetLinkedRef(None).Disable(False) ; #DEBUG_LINE_NO:20
  Self.SetValue(HAZ_AV_Broken, 1.0) ; #DEBUG_LINE_NO:21
  If Self.GetValue(HAZ_AV_Pressurized) == 1.0 ; #DEBUG_LINE_NO:22
    Self.StartSpray() ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If Self.GetValue(HAZ_AV_Pressurized) == 1.0 ; #DEBUG_LINE_NO:30
    Self.SetValue(HAZ_AV_Pressurized, 0.0) ; #DEBUG_LINE_NO:31
    Self.StopSpray() ; #DEBUG_LINE_NO:32
  Else ; #DEBUG_LINE_NO:
    Self.SetValue(HAZ_AV_Pressurized, 1.0) ; #DEBUG_LINE_NO:34
    If Self.GetValue(HAZ_AV_Broken) == 1.0 ; #DEBUG_LINE_NO:35
      Self.StartSpray() ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartSpray()
  Self.GetLinkedRef(None).GetLinkedRef(None).Enable(False) ; #DEBUG_LINE_NO:42
EndFunction

Function StopSpray()
  Self.GetLinkedRef(None).GetLinkedRef(None).Disable(False) ; #DEBUG_LINE_NO:46
EndFunction
