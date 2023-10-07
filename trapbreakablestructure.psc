ScriptName TrapBreakableStructure Extends TrapBase
{ Breakable Structure trap script, structure breaks when it is hit by dt_structural damage) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapCatwalkScriptData
  Keyword Property LinkCustom01 Auto Const mandatory
  { Link from pivot to the catwalk segment }
  Keyword Property LinkCustom02 Auto Const mandatory
  { Link from pivot to the NAVCUT volume }
  ActorValue Property Stim_Health_Structural Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function HandleOnLoad()
  If bDisarmed == False ; #DEBUG_LINE_NO:18
    ObjectReference BreakableSegment = Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:19
    Self.GetLinkedRef(LinkCustom02).Disable(False) ; #DEBUG_LINE_NO:20
    Self.RegisterForActorValueLessThanEvent(BreakableSegment, Stim_Health_Structural, 100.0) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandleOnUnload()
  ObjectReference BreakableSegment = Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:27
  Self.UnregisterForActorValueLessThanEvent(BreakableSegment, Stim_Health_Structural, 100.0) ; #DEBUG_LINE_NO:29
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.BreakStructure() ; #DEBUG_LINE_NO:35
EndEvent

Function BreakStructure()
  Self.Disarm() ; #DEBUG_LINE_NO:41
  Self.GetLinkedRef(LinkCustom01).Disable(False) ; #DEBUG_LINE_NO:43
  Self.GetLinkedRef(LinkCustom02).Enable(False) ; #DEBUG_LINE_NO:44
EndFunction
