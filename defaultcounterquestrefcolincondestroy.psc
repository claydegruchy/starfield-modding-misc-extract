ScriptName DefaultCounterQuestRefColIncOnDestroy Extends RefCollectionAlias default hidden
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuest script. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  Int Property RequiredDestructionStage = -1 Auto Const mandatory
  Int Property TargetRemainingCount = -1 Auto Const mandatory
  { After incrementing, if there are this many objects left in the collection or fewer, set RemainingStage. }
  Int Property RemainingStage = -1 Auto Const mandatory
  { After incrementing, if there are TargetRemainingCount objects left in the collection or fewer, set this stage. }
EndGroup

Group Optional_Properties
  Bool Property CheckForDestructionStageInstead = False Auto Const
  { If true the Increment will happen when this actor recieves the OnDying() event instead, which happens the instant the actor dies, unlike the
	OnDeath() event which can happen several seconds later. }
  Bool Property MaintainTargetValue = False Auto Const
  { Default: FALSE. Before incrementing, always set the counter's Target Value to match the length of this collection. }
  Bool Property RemoveWhenDestroyed = False Auto Const
  { Default: FALSE. After incrementing, remove the alias from the collection. If MaintainTargetValue=TRUE, also decrement the counter by 1. It essentially stays at 0 while the list shrinks. }
EndGroup


;-- Functions ---------------------------------------

Function Increment(ObjectReference akSenderRef)
  If MaintainTargetValue ; #DEBUG_LINE_NO:44
    (Self.GetOwningQuest() as defaultcounterquest).TargetValue = Self.GetCount() ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
  (Self.GetOwningQuest() as defaultcounterquest).Increment() ; #DEBUG_LINE_NO:47
  If RemoveWhenDestroyed ; #DEBUG_LINE_NO:48
    Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:49
    If MaintainTargetValue ; #DEBUG_LINE_NO:50
      (Self.GetOwningQuest() as defaultcounterquest).Decrement() ; #DEBUG_LINE_NO:51
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetCount() <= TargetRemainingCount && RemainingStage > -1 ; #DEBUG_LINE_NO:54
    Self.GetOwningQuest().SetStage(RemainingStage) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
Auto State WaitingForDeath

  Event OnDestructionStageChanged(ObjectReference akSenderRef, Int aiOldStage, Int aiCurrentStage)
    If CheckForDestructionStageInstead ; #DEBUG_LINE_NO:34
      If RequiredDestructionStage == aiCurrentStage || RequiredDestructionStage == -1 ; #DEBUG_LINE_NO:35
        Self.Increment(akSenderRef) ; #DEBUG_LINE_NO:36
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
