ScriptName DefaultCounterQuestRefColIncOnDeath Extends RefCollectionAlias default hidden
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuest script. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Int Property TargetRemainingCount = -1 Auto Const
  { After incrementing, if there are this many objects left in the collection or fewer, set RemainingStage. }
  Int Property RemainingStage = -1 Auto Const
  { After incrementing, if there are TargetRemainingCount objects left in the collection or fewer, set this stage. }
  Bool Property CheckForOnDyingInstead = False Auto Const
  { DefaultL FALSE. If true the Increment will happen when this actor recieves the OnDying() event instead, which happens the instant the actor dies, unlike the
	OnDeath() event which can happen several seconds later. }
  Bool Property RemoveWhenDead = False Auto Const
  { Default: FALSE. After incrementing, remove the alias from the collection. If MaintainTargetValue=TRUE, also decrement the counter by 1. It essentially stays at 0 while the list shrinks. }
  Bool Property MaintainTargetValue = False Auto Const
  { Default: FALSE. Before incrementing, always set the counter's Target Value to match the length of this collection. }
EndGroup


;-- Functions ---------------------------------------

Function Increment(ObjectReference akSenderRef)
  If MaintainTargetValue ; #DEBUG_LINE_NO:39
    (Self.GetOwningQuest() as defaultcounterquest).TargetValue = Self.GetCount() ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
  (Self.GetOwningQuest() as defaultcounterquest).Increment() ; #DEBUG_LINE_NO:42
  If RemoveWhenDead ; #DEBUG_LINE_NO:43
    Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:44
    If MaintainTargetValue ; #DEBUG_LINE_NO:45
      (Self.GetOwningQuest() as defaultcounterquest).Decrement() ; #DEBUG_LINE_NO:46
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetCount() <= TargetRemainingCount && RemainingStage > -1 ; #DEBUG_LINE_NO:49
    Self.GetOwningQuest().SetStage(RemainingStage) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
Auto State WaitingForDeath

  Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
    If CheckForOnDyingInstead ; #DEBUG_LINE_NO:
      Self.Increment(akSenderRef) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
    If !CheckForOnDyingInstead ; #DEBUG_LINE_NO:25
      Self.Increment(akSenderRef) ; #DEBUG_LINE_NO:26
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
