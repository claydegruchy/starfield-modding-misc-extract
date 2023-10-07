ScriptName AddPowerRequirement Extends ObjectReference Const
{ Make this activator inaccessible if it does not have power. }

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard UpdatePowerGuard

;-- Properties --------------------------------------
Keyword Property LinkToPowerSource Auto Const mandatory
Message Property PowerRequiredMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Self.GetLinkedRef(LinkToPowerSource).IsPowered() == False ; #DEBUG_LINE_NO:11
    Self.BlockActivation(True, False) ; #DEBUG_LINE_NO:12
    Self.SetActivateTextOverride(PowerRequiredMessage) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkToPowerSource) as ScriptObject, "OnPowerOn") ; #DEBUG_LINE_NO:15
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(LinkToPowerSource) as ScriptObject, "OnPowerOff") ; #DEBUG_LINE_NO:16
EndEvent

Event OnUnload()
  Self.UnregisterForAllEvents() ; #DEBUG_LINE_NO:20
EndEvent

Event ObjectReference.OnPowerOn(ObjectReference akSender, ObjectReference akPowerGenerator)
  Self.StartTimer(0.300000012, 0) ; #DEBUG_LINE_NO:24
EndEvent

Event ObjectReference.OnPowerOff(ObjectReference akSender)
  Self.StartTimer(0.300000012, 0) ; #DEBUG_LINE_NO:28
EndEvent

Event OnTimer(Int aiTimerID)
  Self.UpdatePowerState() ; #DEBUG_LINE_NO:32
EndEvent

Function UpdatePowerState()
  Guard UpdatePowerGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:36
    If Self.GetLinkedRef(LinkToPowerSource).IsPowered() ; #DEBUG_LINE_NO:37
      Self.SetActivateTextOverride(None) ; #DEBUG_LINE_NO:38
      Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:39
    Else ; #DEBUG_LINE_NO:
      Self.BlockActivation(True, False) ; #DEBUG_LINE_NO:41
      Self.SetActivateTextOverride(PowerRequiredMessage) ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction
