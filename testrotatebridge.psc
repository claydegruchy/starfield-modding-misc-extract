ScriptName TestRotateBridge Extends ObjectReference
{ Placeholder for rotating bridge }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory
Keyword Property LinkCustom03 Auto Const mandatory
Keyword Property LinkCustom04 Auto Const mandatory
Keyword Property LinkCustom05 Auto Const mandatory
Keyword Property LinkCustom06 Auto Const mandatory
Keyword Property LinkCustom07 Auto Const mandatory
Float Property RotationSpeed = 10.0 Auto Const

;-- State -------------------------------------------
Auto State Closed

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Moving") ; #DEBUG_LINE_NO:
    Self.GetLinkedRef(LinkCustom04).Activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100) ; #DEBUG_LINE_NO:
    Int index = 0 ; #DEBUG_LINE_NO:
    While index < BridgeSegments.Length ; #DEBUG_LINE_NO:
      BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom02), 1.0, RotationSpeed) ; #DEBUG_LINE_NO:
      index += 1 ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
    Self.GotoState("Open") ; #DEBUG_LINE_NO:
    Self.GetLinkedRef(LinkCustom06).Enable(False) ; #DEBUG_LINE_NO:
    Self.GetLinkedRef(LinkCustom05).Disable(False) ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    Self.GetLinkedRef(LinkCustom07).Disable(False) ; #DEBUG_LINE_NO:17
    Self.GetLinkedRef(LinkCustom06).Disable(False) ; #DEBUG_LINE_NO:18
    Self.GetLinkedRef(LinkCustom05).Enable(False) ; #DEBUG_LINE_NO:19
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100) ; #DEBUG_LINE_NO:20
    Int index = 0 ; #DEBUG_LINE_NO:21
    While index < BridgeSegments.Length ; #DEBUG_LINE_NO:22
      BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), 0.0, 0.0) ; #DEBUG_LINE_NO:23
      index += 1 ; #DEBUG_LINE_NO:24
    EndWhile ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State Moving
EndState

;-- State -------------------------------------------
State Open

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Moving") ; #DEBUG_LINE_NO:53
    Self.GetLinkedRef(LinkCustom04).Activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:56
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100) ; #DEBUG_LINE_NO:58
    Int index = BridgeSegments.Length ; #DEBUG_LINE_NO:59
    While index > 0 ; #DEBUG_LINE_NO:60
      index -= 1 ; #DEBUG_LINE_NO:61
      BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), 1.0, RotationSpeed) ; #DEBUG_LINE_NO:62
    EndWhile ; #DEBUG_LINE_NO:
    Self.GotoState("Closed") ; #DEBUG_LINE_NO:64
    Self.GetLinkedRef(LinkCustom05).Enable(False) ; #DEBUG_LINE_NO:65
    Self.GetLinkedRef(LinkCustom06).Disable(False) ; #DEBUG_LINE_NO:66
  EndEvent
EndState
