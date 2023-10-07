ScriptName UC06_VV_DoorRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC06 Auto Const mandatory
{ Quest to watch for unlocking }
Int Property UnlockStage = 99 Auto Const
{ Stage to check on UC06 to ensure the door's always unlocked }
Int Property UnlockStage01 = 105 Auto Const
{ Stage to check on UC06 to ensure the door's always unlocked }
Int Property UnlockStage02 = 200 Auto Const
{ Stage to check on UC06 to ensure the door's always unlocked }

;-- Functions ---------------------------------------

Event OnUnload()
  If Self.GetOpenState() != 3 ; #DEBUG_LINE_NO:16
    Self.SetOpen(False) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnCellLoad()
  If UC06.GetStageDone(UnlockStage) || UC06.GetStageDone(UnlockStage01) || UC06.GetStageDone(UnlockStage02) ; #DEBUG_LINE_NO:22
    Self.Unlock(False) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndEvent
