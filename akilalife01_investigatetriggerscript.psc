ScriptName AkilaLife01_InvestigateTriggerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_AkilaLife01 Auto Const mandatory
Int Property StageToSet Auto Const
Int Property TimerID Auto Const
GlobalVariable Property City_AkilaLife01_Timer Auto Const mandatory
GlobalVariable Property City_AkilaLife01_TriggerActive Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:6
    City_AkilaLife01_TriggerActive.SetValue(1.0) ; #DEBUG_LINE_NO:7
    If City_AkilaLife01.GetStageDone(100) && City_AkilaLife01.GetStageDone(150) == False ; #DEBUG_LINE_NO:11
      If Game.GetLocalTime() > 20.0 || Game.GetLocalTime() < 4.0 ; #DEBUG_LINE_NO:12
        City_AkilaLife01.SetStage(StageToSet) ; #DEBUG_LINE_NO:13
      Else ; #DEBUG_LINE_NO:
        Self.StartTimerGameTime(City_AkilaLife01_Timer.GetValue(), TimerID) ; #DEBUG_LINE_NO:15
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:25
    If City_AkilaLife01_TriggerActive.GetValue() as Int == 1 ; #DEBUG_LINE_NO:26
      City_AkilaLife01_TriggerActive.SetValue(0.0) ; #DEBUG_LINE_NO:27
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimerGameTime(Int TimerID)
  If Game.GetLocalTime() > 20.0 || Game.GetLocalTime() < 4.0 ; #DEBUG_LINE_NO:34
    If City_AkilaLife01_TriggerActive.GetValue() as Int == 1 ; #DEBUG_LINE_NO:35
      City_AkilaLife01.SetStage(StageToSet) ; #DEBUG_LINE_NO:36
    Else ; #DEBUG_LINE_NO:
      Self.StartTimerGameTime(City_AkilaLife01_Timer.GetValue(), TimerID) ; #DEBUG_LINE_NO:38
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.StartTimerGameTime(City_AkilaLife01_Timer.GetValue(), TimerID) ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
EndEvent
