ScriptName MQ305EyesClosedScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property AnimFaceArchetypeEyesClosed Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

;-- State -------------------------------------------
State HasLoaded

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForLoad

  Event OnLoad()
    Self.GotoState("HasLoaded") ; #DEBUG_LINE_NO:7
    Self.ChangeAnimFaceArchetype(AnimFaceArchetypeEyesClosed) ; #DEBUG_LINE_NO:8
  EndEvent
EndState
