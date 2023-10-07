ScriptName SignalReceiver_TestPipeGasSpray Extends SignalReceiverScript

;-- Variables ---------------------------------------
Bool Damaged
Bool IsSpraying
Bool SwitchOn

;-- Properties --------------------------------------
Group CustomReceiveSignal_Properties
  Keyword Property Signal_SwitchOn Auto Const mandatory
  Keyword Property Signal_SwitchOff Auto Const mandatory
  Keyword Property Signal_ObjectDamaged Auto Const mandatory
  Message Property TestSprayMessage Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function ReceiveSignalCustom(signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  IsSpraying = False ; #DEBUG_LINE_NO:22
  If SignalSignature.Signal == Signal_SwitchOn ; #DEBUG_LINE_NO:24
    SwitchOn = True ; #DEBUG_LINE_NO:25
    Self.SprayIfAppropriate() ; #DEBUG_LINE_NO:26
  ElseIf SignalSignature.Signal == Signal_SwitchOff ; #DEBUG_LINE_NO:27
    SwitchOn = False ; #DEBUG_LINE_NO:28
    Self.SprayIfAppropriate() ; #DEBUG_LINE_NO:29
  ElseIf SignalSignature.Signal == Signal_ObjectDamaged ; #DEBUG_LINE_NO:30
    Damaged = True ; #DEBUG_LINE_NO:31
    Self.SprayIfAppropriate() ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SprayIfAppropriate()
  If SwitchOn && Damaged ; #DEBUG_LINE_NO:41
    IsSpraying = True ; #DEBUG_LINE_NO:42
    TestSprayMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:45
  Else ; #DEBUG_LINE_NO:
    IsSpraying = False ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandleCustomResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  If IsSpraying && SignalSignature.Signal == Signal_SwitchOff ; #DEBUG_LINE_NO:60
    (Result.FormParam1 as Message).Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:61
  EndIf ; #DEBUG_LINE_NO:
EndFunction
