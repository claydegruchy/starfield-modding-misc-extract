ScriptName TrapExplodingProximity Extends TrapExplodingBase
{ Adds the ability to trigger an explosion based on proximity }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapExplodingProximityData
  Keyword Property LinkCustom01 Auto Const mandatory
  { Link Keyword from pivot to living or dead actor trigger }
  Keyword Property LinkCustom02 Auto Const mandatory
  { Link Keyword from pivot to projectile trigger }
  Float Property TimeToExplode = 0.0 Auto Const
  { Number of seconds until explosion }
  Bool Property ProjectileProximityTrigger = True Auto Const
EndGroup


;-- Functions ---------------------------------------

Function HandleOnLoad()
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(None) as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:15
  If Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:16
    Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetLinkedRef(LinkCustom02) ; #DEBUG_LINE_NO:19
    Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkCustom02) as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
  Parent.HandleOnLoad() ; #DEBUG_LINE_NO:23
EndFunction

Function HandleOnUnload()
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(None) as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:27
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:28
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom02) as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:29
  Parent.HandleOnUnload() ; #DEBUG_LINE_NO:30
EndFunction

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:36
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom02) as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:37
  Self.UnregisterForRemoteEvent(Self.GetLinkedRef(None) as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:38
  Self.Disarm() ; #DEBUG_LINE_NO:39
EndEvent

Event OnTimer(Int aiTimerID)
  If bDisarmed == False ; #DEBUG_LINE_NO:43
    Self.Explode() ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  If TimeToExplode > 0.0 ; #DEBUG_LINE_NO:51
    Self.StartTimer(TimeToExplode, 0) ; #DEBUG_LINE_NO:52
    Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom01) as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:53
    Self.UnregisterForRemoteEvent(Self.GetLinkedRef(LinkCustom02) as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:54
  Else ; #DEBUG_LINE_NO:
    Self.Explode() ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
EndEvent
