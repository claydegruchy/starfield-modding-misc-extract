ScriptName CFCredTankScript Extends ObjectReference
{ Activator script for CF_CredTanks. }

;-- Variables ---------------------------------------
Float CONST_AnimVariableSpeedMax = 10.0 Const
String CONST_AnimVariable_Position = "Position" Const
String CONST_AnimVariable_Speed = "Speed" Const
String CONST_Animation_Insert = "Play01" Const
String CONST_Animation_Remove = "Play02" Const
Float CONST_CredTankProximityMaxRange = 20.0 Const
Float CONST_CredTankProximityMinRange = 8.0 Const
Float CONST_UpdateTimerDelay = 0.25 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard UpdateCredTankGuard

;-- Properties --------------------------------------
Group Optional_SetStageProperties
  Quest Property QuestToSetStageOn Auto Const
  { OPTIONAL. Quest to set a stage on when the CredTank is opened. }
  Int Property StageToSet = -1 Auto Const
  { OPTIONAL. Stage to set. }
  Int Property PrereqStage = -1 Auto Const
  { OPTIONAL. If set, StageToSet will only be set if this stage has been set. }
  Int Property TurnOffStage = -1 Auto Const
  { OPTIONAL. If set, StageToSet will not be set if the quest is at this stage or higher. }
  Int Property TurnOffStageDone = -1 Auto Const
  { OPTIONAL. If set, StageToSet will not be set if this specific stage has been set. }
EndGroup

Group AutofillProperties
  Key Property CF_GalbankTransferModule Auto Const mandatory
  LeveledItem Property LL_CFCredtankCredits Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function ResetCredTank()
  Self.GoToState("Waiting") ; #DEBUG_LINE_NO:90
  Self.OnCellLoad() ; #DEBUG_LINE_NO:91
EndFunction

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActivator)
    Self.GoToState("Done") ; #DEBUG_LINE_NO:
    Self.SetAnimationVariableFloat(CONST_AnimVariable_Position, 1.0) ; #DEBUG_LINE_NO:
    Self.PlayAnimationAndWait(CONST_Animation_Insert, "Done") ; #DEBUG_LINE_NO:
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:
    Game.GetPlayer().AddItem(LL_CFCredtankCredits as Form, 1, False) ; #DEBUG_LINE_NO:
    If QuestToSetStageOn != None && StageToSet >= 0 ; #DEBUG_LINE_NO:
      If (PrereqStage < 0 || QuestToSetStageOn.GetStageDone(PrereqStage)) && (TurnOffStage < 0 || QuestToSetStageOn.GetStage() < TurnOffStage) && (TurnOffStageDone < 0 || !QuestToSetStageOn.GetStageDone(TurnOffStageDone)) ; #DEBUG_LINE_NO:
        QuestToSetStageOn.SetStage(StageToSet) ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.PlayAnimation(CONST_Animation_Remove) ; #DEBUG_LINE_NO:
    Self.SetAnimationVariableFloat(CONST_AnimVariable_Speed, CONST_AnimVariableSpeedMax) ; #DEBUG_LINE_NO:
    Self.SetAnimationVariableFloat(CONST_AnimVariable_Position, 0.0) ; #DEBUG_LINE_NO:
    Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:
  EndEvent

  Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
    Self.StartTimer(0.0, 0) ; #DEBUG_LINE_NO:
  EndEvent

  Event OnTimer(Int timerID)
    Float newPosition = 1.0 - Math.Min(Math.Max(Math.Max(Game.GetPlayer().GetDistance(Self as ObjectReference) - CONST_CredTankProximityMinRange, 0.0) / (CONST_CredTankProximityMaxRange - CONST_CredTankProximityMinRange), 0.0), 1.0) ; #DEBUG_LINE_NO:
    Self.SetAnimationVariableFloat("Position", newPosition) ; #DEBUG_LINE_NO:
    If newPosition > 0.0 ; #DEBUG_LINE_NO:
      Self.StartTimer(CONST_UpdateTimerDelay, 0) ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, Self as ScriptObject, CONST_CredTankProximityMaxRange, 0) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnCellLoad()
    If Game.GetPlayer().GetItemCount(CF_GalbankTransferModule as Form) > 0 ; #DEBUG_LINE_NO:43
      Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, Self as ScriptObject, CONST_CredTankProximityMaxRange, 0) ; #DEBUG_LINE_NO:44
      Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:45
    Else ; #DEBUG_LINE_NO:
      Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:47
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
