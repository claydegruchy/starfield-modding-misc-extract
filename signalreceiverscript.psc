ScriptName SignalReceiverScript Extends ObjectReference
{ Receives signal(s) from one or more ObjectReferences with a SignalSenderScript attached }

;-- Structs -----------------------------------------
Struct Result
  Keyword Signal
  { Result fires on this Signal }
  Int ResultTypeEnum
  { 0 = Custom
1 = Rename Object
2 = Set ActorValue
3 = Damage ActorValue [NOT IMPLMENTED]
4 = Restore ActorValue [NOT IMPLMENTED]
5 = Increment/Decrement ActorValue ( positive ADDs to if negative SUBTRACTs from current value and then Sets the value to that) [NOT IMPLMENTED]
6 = Enable
7 = Disable
8 = Toggle Enable/Disable State
9 = PlaceAtMe (places at TargetRef)
10 = PlaceActorAtMe (places at TargetRef)
11 = Show Message }
  Form FormParam1
  { Depending on ResultType this param is expected to be a particular type.
ResultTypeEnum:
0 (custom): See custom script for details
1 (rename): Message that contains the new name
2-5 (change AV): ActorValue to change
6-8 (enable/disable): N/A
9-10 (place at me): The thing to place (Leveled List, BaseObject, BaseActor, etc.)
11 (show message): the message to show }
  Float ValueParam1
  { Depending on ResultType this param is will mean a particular thing.
ResultTypeEnum:
0 (custom): See custom script for details
1 (rename): N/A
2 (set av): The new value for the AV
3 (dmg av): The amount to damage the AV by
4 (restore av): The about to restore the AV by
5 (inc/dec av): The amount to add to the AV (to decrement use a negatve value)
6-8 (enable/disable): N/A
9 (place at me): count of things to place
10 (place actor me): encounter level of actor to place
11 (show message): N/A }
  GlobalVariable GlobalParam1
  { Depending on ResultType this param is will mean a particular thing.
ResultTypeEnum:
0 (custom): See custom script for details
1 (rename): N/A
2 (set av): The new value for the AV [OVERRIDES ValueParm1]
3 (dmg av): The amount to damage the AV by [OVERRIDES ValueParm1]
4 (restore av): The about to restore the AV by [OVERRIDES ValueParm1]
5 (inc/dec av): The amount to add to the AV (to decrement use a negatve value) [OVERRIDES ValueParm1]
6-8 (enable/disable): N/A
9-10 (place at me): N/A
11 (show message): N/A }
  Int TargetRefEnum = 0
  { Thing to do the result on:
0 = self
1 = linkedRef
2 = linkedRefChain
3 = linkedRefChildren (things linkedref to self) }
  Keyword LinkedRefKeyword
  { Optional: the keyword used when getting TargetRefs if TargetRefEnum is a LinkedRef type }
  conditionform Conditions
  { Optional: Conditions that must be true for Result to fire when receiving the Signal.
RunOn SUBJECT will be THIS reference (the object this script is attached to)
RunOn TARGET will be the TargetRef(s) as described by TargetRefEnum }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Results
  signalreceiverscript:result[] Property Results Auto Const
  { All standard results will fire for matching signals
	This may change as the script develops further }
EndGroup

Int Property iResultType_Custom = 0 AutoReadOnly
Int Property iResultType_Rename = 1 AutoReadOnly
Int Property iResultType_SetAV = 2 AutoReadOnly
Int Property iResultType_DamageAV = 3 AutoReadOnly
Int Property iResultType_RestoreAV = 4 AutoReadOnly
Int Property iResultType_IncrementDecrementAV = 5 AutoReadOnly
Int Property iResultType_Enable = 6 AutoReadOnly
Int Property iResultType_Disable = 7 AutoReadOnly
Int Property iResultType_ToggleEnableState = 8 AutoReadOnly
Int Property iResultType_PlaceAtMe = 9 AutoReadOnly
Int Property iResultType_PlaceActorAtMe = 10 AutoReadOnly
Int Property iResultType_ShowMessage = 11 AutoReadOnly
Int Property iTargetRef_Self = 0 AutoReadOnly
Int Property iTargetRef_LinkedRef = 1 AutoReadOnly
Int Property iTargetRef_LinkedRefChain = 2 AutoReadOnly
Int Property iTargetRef_LinkedRefChildren = 3 AutoReadOnly

;-- Functions ---------------------------------------

