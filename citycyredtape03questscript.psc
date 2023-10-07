ScriptName CityCYRedTape03QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PlayerInJailTriggerStage = 885 Auto Const
Int Property JailCellDoorClosedStage = 887 Auto Const
ReferenceAlias Property JailDoor Auto Const mandatory
ReferenceAlias Property JailTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function CloseJailCell()
  If Self.GetStageDone(JailCellDoorClosedStage) == False ; #DEBUG_LINE_NO:11
    If JailTrigger.GetRef().IsInTrigger(Game.GetPlayer() as ObjectReference) == False ; #DEBUG_LINE_NO:12
      ObjectReference myDoor = JailDoor.GetRef() ; #DEBUG_LINE_NO:13
      myDoor.SetOpen(False) ; #DEBUG_LINE_NO:14
      myDoor.SetDoorInaccessible(True) ; #DEBUG_LINE_NO:15
      Self.SetStage(JailCellDoorClosedStage) ; #DEBUG_LINE_NO:16
    ElseIf Self.GetStageDone(PlayerInJailTriggerStage) == False ; #DEBUG_LINE_NO:17
      Self.SetStage(PlayerInJailTriggerStage) ; #DEBUG_LINE_NO:18
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(3.0, 0) ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  Self.CloseJailCell() ; #DEBUG_LINE_NO:26
EndEvent
