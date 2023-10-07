ScriptName DebugSoundScriptingQuest Extends Quest
{ http://intranet.bethsoft.com/genesis_editor/index.php/WwiseEvent_Script }

;-- Variables ---------------------------------------
String GlobalRTPCName = "Papyrus_Test_Global_RTPC"
String GlobalStateGroup = "Papyrus_Test_Global_State"
String GlobalStateName1 = "Papyrus_Global_State_01"
String GlobalStateName2 = "Papyrus_Global_State_02"
String InstanceRTPCName = "Papyrus_Test_Instance_RTPC"
String InstanceSwitchGroup = "Papyrus_Test_Switch_Instance"
String InstanceSwitchName1 = "Papyrus_3D_Loop"
String InstanceSwitchName2 = "Papyrus_2D_Loop"
Int eventInstance1 = 0
Int eventInstance2 = 0

;-- Properties --------------------------------------
wwiseevent Property EventForm1 Auto Const mandatory
{ 3D positional, loop.  Attenuation should start after a couple meters. }
wwiseevent Property EventForm2 Auto Const mandatory
{ 2D positionless, loop. }
wwiseevent Property EventForm3 Auto Const mandatory
{ 3D positional, not looping. }
ReferenceAlias Property ThreeDPost_Switch_On Auto Const mandatory
{ 3D event source }
Float Property GlobalRTPCValue1 Auto Const mandatory
{ Global RTPC Value1 }
Float Property GlobalRTPCValue2 Auto Const mandatory
{ Global RTPC Value2 }
Float Property InstanceRTPCValue1 Auto Const mandatory
{ Instance RTPC Value1 }
Float Property InstanceRTPCValue2 Auto Const mandatory
{ Instance RTPC Value2 }
Message Property TEST_SoundScriptingWarning Auto Const
{ Warning messagebox }

;-- Functions ---------------------------------------

Function TriggerButtonBehavior(Int iButtonIndex)
  If iButtonIndex == 1 ; #DEBUG_LINE_NO:52
    wwiseevent.StopInstance(eventInstance1) ; #DEBUG_LINE_NO:53
    EventForm3.PlayAndWait(ThreeDPost_Switch_On.GetRef(), None, None) ; #DEBUG_LINE_NO:54
    eventInstance1 = EventForm1.Play(ThreeDPost_Switch_On.GetRef(), None, None) ; #DEBUG_LINE_NO:55
  ElseIf iButtonIndex == 2 ; #DEBUG_LINE_NO:58
    wwiseevent.StopInstance(eventInstance1) ; #DEBUG_LINE_NO:59
  ElseIf iButtonIndex == 3 ; #DEBUG_LINE_NO:62
    wwiseevent.StopInstance(eventInstance2) ; #DEBUG_LINE_NO:63
    eventInstance2 = EventForm2.PlayUI(None, None) ; #DEBUG_LINE_NO:64
  ElseIf iButtonIndex == 4 ; #DEBUG_LINE_NO:67
    wwiseevent.StopInstance(eventInstance2) ; #DEBUG_LINE_NO:68
  ElseIf iButtonIndex == 5 ; #DEBUG_LINE_NO:71
    wwiseevent.SetGlobalRTPC(GlobalRTPCName, GlobalRTPCValue1) ; #DEBUG_LINE_NO:72
  ElseIf iButtonIndex == 6 ; #DEBUG_LINE_NO:75
    wwiseevent.SetGlobalRTPC(GlobalRTPCName, GlobalRTPCValue2) ; #DEBUG_LINE_NO:76
  ElseIf iButtonIndex == 7 ; #DEBUG_LINE_NO:79
    wwiseevent.SetGlobalState(GlobalStateGroup, GlobalStateName1) ; #DEBUG_LINE_NO:80
  ElseIf iButtonIndex == 8 ; #DEBUG_LINE_NO:83
    wwiseevent.SetGlobalState(GlobalStateGroup, GlobalStateName2) ; #DEBUG_LINE_NO:84
  ElseIf iButtonIndex == 9 ; #DEBUG_LINE_NO:87
    wwiseevent.UpdateInstanceRTPC(eventInstance2, GlobalRTPCName, InstanceRTPCValue1) ; #DEBUG_LINE_NO:88
  ElseIf iButtonIndex == 10 ; #DEBUG_LINE_NO:91
    wwiseevent.UpdateInstanceRTPC(eventInstance2, GlobalRTPCName, InstanceRTPCValue2) ; #DEBUG_LINE_NO:92
  ElseIf iButtonIndex == 11 ; #DEBUG_LINE_NO:95
    wwiseevent.StopInstance(eventInstance2) ; #DEBUG_LINE_NO:96
    wwiseevent:wwiseswitchparam[] switches = new wwiseevent:wwiseswitchparam[1] ; #DEBUG_LINE_NO:97
    switches[0] = wwiseevent.MakeNewWwiseSwitchParam(InstanceSwitchGroup, InstanceSwitchName2) ; #DEBUG_LINE_NO:98
    eventInstance2 = EventForm2.PlayUI(switches, None) ; #DEBUG_LINE_NO:99
  ElseIf iButtonIndex == 12 ; #DEBUG_LINE_NO:102
    wwiseevent.StopInstance(eventInstance2) ; #DEBUG_LINE_NO:103
    wwiseevent:wwiseswitchparam[] switches = new wwiseevent:wwiseswitchparam[1] ; #DEBUG_LINE_NO:104
    switches[0] = wwiseevent.MakeNewWwiseSwitchParam(InstanceSwitchGroup, InstanceSwitchName1) ; #DEBUG_LINE_NO:105
    eventInstance2 = EventForm2.PlayUI(switches, None) ; #DEBUG_LINE_NO:106
  Else ; #DEBUG_LINE_NO:
    TEST_SoundScriptingWarning.Show(iButtonIndex as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:109
  EndIf ; #DEBUG_LINE_NO:
EndFunction
