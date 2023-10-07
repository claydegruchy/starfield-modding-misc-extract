ScriptName Mq301Script Extends Quest

;-- Variables ---------------------------------------
Int MoonLogCountCurrent

;-- Properties --------------------------------------
Int Property MoonLogCountTotal = 6 Auto Const
Int Property MoonLogsDoneStage = 50 Auto Const
Int Property MoonLogObj = 12 Auto Const
Int Property MoonLogsFirstStage = 25 Auto Const

;-- Functions ---------------------------------------

Function UpdateMoonLogCount()
  MoonLogCountCurrent += 1 ; #DEBUG_LINE_NO:10
  If MoonLogCountCurrent == MoonLogCountTotal ; #DEBUG_LINE_NO:11
    Self.SetStage(MoonLogsDoneStage) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(MoonLogsFirstStage) == False ; #DEBUG_LINE_NO:15
    Self.SetStage(MoonLogsFirstStage) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(MoonLogObj, True, False) ; #DEBUG_LINE_NO:18
EndFunction
