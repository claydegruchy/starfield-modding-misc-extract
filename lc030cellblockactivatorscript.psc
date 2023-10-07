ScriptName LC030CellBlockActivatorScript Extends ObjectReference
{ Script for the Cell Block switches in LC030. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group ObjectProperties
  Int Property CellBlockID Auto Const mandatory
  Int Property SwitchReadyStage = 410 Auto Const
  Int Property SwitchUsedStage = 420 Auto Const
EndGroup

Group AutofillProperties
  Quest Property LC030 Auto Const mandatory
  Message Property LC030_SwitchNotReadyMessage Auto Const mandatory
  Message Property LC030_SwitchAlreadyUsedMessage Auto Const mandatory
EndGroup


;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActivator)
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:19
    If akActivator == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:20
      If !LC030.GetStageDone(SwitchReadyStage + CellBlockID) ; #DEBUG_LINE_NO:21
        LC030_SwitchNotReadyMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:22
        Self.GotoState("Waiting") ; #DEBUG_LINE_NO:23
      ElseIf LC030.GetStageDone(SwitchUsedStage + CellBlockID) ; #DEBUG_LINE_NO:24
        LC030_SwitchAlreadyUsedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:25
        Self.GotoState("Waiting") ; #DEBUG_LINE_NO:26
      Else ; #DEBUG_LINE_NO:
        ((Self as ObjectReference) as genericswitchscript).SetColor("White") ; #DEBUG_LINE_NO:28
        LC030.SetStage(SwitchUsedStage + CellBlockID) ; #DEBUG_LINE_NO:29
        Self.GotoState("Done") ; #DEBUG_LINE_NO:30
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
