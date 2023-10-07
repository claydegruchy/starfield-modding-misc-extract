ScriptName SYTest01_DestinationDistanceScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:6
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == 400 ; #DEBUG_LINE_NO:11
    PlayerShip.RefillAlias() ; #DEBUG_LINE_NO:13
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 21000.0, 0) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If Self.GetOwningQuest().GetStageDone(440) ; #DEBUG_LINE_NO:20
    Self.GetOwningQuest().SetStage(460) ; #DEBUG_LINE_NO:21
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 1000.0, 0) ; #DEBUG_LINE_NO:22
  ElseIf Self.GetOwningQuest().GetStageDone(430) ; #DEBUG_LINE_NO:23
    Self.GetOwningQuest().SetStage(440) ; #DEBUG_LINE_NO:24
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 1000.0, 0) ; #DEBUG_LINE_NO:25
  ElseIf Self.GetOwningQuest().GetStageDone(420) ; #DEBUG_LINE_NO:26
    Self.GetOwningQuest().SetStage(430) ; #DEBUG_LINE_NO:27
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 5000.0, 0) ; #DEBUG_LINE_NO:28
  ElseIf Self.GetOwningQuest().GetStageDone(410) ; #DEBUG_LINE_NO:29
    Self.GetOwningQuest().SetStage(420) ; #DEBUG_LINE_NO:30
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 8000.0, 0) ; #DEBUG_LINE_NO:31
  ElseIf Self.GetOwningQuest().GetStageDone(400) ; #DEBUG_LINE_NO:32
    Self.GetOwningQuest().SetStage(410) ; #DEBUG_LINE_NO:33
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, PlayerShip as ScriptObject, 14000.0, 0) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndEvent
