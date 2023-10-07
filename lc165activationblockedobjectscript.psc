ScriptName LC165ActivationBlockedObjectScript Extends ObjectReference
{ Blocks activation on load, optionally hiding activation text and displaying a message on activation. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property ShouldHideActivationText = False Auto Const
Message Property MessageToDisplayOnActivation Auto Const
Int Property RedisplayDelay = 3 Auto Const

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
State WaitingForActivation

  Event OnActivate(ObjectReference akActionRef)
    Self.GoToState("Busy") ; #DEBUG_LINE_NO:21
    MessageToDisplayOnActivation.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:22
    Utility.Wait(RedisplayDelay as Float) ; #DEBUG_LINE_NO:23
    Self.GoToState("WaitingForActivation") ; #DEBUG_LINE_NO:24
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingToForLoad

  Event OnCellLoad()
    Self.BlockActivation(True, ShouldHideActivationText) ; #DEBUG_LINE_NO:10
    If MessageToDisplayOnActivation != None ; #DEBUG_LINE_NO:11
      Self.GoToState("WaitingForActivation") ; #DEBUG_LINE_NO:12
    Else ; #DEBUG_LINE_NO:
      Self.GoToState("Done") ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
