ScriptName LC165ShiftingTriggerScript Extends ObjectReference
{ Script for the memory space shifting triggers in LC165, Buried Temple. }

;-- Variables ---------------------------------------
Actor[] stopCombatWith

;-- Properties --------------------------------------
Group ReferenceProperties
  String Property ShiftName Auto Const
  { Name of the shift to trigger. }
  Int Property DisableStage Auto Const
  { When this stage is set, disable this trigger and its linked chain of distortion vfx. }
  Int Property DistortionID = -1 Auto Const
  { When the player enters this distortion, call LC165QuestScript's DistortionEntered function with this ID to update objectives. }
  ReferenceAlias Property ActorToStopCombatWith01 Auto Const
  { Actor to stop combat with when the player enters this distortion. }
  ReferenceAlias Property ActorToStopCombatWith02 Auto Const
  { Actor to stop combat with when the player enters this distortion. }
  RefCollectionAlias Property ActorsToStopCombatWith Auto Const
  { Actors to stop combat with when the player enters this distortion. }
EndGroup

Group AutofillProperties collapsedonref
  lc165shiftingquestscript Property MQ302B Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForRemoteEvent(MQ302B as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:33
  stopCombatWith = ActorsToStopCombatWith.GetArray() as Actor[] ; #DEBUG_LINE_NO:36
  If stopCombatWith == None ; #DEBUG_LINE_NO:37
    stopCombatWith = new Actor[0] ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  If ActorToStopCombatWith01 != None ; #DEBUG_LINE_NO:40
    stopCombatWith.add(ActorToStopCombatWith01.GetActorRef(), 1) ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
  If ActorToStopCombatWith02 != None ; #DEBUG_LINE_NO:43
    stopCombatWith.add(ActorToStopCombatWith02.GetActorRef(), 1) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  stopCombatWith = None ; #DEBUG_LINE_NO:49
EndEvent

Event OnTriggerEnter(ObjectReference akTriggerRef)
  ObjectReference[] linkedDistortions = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:55
  If linkedDistortions == None || linkedDistortions.Length == 0 ; #DEBUG_LINE_NO:56
    MQ302B.ShiftTo(ShiftName, "", None, DistortionID, stopCombatWith) ; #DEBUG_LINE_NO:57
  ElseIf linkedDistortions.Length == 1 ; #DEBUG_LINE_NO:58
    MQ302B.ShiftTo(ShiftName, "", linkedDistortions[0], DistortionID, stopCombatWith) ; #DEBUG_LINE_NO:59
  Else ; #DEBUG_LINE_NO:
    ObjectReference closestDistortion = linkedDistortions[0] ; #DEBUG_LINE_NO:61
    Float closestDistortionDistance = Game.GetPlayer().GetDistance(closestDistortion) ; #DEBUG_LINE_NO:62
    Int I = 1 ; #DEBUG_LINE_NO:63
    While I < linkedDistortions.Length ; #DEBUG_LINE_NO:64
      ObjectReference currentDistortion = linkedDistortions[I] ; #DEBUG_LINE_NO:65
      Float currentDistortionDistance = Game.GetPlayer().GetDistance(currentDistortion) ; #DEBUG_LINE_NO:66
      If currentDistortionDistance < closestDistortionDistance ; #DEBUG_LINE_NO:67
        closestDistortion = currentDistortion ; #DEBUG_LINE_NO:68
        closestDistortionDistance = currentDistortionDistance ; #DEBUG_LINE_NO:69
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:71
    EndWhile ; #DEBUG_LINE_NO:
    MQ302B.ShiftTo(ShiftName, "", closestDistortion, DistortionID, stopCombatWith) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Quest.OnStageSet(Quest akSource, Int auiStageID, Int auiItemID)
  If (akSource == MQ302B as Quest) && auiStageID == DisableStage ; #DEBUG_LINE_NO:78
    Self.DisableNoWait(False) ; #DEBUG_LINE_NO:79
    ObjectReference[] linkedDistortions = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:80
    Int I = 0 ; #DEBUG_LINE_NO:81
    While I < linkedDistortions.Length ; #DEBUG_LINE_NO:82
      linkedDistortions[I].DisableNoWait(False) ; #DEBUG_LINE_NO:83
      I += 1 ; #DEBUG_LINE_NO:84
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
