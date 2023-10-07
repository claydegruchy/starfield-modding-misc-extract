ScriptName WwiseEvent Extends Form Native hidden

;-- Structs -----------------------------------------
Struct WwiseRTPCParam
  String Name
  Float value
EndStruct

Struct WwiseSwitchParam
  String GroupName
  String StateName
EndStruct


;-- Functions ---------------------------------------

Bool Function PlayAndWaitImpl(ObjectReference akSource, String[] aSwitchGroups, String[] aSwitchStates, String[] aRTPCNames, Float[] aRTPCValues) Native

Int Function PlayImpl(ObjectReference akSource, String[] aSwitchGroups, String[] aSwitchStates, String[] aRTPCNames, Float[] aRTPCValues) Native

Function PlayMenuSound(String asSoundID) Global Native

Bool Function PlayUIAndWaitImpl(String[] aSwitchGroups, String[] aSwitchStates, String[] aRTPCNames, Float[] aRTPCValues) Native

Int Function PlayUIImpl(String[] aSwitchGroups, String[] aSwitchStates, String[] aRTPCNames, Float[] aRTPCValues) Native

Int Function PlayUIWithRTPC(String asRTPCName, Float afRTPCValue) Native

Int Function PlayWithRTPC(ObjectReference akSource, String asRTPCName, Float afRTPCValue) Native

Function SetGlobalRTPC(String asRTPCName, Float afRTPCValue) Global Native

Function SetGlobalState(String asStateGroup, String asStateName) Global Native

Function StopInstance(Int aiPlaybackInstance) Global Native

Function UpdateInstanceRTPC(Int aiPlaybackInstance, String asRTPCName, Float afRTPCValue) Global Native

Function UpdateInstanceRTPCsImpl(Int aiPlaybackInstance, String[] aRTPCNames, Float[] aRTPCValues) Global Native

wwiseevent:wwiseswitchparam Function MakeNewWwiseSwitchParam(String aGroupName, String aStateName) Global
  wwiseevent:wwiseswitchparam retval = new wwiseevent:wwiseswitchparam ; #DEBUG_LINE_NO:11
  retval.GroupName = aGroupName ; #DEBUG_LINE_NO:12
  retval.StateName = aStateName ; #DEBUG_LINE_NO:13
  Return retval ; #DEBUG_LINE_NO:14
EndFunction

wwiseevent:wwisertpcparam Function MakeNewWwiseRTPCParam(String aName, Float aValue) Global
  wwiseevent:wwisertpcparam retval = new wwiseevent:wwisertpcparam ; #DEBUG_LINE_NO:25
  retval.Name = aName ; #DEBUG_LINE_NO:26
  retval.value = aValue ; #DEBUG_LINE_NO:27
  Return retval ; #DEBUG_LINE_NO:28
EndFunction

Int Function Play(ObjectReference akSource, wwiseevent:wwiseswitchparam[] aSwitchParams, wwiseevent:wwisertpcparam[] aRTPCParams)
  Return Self.PlayImpl(akSource, WwiseEvent.ExtractSwitchGroups(aSwitchParams), WwiseEvent.ExtractSwitchStates(aSwitchParams), WwiseEvent.ExtractRTPCNames(aRTPCParams), WwiseEvent.ExtractRTPCValues(aRTPCParams)) ; #DEBUG_LINE_NO:33
EndFunction

Int Function PlayUI(wwiseevent:wwiseswitchparam[] aSwitchParams, wwiseevent:wwisertpcparam[] aRTPCParams)
  Return Self.PlayUIImpl(WwiseEvent.ExtractSwitchGroups(aSwitchParams), WwiseEvent.ExtractSwitchStates(aSwitchParams), WwiseEvent.ExtractRTPCNames(aRTPCParams), WwiseEvent.ExtractRTPCValues(aRTPCParams)) ; #DEBUG_LINE_NO:38
EndFunction

Bool Function PlayAndWait(ObjectReference akSource, wwiseevent:wwiseswitchparam[] aSwitchParams, wwiseevent:wwisertpcparam[] aRTPCParams)
  Return Self.PlayAndWaitImpl(akSource, WwiseEvent.ExtractSwitchGroups(aSwitchParams), WwiseEvent.ExtractSwitchStates(aSwitchParams), WwiseEvent.ExtractRTPCNames(aRTPCParams), WwiseEvent.ExtractRTPCValues(aRTPCParams)) ; #DEBUG_LINE_NO:43
EndFunction

Bool Function PlayUIAndWait(wwiseevent:wwiseswitchparam[] aSwitchParams, wwiseevent:wwisertpcparam[] aRTPCParams)
  Return Self.PlayUIAndWaitImpl(WwiseEvent.ExtractSwitchGroups(aSwitchParams), WwiseEvent.ExtractSwitchStates(aSwitchParams), WwiseEvent.ExtractRTPCNames(aRTPCParams), WwiseEvent.ExtractRTPCValues(aRTPCParams)) ; #DEBUG_LINE_NO:48
EndFunction

Function UpdateInstanceRTPCs(Int aiPlaybackInstance, wwiseevent:wwisertpcparam[] aRTPCParams) Global
  WwiseEvent.UpdateInstanceRTPCsImpl(aiPlaybackInstance, WwiseEvent.ExtractRTPCNames(aRTPCParams), WwiseEvent.ExtractRTPCValues(aRTPCParams)) ; #DEBUG_LINE_NO:65
EndFunction

String[] Function ExtractSwitchGroups(wwiseevent:wwiseswitchparam[] aSwitchParams) Global
  String[] switchGroups = None ; #DEBUG_LINE_NO:84
  If aSwitchParams.Length > 0 ; #DEBUG_LINE_NO:85
    switchGroups = new String[aSwitchParams.Length] ; #DEBUG_LINE_NO:86
    Int curSwitch = 0 ; #DEBUG_LINE_NO:87
    While curSwitch < aSwitchParams.Length ; #DEBUG_LINE_NO:88
      switchGroups[curSwitch] = aSwitchParams[curSwitch].GroupName ; #DEBUG_LINE_NO:89
      curSwitch += 1 ; #DEBUG_LINE_NO:90
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return switchGroups ; #DEBUG_LINE_NO:93
EndFunction

String[] Function ExtractSwitchStates(wwiseevent:wwiseswitchparam[] aSwitchParams) Global
  String[] switchStates = None ; #DEBUG_LINE_NO:98
  If aSwitchParams.Length > 0 ; #DEBUG_LINE_NO:99
    switchStates = new String[aSwitchParams.Length] ; #DEBUG_LINE_NO:100
    Int curSwitch = 0 ; #DEBUG_LINE_NO:101
    While curSwitch < aSwitchParams.Length ; #DEBUG_LINE_NO:102
      switchStates[curSwitch] = aSwitchParams[curSwitch].StateName ; #DEBUG_LINE_NO:103
      curSwitch += 1 ; #DEBUG_LINE_NO:104
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return switchStates ; #DEBUG_LINE_NO:107
EndFunction

String[] Function ExtractRTPCNames(wwiseevent:wwisertpcparam[] aRTPCParams) Global
  String[] rtpcNames = None ; #DEBUG_LINE_NO:112
  If aRTPCParams.Length > 0 ; #DEBUG_LINE_NO:113
    rtpcNames = new String[aRTPCParams.Length] ; #DEBUG_LINE_NO:114
    Int curRTPC = 0 ; #DEBUG_LINE_NO:115
    While curRTPC < aRTPCParams.Length ; #DEBUG_LINE_NO:116
      rtpcNames[curRTPC] = aRTPCParams[curRTPC].Name ; #DEBUG_LINE_NO:117
      curRTPC += 1 ; #DEBUG_LINE_NO:118
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return rtpcNames ; #DEBUG_LINE_NO:121
EndFunction

Float[] Function ExtractRTPCValues(wwiseevent:wwisertpcparam[] aRTPCParams) Global
  Float[] rtpcValues = None ; #DEBUG_LINE_NO:126
  If aRTPCParams.Length > 0 ; #DEBUG_LINE_NO:127
    rtpcValues = new Float[aRTPCParams.Length] ; #DEBUG_LINE_NO:128
    Int curRTPC = 0 ; #DEBUG_LINE_NO:129
    While curRTPC < aRTPCParams.Length ; #DEBUG_LINE_NO:130
      rtpcValues[curRTPC] = aRTPCParams[curRTPC].value ; #DEBUG_LINE_NO:131
      curRTPC += 1 ; #DEBUG_LINE_NO:132
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return rtpcValues ; #DEBUG_LINE_NO:135
EndFunction
