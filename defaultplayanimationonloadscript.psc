ScriptName DefaultPlayAnimationOnLoadScript Extends ObjectReference default

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
String Property AnimationToPlay Auto Const mandatory
Bool Property PlayAnimationOnlyOnce = False Auto Const

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State PlayAnim

  Event OnLoad()
    If PlayAnimationOnlyOnce ; #DEBUG_LINE_NO:8
      Self.GotoState("Done") ; #DEBUG_LINE_NO:9
    EndIf ; #DEBUG_LINE_NO:
    Self.PlayAnimation(AnimationToPlay) ; #DEBUG_LINE_NO:12
  EndEvent
EndState
