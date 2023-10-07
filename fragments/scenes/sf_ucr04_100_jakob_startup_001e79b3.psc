ScriptName Fragments:Scenes:SF_UCR04_100_Jakob_StartUp_001E79B3 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UCR04_ReminderCount Auto Const mandatory
GlobalVariable Property UCR04_TimesCompleted Auto Const mandatory
GlobalVariable Property UCR04_ReminderFrequency Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  Int iRemainder = 0 ; #DEBUG_LINE_NO:7
  Int iTimesCompleted = UCR04_TimesCompleted.GetValueInt() ; #DEBUG_LINE_NO:8
  Int iFrequency = UCR04_ReminderFrequency.GetValueInt() ; #DEBUG_LINE_NO:9
  iRemainder = iTimesCompleted % iFrequency ; #DEBUG_LINE_NO:10
  UCR04_ReminderCount.SetValue(iRemainder as Float) ; #DEBUG_LINE_NO:12
EndFunction
