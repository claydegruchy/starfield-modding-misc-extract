ScriptName SignalSender_OnActivate Extends SignalSenderScript
{ Sends a Signal to SignalReceiverScripts.

SignalParameters.Ref1 = akActionRef  (from OnActivate event)

ConditionReferences.Subject = self
ConditionReferences.Target = akActionRef  (from OnActivate event) }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  signalsenderscript:signalparameters signalParameters = new signalsenderscript:signalparameters ; #DEBUG_LINE_NO:12
  signalParameters.Ref1 = akActionRef ; #DEBUG_LINE_NO:13
  signalsenderscript:conditionreferences conditionReferences = new signalsenderscript:conditionreferences ; #DEBUG_LINE_NO:15
  conditionReferences.Subject = Self as ObjectReference ; #DEBUG_LINE_NO:16
  conditionReferences.Target = akActionRef ; #DEBUG_LINE_NO:17
  Self.SendSignal(signalParameters, conditionReferences) ; #DEBUG_LINE_NO:19
EndEvent