Function HandleCustomResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function ReceiveSignalCustom(signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function ReceiveSignal(signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  Self.HandleResults(SignalSignature, SignalParameters) ; #DEBUG_LINE_NO:118
  Self.ReceiveSignalCustom(SignalSignature, SignalParameters) ; #DEBUG_LINE_NO:119
EndFunction

ObjectReference[] Function GetValidTargetRefs(signalreceiverscript:result Result)
  ObjectReference[] targetRefs = None ; #DEBUG_LINE_NO:141
  If Result.TargetRefEnum == Self.iTargetRef_Self ; #DEBUG_LINE_NO:143
    targetRefs = Self.GetSingleRefArray() ; #DEBUG_LINE_NO:144
  ElseIf Result.TargetRefEnum == Self.iTargetRef_LinkedRef ; #DEBUG_LINE_NO:145
    targetRefs = Self.GetLinkedRef(Result.LinkedRefKeyword).GetSingleRefArray() ; #DEBUG_LINE_NO:146
  ElseIf Result.TargetRefEnum == Self.iTargetRef_LinkedRefChain ; #DEBUG_LINE_NO:147
    targetRefs = Self.GetLinkedRefChain(Result.LinkedRefKeyword, 100) ; #DEBUG_LINE_NO:148
  ElseIf Result.TargetRefEnum == Self.iTargetRef_LinkedRefChildren ; #DEBUG_LINE_NO:149
    targetRefs = Self.GetRefsLinkedToMe(Result.LinkedRefKeyword, None) ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
  Int I = targetRefs.Length ; #DEBUG_LINE_NO:155
  While I >= 0 ; #DEBUG_LINE_NO:156
    ObjectReference currentRef = targetRefs[I] ; #DEBUG_LINE_NO:157
    If Result.Conditions as Bool && Result.Conditions.IsTrue(Self as ObjectReference, currentRef) == False ; #DEBUG_LINE_NO:159
      targetRefs.remove(I, 1) ; #DEBUG_LINE_NO:160
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:163
  EndWhile ; #DEBUG_LINE_NO:
  Return targetRefs ; #DEBUG_LINE_NO:167
EndFunction

Bool Function IsChangeAVResultType(Int ResultTypeEnum)
  Return ResultTypeEnum == Self.iResultType_SetAV || ResultTypeEnum == Self.iResultType_DamageAV || ResultTypeEnum == Self.iResultType_RestoreAV || ResultTypeEnum == Self.iResultType_IncrementDecrementAV ; #DEBUG_LINE_NO:173
EndFunction

Bool Function IsChangeEnableStateResultType(Int ResultTypeEnum)
  Return ResultTypeEnum == Self.iResultType_Enable || ResultTypeEnum == Self.iResultType_Disable || ResultTypeEnum == Self.iResultType_ToggleEnableState ; #DEBUG_LINE_NO:177
EndFunction

Function HandleResults(signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  signalreceiverscript:result[] matchingResults = Results.GetMatchingStructs("Signal", SignalSignature.Signal, 0, -1) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs  ; #DEBUG_LINE_NO:184
  Int I = 0 ; #DEBUG_LINE_NO:186
  While I < matchingResults.Length ; #DEBUG_LINE_NO:187
    signalreceiverscript:result currentResult = matchingResults[I] ; #DEBUG_LINE_NO:188
    ObjectReference[] ValidTargetRefs = Self.GetValidTargetRefs(currentResult) ; #DEBUG_LINE_NO:190
    If currentResult.ResultTypeEnum == Self.iResultType_Custom ; #DEBUG_LINE_NO:192
      Self.HandleCustomResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters) ; #DEBUG_LINE_NO:194
    ElseIf currentResult.ResultTypeEnum == Self.iResultType_Rename ; #DEBUG_LINE_NO:196
      Self.HandleRenameResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters) ; #DEBUG_LINE_NO:197
    ElseIf Self.IsChangeAVResultType(currentResult.ResultTypeEnum) ; #DEBUG_LINE_NO:199
      Self.HandleChangeAVResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters) ; #DEBUG_LINE_NO:200
    ElseIf Self.IsChangeEnableStateResultType(currentResult.ResultTypeEnum) ; #DEBUG_LINE_NO:202
      Self.HandleEnableOrDisableResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters) ; #DEBUG_LINE_NO:203
    ElseIf currentResult.ResultTypeEnum == Self.iResultType_PlaceAtMe || currentResult.ResultTypeEnum == Self.iResultType_PlaceActorAtMe ; #DEBUG_LINE_NO:205
      Self.HandlePlaceAtMeResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters) ; #DEBUG_LINE_NO:206
    ElseIf currentResult.ResultTypeEnum == Self.iResultType_ShowMessage ; #DEBUG_LINE_NO:208
      Self.HandleShowMessageResult(currentResult, ValidTargetRefs, SignalSignature, SignalParameters) ; #DEBUG_LINE_NO:209
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:213
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function HandleRenameResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  Message newNameMsg = Result.FormParam1 as Message ; #DEBUG_LINE_NO:222
  Int I = 0 ; #DEBUG_LINE_NO:224
  While I < ValidTargetRefs.Length ; #DEBUG_LINE_NO:225
    ObjectReference currentTargetRef = ValidTargetRefs[I] ; #DEBUG_LINE_NO:226
    currentTargetRef.SetOverrideName(newNameMsg) ; #DEBUG_LINE_NO:229
    I += 1 ; #DEBUG_LINE_NO:231
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function HandleChangeAVResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  ActorValue AV = Result.FormParam1 as ActorValue ; #DEBUG_LINE_NO:240
  Float changeValue = 0.0 ; #DEBUG_LINE_NO:242
  If Result.GlobalParam1 ; #DEBUG_LINE_NO:243
    changeValue = Result.GlobalParam1.GetValue() ; #DEBUG_LINE_NO:244
  Else ; #DEBUG_LINE_NO:
    changeValue = Result.ValueParam1 ; #DEBUG_LINE_NO:246
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:249
  While I < ValidTargetRefs.Length ; #DEBUG_LINE_NO:250
    ObjectReference currentTargetRef = ValidTargetRefs[I] ; #DEBUG_LINE_NO:251
    Float oldValue = currentTargetRef.GetValue(AV) ; #DEBUG_LINE_NO:253
    Float newValue = changeValue ; #DEBUG_LINE_NO:254
    If Result.ResultTypeEnum == Self.iResultType_IncrementDecrementAV ; #DEBUG_LINE_NO:256
      newValue = oldValue + changeValue ; #DEBUG_LINE_NO:257
    EndIf ; #DEBUG_LINE_NO:
    If Result.ResultTypeEnum == Self.iResultType_SetAV || Result.ResultTypeEnum == Self.iResultType_IncrementDecrementAV ; #DEBUG_LINE_NO:260
      currentTargetRef.SetValue(AV, newValue) ; #DEBUG_LINE_NO:262
    ElseIf Result.ResultTypeEnum == Self.iResultType_DamageAV ; #DEBUG_LINE_NO:264
      currentTargetRef.DamageValue(AV, newValue) ; #DEBUG_LINE_NO:266
    ElseIf Result.ResultTypeEnum == Self.iResultType_RestoreAV ; #DEBUG_LINE_NO:268
      currentTargetRef.RestoreValue(AV, newValue) ; #DEBUG_LINE_NO:270
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:273
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function HandleEnableOrDisableResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  Int I = 0 ; #DEBUG_LINE_NO:281
  While I < ValidTargetRefs.Length ; #DEBUG_LINE_NO:282
    ObjectReference currentTargetRef = ValidTargetRefs[I] ; #DEBUG_LINE_NO:283
    Bool shouldEnable = False ; #DEBUG_LINE_NO:285
    If Result.ResultTypeEnum == Self.iResultType_Enable ; #DEBUG_LINE_NO:287
      shouldEnable = True ; #DEBUG_LINE_NO:288
    ElseIf Result.ResultTypeEnum == Self.iResultType_Disable ; #DEBUG_LINE_NO:289
      shouldEnable = False ; #DEBUG_LINE_NO:290
    ElseIf Result.ResultTypeEnum == Self.iResultType_ToggleEnableState ; #DEBUG_LINE_NO:291
      shouldEnable = !currentTargetRef.IsEnabled() ; #DEBUG_LINE_NO:292
    EndIf ; #DEBUG_LINE_NO:
    If shouldEnable ; #DEBUG_LINE_NO:295
      currentTargetRef.EnableNoWait(False) ; #DEBUG_LINE_NO:297
    Else ; #DEBUG_LINE_NO:
      currentTargetRef.DisableNoWait(False) ; #DEBUG_LINE_NO:300
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:303
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function HandlePlaceAtMeResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  Int I = 0 ; #DEBUG_LINE_NO:312
  While I < ValidTargetRefs.Length ; #DEBUG_LINE_NO:313
    ObjectReference currentTargetRef = ValidTargetRefs[I] ; #DEBUG_LINE_NO:314
    If Result.ResultTypeEnum == Self.iResultType_PlaceAtMe ; #DEBUG_LINE_NO:316
      Int count = Math.max(Result.ValueParam1, 1.0) as Int ; #DEBUG_LINE_NO:319
      ObjectReference placedRef = currentTargetRef.PlaceAtMe(Result.FormParam1, count, False, False, True, None, None, True) ; #DEBUG_LINE_NO:320
    ElseIf Result.ResultTypeEnum == Self.iResultType_PlaceActorAtMe ; #DEBUG_LINE_NO:323
      ObjectReference placedref = currentTargetRef.PlaceActorAtMe(Result.FormParam1 as ActorBase, Result.ValueParam1 as Int, None, False, False, True, None, True) as ObjectReference ; #DEBUG_LINE_NO:325
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:330
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function HandleShowMessageResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  Int I = 0 ; #DEBUG_LINE_NO:340
  While I < ValidTargetRefs.Length ; #DEBUG_LINE_NO:341
    ObjectReference currentTargetRef = ValidTargetRefs[I] ; #DEBUG_LINE_NO:342
    (Result.FormParam1 as Message).Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:345
    I += 1 ; #DEBUG_LINE_NO:347
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:359
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:363
EndFunction
