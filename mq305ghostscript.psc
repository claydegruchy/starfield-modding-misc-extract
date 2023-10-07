ScriptName MQ305GhostScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property AbStarbornTeleport Auto Const mandatory
VisualEffect Property UnityActorEffect Auto Const mandatory

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
    Self.GotoState("HasLoaded") ; #DEBUG_LINE_NO:8
    UnityActorEffect.Play(Self as ObjectReference, -1.0, None) ; #DEBUG_LINE_NO:9
    Self.AddSpell(AbStarbornTeleport, True) ; #DEBUG_LINE_NO:10
  EndEvent
EndState
