ScriptName SignalSenderScript Extends ObjectReference hidden
{ Sends signals to ObjectReferences with SignalReceiverScripts attached.

This script must be extended and call SendSignal from an event that should trigger the signal to be sent. }

;-- Structs -----------------------------------------
Struct ConditionReferences
  ObjectReference Subject
  ObjectReference Target
EndStruct

Struct SignalParameters
  ObjectReference Ref1
  ActorValue AV1
EndStruct

Struct SignalSignature
  SignalSenderScript SendingRef
  Keyword Signal
EndStruct

Struct SignalToSend
  Keyword Signal
  conditionform Conditions
  { optional: condition form that must be true before sending this signal.
See script level documentation text for details on what the Subject and Target refs will be for the condition form. }
EndStruct


;-- Variables ---------------------------------------
Int previousSignalIndex = -1

;-- Properties --------------------------------------
Group Signals
  Int Property ListTypeEnum = 0 Auto Const
  { 0 = Sequence (repeating)
1 = Stack [NOT IMPLEMENTED]
2 = Simultaneous [NOT IMPLEMENTED] }
  signalsenderscript:signaltosend[] Property SignalsToSend Auto Const mandatory
  { list of keywords (signals) and conditions (that must be true to send) }
  conditionform Property Conditions Auto Const
  { optional: condition form that must be true before attempting to send any signal.
See script level documentation text for details on what the Subject and Target refs will be for the condition form. }
EndGroup

Group ReceiverConnection collapsedonbase collapsedonref
{ Sends to linkedRef by default... for additional settings DOUBLE LEFT-CLICK! }
  Int Property ReceiverTypeEnum = 0 Auto Const
  { 0 = LinkedRef  (default)
 1 = LinkedRefChain
 2 = LinkedRefChildren
 3 = Self (send to object THIS script is attached to) 
 4 = Self *AND* LinkedRef }
  Keyword Property LinkedRefKeyword Auto Const
  { optional: keyword for defining which LinkedRef(Chain) or LinkedRefChildren to send signal to.
Meaningless if ReceiverTypeEnum == 3 (self) }
EndGroup

Int Property iReceiverType_LinkedRef = 0 AutoReadOnly
Int Property iReceiverType_LinkedRefChain = 1 AutoReadOnly
Int Property iReceiverType_LinkedRefChildren = 2 AutoReadOnly
Int Property iReceiverType_Self = 3 AutoReadOnly
Int Property iReceiverType_SelfAndLinkedRef = 4 AutoReadOnly
Int Property iListType_Sequence = 0 AutoReadOnly
Int Property iListType_Stack = 1 AutoReadOnly
Int Property iListType_Simultaneous = 2 AutoReadOnly

;-- Functions ---------------------------------------

Event OnInit()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function SendSignal(signalsenderscript:signalparameters SignalParameters, signalsenderscript:conditionreferences ConditionReferences)
  If Conditions == None || Conditions.IsTrue(ConditionReferences.Subject, ConditionReferences.Target) ; #DEBUG_LINE_NO:96
    signalsenderscript:signaltosend SignalToSend = SignalsToSend[Self.GetNextSignalIndex()] ; #DEBUG_LINE_NO:98
    If SignalToSend.Conditions == None || SignalToSend.Conditions.IsTrue(ConditionReferences.Subject, ConditionReferences.Target) ; #DEBUG_LINE_NO:102
      signalsenderscript:signalsignature SignalSignature = new signalsenderscript:signalsignature ; #DEBUG_LINE_NO:103
      SignalSignature.SendingRef = Self ; #DEBUG_LINE_NO:104
      SignalSignature.Signal = SignalToSend.Signal ; #DEBUG_LINE_NO:105
      ObjectReference[] receiverRefs = Self.GetPossibleReceiverRefs() ; #DEBUG_LINE_NO:108
      Int I = 0 ; #DEBUG_LINE_NO:111
      While I < receiverRefs.Length ; #DEBUG_LINE_NO:112
        signalreceiverscript currentReceiverRef = receiverRefs[I] as signalreceiverscript ; #DEBUG_LINE_NO:114
        If currentReceiverRef ; #DEBUG_LINE_NO:116
          currentReceiverRef.ReceiveSignal(SignalSignature, SignalParameters) ; #DEBUG_LINE_NO:118
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:121
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Int Function GetNextSignalIndex()
  Int iNext = 0 ; #DEBUG_LINE_NO:135
  If ListTypeEnum == Self.iListType_Sequence ; #DEBUG_LINE_NO:136
    iNext = (previousSignalIndex + 1) % SignalsToSend.Length ; #DEBUG_LINE_NO:137
  EndIf ; #DEBUG_LINE_NO:
  previousSignalIndex = iNext ; #DEBUG_LINE_NO:142
  Return iNext ; #DEBUG_LINE_NO:145
EndFunction

ObjectReference[] Function GetPossibleReceiverRefs()
  ObjectReference[] receiverRefs = None ; #DEBUG_LINE_NO:151
  If ReceiverTypeEnum == Self.iReceiverType_LinkedRef ; #DEBUG_LINE_NO:153
    receiverRefs = Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray() ; #DEBUG_LINE_NO:154
  ElseIf ReceiverTypeEnum == Self.iReceiverType_LinkedRefChain ; #DEBUG_LINE_NO:156
    receiverRefs = Self.GetLinkedRefChain(LinkedRefKeyword, 100) ; #DEBUG_LINE_NO:157
  ElseIf ReceiverTypeEnum == Self.iReceiverType_LinkedRefChildren ; #DEBUG_LINE_NO:159
    receiverRefs = Self.GetRefsLinkedToMe(LinkedRefKeyword, None) ; #DEBUG_LINE_NO:160
  ElseIf ReceiverTypeEnum == Self.iReceiverType_Self ; #DEBUG_LINE_NO:162
    receiverRefs = Self.GetSingleRefArray() ; #DEBUG_LINE_NO:163
  ElseIf ReceiverTypeEnum == Self.iReceiverType_SelfAndLinkedRef ; #DEBUG_LINE_NO:165
    receiverRefs = Self.GetSingleRefArray() ; #DEBUG_LINE_NO:166
    receiverRefs.add(Self.GetLinkedRef(LinkedRefKeyword), 1) ; #DEBUG_LINE_NO:167
  EndIf ; #DEBUG_LINE_NO:
  Return receiverRefs ; #DEBUG_LINE_NO:175
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:184
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:188
EndFunction
