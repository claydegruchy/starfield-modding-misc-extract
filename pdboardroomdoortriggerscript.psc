ScriptName PDBoardroomDoorTriggerScript Extends ObjectReference Const
{ Opens linked door on trigger enter }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueParadiso Auto Const mandatory
Quest Property DialogueECSConstant Auto Const mandatory
Int Property PreReqStage = 305 Auto Const
Int Property FFConstantZ04DebugStage = 54 Auto Const
Float Property DoorTimerLength = 10.0 Auto Const

;-- Functions ---------------------------------------

Function CloseBoardroomDoor()
  Self.GetLinkedRef(None).SetOpen(False) ; #DEBUG_LINE_NO:11
EndFunction

Event OnTriggerEnter(ObjectReference akActionRef)
  If DialogueParadiso.GetStageDone(PreReqStage) || DialogueECSConstant.GetStageDone(FFConstantZ04DebugStage) ; #DEBUG_LINE_NO:16
    ObjectReference myDoor = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:17
    If myDoor.GetOpenState() >= 3 ; #DEBUG_LINE_NO:18
      myDoor.SetOpen(True) ; #DEBUG_LINE_NO:19
      Self.StartTimer(DoorTimerLength, 0) ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If !Self.IsInTrigger(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:27
    Self.CloseBoardroomDoor() ; #DEBUG_LINE_NO:28
  Else ; #DEBUG_LINE_NO:
    Self.StartTimer(DoorTimerLength, 0) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndEvent
