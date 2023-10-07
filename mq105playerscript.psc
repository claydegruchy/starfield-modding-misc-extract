ScriptName MQ105PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property MoveWalterQuestStage = 17 Auto Const
Int Property WalterFollowingQuestStage = 20 Auto Const
Int Property LeaveNeonQuestStage = 900 Auto Const
Int Property TalkWalterQuestStage = 910 Auto Const

;-- Functions ---------------------------------------

Event OnEnterShipInterior(ObjectReference akShip)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:9
  If myQuest.GetStageDone(WalterFollowingQuestStage) ; #DEBUG_LINE_NO:10
    myQuest.SetStage(MoveWalterQuestStage) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
  If myQuest.GetStageDone(LeaveNeonQuestStage) ; #DEBUG_LINE_NO:14
    myQuest.SetStage(TalkWalterQuestStage) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent
