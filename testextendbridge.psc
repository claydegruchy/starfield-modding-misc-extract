ScriptName TestExtendBridge Extends ObjectReference
{ Placeholder for extending bridge }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
{ LinkRef from Segments to the position marker for the Closed/Retracted Position }
Keyword Property LinkCustom02 Auto Const mandatory
{ LinkRef from Segments to the position marker for the Open/Extended Position }
Keyword Property LinkCustom03 Auto Const mandatory
{ LinkRef Chain through all the moving segments in the system }
Keyword Property LinkCustom04 Auto Const mandatory
{ Link to other activators in the system }
Keyword Property LinkCustom05 Auto Const mandatory
{ Link to Navcut collision volume }
Float Property TranslationSpeed = 1.0 Auto Const
Bool Property StartOpen = False Auto Const
{ Start in the Open/Extended position }
Bool Property BlockNavOnExtendedState = False Auto Const
{ Open is the Extended State, Closed is the Retracted State }

;-- State -------------------------------------------
Auto State Closed

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Moving") ; #DEBUG_LINE_NO:
    Self.GetLinkedRef(LinkCustom04).Activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100) ; #DEBUG_LINE_NO:
    Int index = 0 ; #DEBUG_LINE_NO:
    While index < BridgeSegments.Length ; #DEBUG_LINE_NO:
      BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom02), TranslationSpeed, 0.0) ; #DEBUG_LINE_NO:
      index += 1 ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
    Self.GotoState("Open") ; #DEBUG_LINE_NO:
    Self.GetLinkedRef(LinkCustom05).Disable(False) ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100) ; #DEBUG_LINE_NO:32
    If !StartOpen ; #DEBUG_LINE_NO:33
      Int index = 0 ; #DEBUG_LINE_NO:34
      While index < BridgeSegments.Length ; #DEBUG_LINE_NO:35
        BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), 100.0, 0.0) ; #DEBUG_LINE_NO:36
        index += 1 ; #DEBUG_LINE_NO:37
      EndWhile ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.GetLinkedRef(LinkCustom05).Disable(False) ; #DEBUG_LINE_NO:40
      Int index = 0 ; #DEBUG_LINE_NO:41
      While index < BridgeSegments.Length ; #DEBUG_LINE_NO:42
        BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom02), 100.0, 0.0) ; #DEBUG_LINE_NO:43
        index += 1 ; #DEBUG_LINE_NO:44
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State Moving
EndState

;-- State -------------------------------------------
State Open

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Moving") ; #DEBUG_LINE_NO:76
    Self.GetLinkedRef(LinkCustom05).Enable(False) ; #DEBUG_LINE_NO:77
    Self.GetLinkedRef(LinkCustom04).Activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:79
    ObjectReference[] BridgeSegments = Self.GetLinkedRefChain(LinkCustom03, 100) ; #DEBUG_LINE_NO:81
    Int index = BridgeSegments.Length ; #DEBUG_LINE_NO:82
    While index > 0 ; #DEBUG_LINE_NO:83
      index -= 1 ; #DEBUG_LINE_NO:84
      BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), TranslationSpeed, 0.0) ; #DEBUG_LINE_NO:85
    EndWhile ; #DEBUG_LINE_NO:
    Self.GotoState("Closed") ; #DEBUG_LINE_NO:87
  EndEvent
EndState
