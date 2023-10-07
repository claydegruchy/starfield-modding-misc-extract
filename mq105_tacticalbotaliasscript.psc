ScriptName MQ105_TacticalBotAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property RobotSeesPlayerStage = 650 Auto Const
Int Property RobotSeesPlayerPrereqStage = 600 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.GetOwningQuest().GetStageDone(RobotSeesPlayerStage) == False ; #DEBUG_LINE_NO:7
    Self.RegisterForDistanceLessThanEvent(Self.getActorRef() as ScriptObject, Game.GetPlayer() as ScriptObject, 4.0, 0) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:14
  If myQuest.GetStageDone(RobotSeesPlayerPrereqStage) && myQuest.GetStageDone(RobotSeesPlayerStage) == False ; #DEBUG_LINE_NO:15
    myQuest.SetStage(RobotSeesPlayerStage) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnLoad()
  Self.UnregisterForDistanceEvents(Self.getActorRef() as ScriptObject, Game.GetPlayer() as ScriptObject, -1) ; #DEBUG_LINE_NO:21
EndEvent
