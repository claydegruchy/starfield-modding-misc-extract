ScriptName AliasSetStageOnActorValueChanged Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property WatchedValue Auto Const mandatory
{ The actor value to watch for }
Int Property AVThreshold Auto Const mandatory
{ When your actor value get BELOW this number, set the appropriate stage. So if you want it to fire when your AV is zero, set this to a number more than zero }
Int Property StageToSet Auto Const mandatory
{ Stage to set when "ValueTarget" is reached on WatchedValue }
Int Property PrereqStage = -1 Auto Const
{ OPTIONAL: Don't start watching for this value until this stage is set }
Int Property ShutdownStage = -1 Auto Const
{ OPTIONAL: If this stage is set, you can clean up this registration }

;-- Functions ---------------------------------------

Event OnAliasInit()
  ObjectReference currRef = Self.GetRef() ; #DEBUG_LINE_NO:20
  If currRef != None ; #DEBUG_LINE_NO:21
    If ShutdownStage <= -1 || !Self.GetOwningQuest().GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:22
      If PrereqStage >= 0 ; #DEBUG_LINE_NO:23
        Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:24
      Else ; #DEBUG_LINE_NO:
        Self.AliasValueRegistration(currRef) ; #DEBUG_LINE_NO:26
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If ShutdownStage > 0 && !Self.GetOwningQuest().GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:30
      Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:31
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage ; #DEBUG_LINE_NO:37
    ObjectReference currRef = Self.GetRef() ; #DEBUG_LINE_NO:38
    If currRef != None ; #DEBUG_LINE_NO:40
      Self.AliasValueRegistration(currRef) ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
  ElseIf auiStageID == ShutdownStage ; #DEBUG_LINE_NO:43
    ObjectReference currref = Self.GetRef() ; #DEBUG_LINE_NO:44
    Self.UnregisterForActorValueLessThanEvent(currref, WatchedValue, AVThreshold as Float) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:50
  ObjectReference currRef = Self.GetRef() ; #DEBUG_LINE_NO:51
  Bool passedThreshold = False ; #DEBUG_LINE_NO:52
  If (OQ.GetStageDone(PrereqStage) || PrereqStage < 0) && (!OQ.GetStageDone(ShutdownStage) || ShutdownStage < 0) ; #DEBUG_LINE_NO:53
    Int currentValue = Math.Ceiling(currRef.GetValue(WatchedValue)) ; #DEBUG_LINE_NO:55
    If akObjRef == currRef && akActorValue == WatchedValue && currentValue < AVThreshold ; #DEBUG_LINE_NO:56
      passedThreshold = True ; #DEBUG_LINE_NO:57
      OQ.SetStage(StageToSet) ; #DEBUG_LINE_NO:58
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If !passedThreshold ; #DEBUG_LINE_NO:62
    Self.AliasValueRegistration(akObjRef) ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function AliasValueRegistration(ObjectReference akTargetRef)
  If akTargetRef != None ; #DEBUG_LINE_NO:68
    Self.RegisterForActorValueLessThanEvent(akTargetRef, WatchedValue, AVThreshold as Float) ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
EndFunction
