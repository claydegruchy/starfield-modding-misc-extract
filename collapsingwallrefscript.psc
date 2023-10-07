ScriptName CollapsingWallRefScript Extends ObjectReference
{ Script for collapsing wall panels, doors that can only be opened, not closed. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property HideActivationText = False Auto Const
{ Default=True. If True, when the collapsing wall initializes, block its activation text. }

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnLoad()
    Self.BlockActivation(True, HideActivationText) ; #DEBUG_LINE_NO:10
    Self.GoToState("Waiting") ; #DEBUG_LINE_NO:11
  EndEvent
EndState

;-- State -------------------------------------------
State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GoToState("Done") ; #DEBUG_LINE_NO:17
    Self.Activate(akActionRef, True) ; #DEBUG_LINE_NO:18
    Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:19
  EndEvent
EndState
