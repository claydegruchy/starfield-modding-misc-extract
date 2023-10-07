ScriptName CF08_AlarmScript Extends Quest

;-- Variables ---------------------------------------
Int alarmInstanceID

;-- Properties --------------------------------------
wwiseevent Property Wwise_Event_OBJ_Alarm_Ship_Battle_Prep Auto Const mandatory
ObjectReference Property CF08_SysDef_WwiseAlarmRef Auto Const mandatory

;-- Functions ---------------------------------------

Function PlayAlarm(Bool abPlay)
  If abPlay == True ; #DEBUG_LINE_NO:10
    alarmInstanceID = Wwise_Event_OBJ_Alarm_Ship_Battle_Prep.Play(CF08_SysDef_WwiseAlarmRef, None, None) ; #DEBUG_LINE_NO:11
  Else ; #DEBUG_LINE_NO:
    wwiseevent.StopInstance(alarmInstanceID) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndFunction
