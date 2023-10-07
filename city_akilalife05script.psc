ScriptName City_AkilaLife05Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ProduceUses Auto Const mandatory
Int Property RockCurrent Auto
Int Property RockTotal Auto
GlobalVariable Property AkilaLife05_RocksCurrent Auto Const mandatory
RefCollectionAlias Property RocksCollection Auto Const

;-- Functions ---------------------------------------

Function RegisterRocks()
  Int I = 0 ; #DEBUG_LINE_NO:11
  Int iCount = RocksCollection.GetCount() ; #DEBUG_LINE_NO:12
  While I < iCount ; #DEBUG_LINE_NO:14
    Self.RegisterForActorValueLessThanEvent(RocksCollection.GetAt(I), ProduceUses, 1.0) ; #DEBUG_LINE_NO:16
    I += 1 ; #DEBUG_LINE_NO:17
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestStarted()
  Self.RegisterRocks() ; #DEBUG_LINE_NO:23
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  akObjRef.Disable(False) ; #DEBUG_LINE_NO:28
  RockCurrent += 1 ; #DEBUG_LINE_NO:29
  Self.ModObjectiveGlobal(1.0, AkilaLife05_RocksCurrent, 300, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:30
  If RockCurrent >= RockTotal ; #DEBUG_LINE_NO:31
    Self.SetStage(300) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndEvent
