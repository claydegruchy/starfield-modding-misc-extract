ScriptName SignalSender_OnActorValue Extends SignalSenderScript
{ Sends a Signal to SignalReceiverScripts

SignalParameters.Ref1 = self
SignalParameters.AV1 = TargetAV

ConditionReferences.Subject = self
ConditionReferences.Target = self }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AdditionalData
  Bool Property DoOnce = True Auto Const
  { Default: true; If false will re-up the registration for the actorvalue event }
  Int Property ChangeTypeEnum = 1 Auto Const
  { The type of actorvalue 
0 = OnActorValueLessThan				= 0 const 
1 = OnActorValueLessThanOrEqualTo		= 1 const ;default
2 = OnActorValueChange					= 2 const 
3 = OnActorValueGreaterThanOrEqualTo	= 3 const 
4 = OnActorValueGreaterThan				= 4 const 

* NOTE: the OrEqualTo events are being faked right now by adding/subtracting .001 to the requested value until we have those events proper
GEN-296056 Papyrus: Actor value greater/less than events should have a "equals" option }
  ActorValue Property TargetAV Auto Const mandatory
  { the ActorValue to watch }
  Float Property TargetValue Auto Const mandatory
  { Value needed to send Signal }
EndGroup

Int Property iChangeType_OnActorValueLessThan = 0 AutoReadOnly
Int Property iChangeType_OnActorValueLessThanOrEqualTo = 1 AutoReadOnly
Int Property iChangeType_OnActorValueChange = 2 AutoReadOnly
Int Property iChangeType_OnActorValueGreaterThanOrEqualTo = 3 AutoReadOnly
Int Property iChangeType_OnActorValueGreaterThan = 4 AutoReadOnly

;-- Functions ---------------------------------------

Function RegisterForOnAVEvent()
  Float value = TargetValue ; #DEBUG_LINE_NO:
  If ChangeTypeEnum == Self.iChangeType_OnActorValueLessThan ; #DEBUG_LINE_NO:
    Self.RegisterForActorValueLessThanEvent(Self as ObjectReference, TargetAV, value) ; #DEBUG_LINE_NO:
  ElseIf ChangeTypeEnum == Self.iChangeType_OnActorValueLessThanOrEqualTo ; #DEBUG_LINE_NO:
    value += 0.001 ; #DEBUG_LINE_NO:
    Self.RegisterForActorValueLessThanEvent(Self as ObjectReference, TargetAV, value) ; #DEBUG_LINE_NO:
  ElseIf ChangeTypeEnum == Self.iChangeType_OnActorValueChange ; #DEBUG_LINE_NO:
    Self.RegisterForActorValueChangedEvent(Self as ObjectReference, TargetAV) ; #DEBUG_LINE_NO:
  ElseIf ChangeTypeEnum == Self.iChangeType_OnActorValueGreaterThanOrEqualTo ; #DEBUG_LINE_NO:
    value -= 0.001 ; #DEBUG_LINE_NO:
    Self.RegisterForActorValueGreaterThanEvent(Self as ObjectReference, TargetAV, value) ; #DEBUG_LINE_NO:
  ElseIf ChangeTypeEnum == Self.iChangeType_OnActorValueGreaterThan ; #DEBUG_LINE_NO:
    Self.RegisterForActorValueGreaterThanEvent(Self as ObjectReference, TargetAV, value) ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnLoad()
  Self.RegisterForOnAVEvent() ; #DEBUG_LINE_NO:58
EndEvent

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
  Self.CreateParmsAndSendSignalAndRegisterForEvent() ; #DEBUG_LINE_NO:62
EndEvent

Event OnActorValueGreaterThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.CreateParmsAndSendSignalAndRegisterForEvent() ; #DEBUG_LINE_NO:66
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.CreateParmsAndSendSignalAndRegisterForEvent() ; #DEBUG_LINE_NO:70
EndEvent

Function CreateParmsAndSendSignalAndRegisterForEvent()
  signalsenderscript:signalparameters signalParameters = new signalsenderscript:signalparameters ; #DEBUG_LINE_NO:109
  signalParameters.Ref1 = Self as ObjectReference ; #DEBUG_LINE_NO:110
  signalParameters.AV1 = TargetAV ; #DEBUG_LINE_NO:111
  signalsenderscript:conditionreferences conditionReferences = new signalsenderscript:conditionreferences ; #DEBUG_LINE_NO:114
  conditionReferences.Subject = Self as ObjectReference ; #DEBUG_LINE_NO:115
  conditionReferences.Target = Self as ObjectReference ; #DEBUG_LINE_NO:116
  Self.SendSignal(signalParameters, conditionReferences) ; #DEBUG_LINE_NO:118
  If DoOnce ; #DEBUG_LINE_NO:120
    Self.GotoState("Done") ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForOnAVEvent() ; #DEBUG_LINE_NO:124
EndFunction

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Function RegisterForOnAVEvent()
    ; Empty function ; #DEBUG_LINE_NO:
  EndFunction
EndState
