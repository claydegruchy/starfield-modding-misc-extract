ScriptName RQ_HarvestMineScript Extends RQScript conditional

;-- Variables ---------------------------------------
Float RegisterRocksCollectionTimer = 1.0 Const
Int RegisterRocksCollectionTimerID = 1 Const
Int harvestTotalMin = 0

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard RegisterRocksGuard

;-- Properties --------------------------------------
Group HarvestMineGroup
  ActorValue Property ProduceUses Auto Const mandatory
  Int Property RockCurrent Auto conditional
  GlobalVariable Property RQ_Settlement_HarvestMiner_01_CurrentCount Auto Const mandatory
  GlobalVariable Property RQ_Settlement_HarvestMiner_01_MaxCount Auto Const mandatory
  GlobalVariable Property RQ_Settlement_HarvestMiner_01_QTCount Auto Const mandatory
  RefCollectionAlias Property RocksCollection Auto Const
  Int Property HarvestCountRequiredMax = 15 Auto Const
  { max to harvest required (even if there are more than that in the cave) }
  Int Property HarvestCountRequiredMin = 8 Auto Const
  { max to harvest required (even if there are more than that in the cave) }
  Float Property QTCountPercentage = 0.649999976 Auto Const
  { at what % of total do QTs start appearing? }
  Int Property RockCollectionObjective = 100 Auto Const
  Int Property RocksCollectedStage = 300 Auto Const
  { Stage to set when all minerals have been collected. }
  Int Property ShutdownStage = 999 Auto Const
  { Stage to set when all minerals have been collected. }
EndGroup


;-- Functions ---------------------------------------

Function QuestStartedSpecific()
  harvestTotalMin = Utility.RandomInt(HarvestCountRequiredMin, HarvestCountRequiredMax) ; #DEBUG_LINE_NO:41
  Self.UpdateRocksCollection(False) ; #DEBUG_LINE_NO:44
  If RQ_Settlement_HarvestMiner_01_MaxCount.GetValueInt() == 0 ; #DEBUG_LINE_NO:45
    Self.SetStage(ShutdownStage) ; #DEBUG_LINE_NO:47
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForRemoteEvent(RocksCollection as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, Bool abRemove)
  Self.UnregisterForRemoteEvent(RocksCollection as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:57
  Self.StartTimer(RegisterRocksCollectionTimer, RegisterRocksCollectionTimerID) ; #DEBUG_LINE_NO:59
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == RegisterRocksCollectionTimerID ; #DEBUG_LINE_NO:64
    Self.RegisterRocks() ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateRocksCollection(Bool checkProduceUses)
  Int I = RocksCollection.GetCount() - 1 ; #DEBUG_LINE_NO:72
  While I >= 0 ; #DEBUG_LINE_NO:75
    ObjectReference rockRef = RocksCollection.GetAt(I) ; #DEBUG_LINE_NO:76
    Form rockBase = rockRef.GetBaseObject() ; #DEBUG_LINE_NO:77
    If rockRef.IsDisabled() || rockRef.Is3DLoaded() && rockBase is Flora == False ; #DEBUG_LINE_NO:81
      RocksCollection.RemoveRef(rockRef) ; #DEBUG_LINE_NO:84
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:86
  EndWhile ; #DEBUG_LINE_NO:
  Int rockTotal = RocksCollection.GetCount() ; #DEBUG_LINE_NO:88
  rockTotal = Math.Min(harvestTotalMin as Float, rockTotal as Float) as Int ; #DEBUG_LINE_NO:89
  RQ_Settlement_HarvestMiner_01_MaxCount.SetValueInt(rockTotal) ; #DEBUG_LINE_NO:92
  RQ_Settlement_HarvestMiner_01_CurrentCount.SetValueInt(0) ; #DEBUG_LINE_NO:93
  RQ_Settlement_HarvestMiner_01_QTCount.SetValueInt((rockTotal as Float * QTCountPercentage) as Int) ; #DEBUG_LINE_NO:94
  Self.UpdateCurrentInstanceGlobal(RQ_Settlement_HarvestMiner_01_MaxCount) ; #DEBUG_LINE_NO:95
  Self.UpdateCurrentInstanceGlobal(RQ_Settlement_HarvestMiner_01_CurrentCount) ; #DEBUG_LINE_NO:96
EndFunction

Function RegisterRocks()
  Guard RegisterRocksGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:102
    Self.UpdateRocksCollection(False) ; #DEBUG_LINE_NO:103
    Int rockTotal = RQ_Settlement_HarvestMiner_01_MaxCount.GetValueInt() ; #DEBUG_LINE_NO:104
    If rockTotal == 0 ; #DEBUG_LINE_NO:105
      Self.SetStage(RocksCollectedStage) ; #DEBUG_LINE_NO:107
    Else ; #DEBUG_LINE_NO:
      Int I = 0 ; #DEBUG_LINE_NO:110
      While I < RocksCollection.GetCount() ; #DEBUG_LINE_NO:112
        ObjectReference rockRef = RocksCollection.GetAt(I) ; #DEBUG_LINE_NO:113
        Self.RegisterForActorValueLessThanEvent(rockRef, ProduceUses, 1.0) ; #DEBUG_LINE_NO:115
        I += 1 ; #DEBUG_LINE_NO:116
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.ModObjectiveGlobal(1.0, RQ_Settlement_HarvestMiner_01_CurrentCount, RockCollectionObjective, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:125
  If RQ_Settlement_HarvestMiner_01_CurrentCount.GetValueInt() as Float >= RQ_Settlement_HarvestMiner_01_MaxCount.GetValue() ; #DEBUG_LINE_NO:127
    Self.SetStage(RocksCollectedStage) ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
EndEvent
