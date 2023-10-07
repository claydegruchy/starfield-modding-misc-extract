ScriptName UC05_PlaySoundonActivate Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property SuccessSound Auto Const mandatory
wwiseevent Property FailureSound Auto Const mandatory
Quest Property myQuest Auto Const mandatory
Int Property HasKey Auto Const mandatory
Int Property AccessGranted Auto Const mandatory
Keyword Property BlockPlayerActivation Auto Const mandatory

;-- State -------------------------------------------
State busy
EndState

;-- State -------------------------------------------
Auto State waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.goToState("busy") ; #DEBUG_LINE_NO:18
    If (akActionRef == Game.GetPlayer() as ObjectReference) && myQuest.GetStageDone(HasKey) && !myQuest.GetStageDone(AccessGranted) ; #DEBUG_LINE_NO:19
      SuccessSound.PlayAndWait(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:20
      Self.AddKeyword(BlockPlayerActivation) ; #DEBUG_LINE_NO:21
    EndIf ; #DEBUG_LINE_NO:
    Self.goToState("waiting") ; #DEBUG_LINE_NO:23
  EndEvent
EndState
