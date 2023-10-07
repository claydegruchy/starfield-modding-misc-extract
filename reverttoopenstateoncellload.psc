ScriptName RevertToOpenStateOnCellLoad Extends ObjectReference

;-- Variables ---------------------------------------
Float timeOfLastOpenStateChange = -1.0

;-- Properties --------------------------------------
Bool Property ShouldBeOpenOnCellLoad Auto Const
GlobalVariable Property DefaultDaysBeforeDoorsReset Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Utility.GetCurrentGameTime() - timeOfLastOpenStateChange >= DefaultDaysBeforeDoorsReset.GetValue() ; #DEBUG_LINE_NO:10
    Int currentOpenState = Self.GetOpenState() ; #DEBUG_LINE_NO:11
    If ShouldBeOpenOnCellLoad ; #DEBUG_LINE_NO:13
      If currentOpenState != 1 || currentOpenState != 2 ; #DEBUG_LINE_NO:14
        Self.SetOpen(True) ; #DEBUG_LINE_NO:15
      EndIf ; #DEBUG_LINE_NO:
    ElseIf currentOpenState != 3 && currentOpenState != 4 ; #DEBUG_LINE_NO:18
      Self.SetOpen(False) ; #DEBUG_LINE_NO:19
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnOpen(ObjectReference akActionRef)
  Self.SetTimeofLastOpenStateChange() ; #DEBUG_LINE_NO:26
EndEvent

Event OnClose(ObjectReference akActionRef)
  Self.SetTimeofLastOpenStateChange() ; #DEBUG_LINE_NO:30
EndEvent

Function SetTimeofLastOpenStateChange()
  timeOfLastOpenStateChange = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:34
EndFunction
