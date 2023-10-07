ScriptName MQ204HunterWarpsTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------
Int CooldownTimer = 10

;-- Properties --------------------------------------
Quest Property MQ204 Auto Const mandatory
Int Property WarpPrereqStage = 105 Auto Const
Int Property WarpTurnOffStage = 600 Auto Const

;-- State -------------------------------------------
State CooldownState

  Event OnTimer(Int aiTimerID)
    Self.GoToState("WaitingForTrigger") ; #DEBUG_LINE_NO:
  EndEvent

  Event OnTriggerEnter(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnBeginState(String asOldState)
    Self.StartTimer(10.0, 0) ; #DEBUG_LINE_NO:27
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForTrigger

  Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:10
      If MQ204.GetStageDone(WarpPrereqStage) ; #DEBUG_LINE_NO:11
        If MQ204.GetStageDone(WarpTurnOffStage) ; #DEBUG_LINE_NO:12
          Self.Disable(False) ; #DEBUG_LINE_NO:14
        Else ; #DEBUG_LINE_NO:
          Self.GoToState("CooldownState") ; #DEBUG_LINE_NO:16
          (MQ204 as mq204script).HunterWarps(Self.getLinkedRef(None)) ; #DEBUG_LINE_NO:18
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
