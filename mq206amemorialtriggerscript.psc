ScriptName MQ206AMemorialTriggerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ206A_004_Casket Auto Const mandatory

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:7
      Self.GotoState("HasBeenTriggered") ; #DEBUG_LINE_NO:8
      MQ206A_004_Casket.Start() ; #DEBUG_LINE_NO:9
      Utility.Wait(3.0) ; #DEBUG_LINE_NO:10
      Self.GotoState("WaitingForPlayer") ; #DEBUG_LINE_NO:11
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
