ScriptName Curve Extends Form Native hidden

;-- Functions ---------------------------------------

Float Function GetValueAt(Float afInput) Native

Bool Function HasValueAt(Float afInput) Native

Float[] Function GetValues(Float[] Inputs)
  Float[] values = new Float[Inputs.Length] ; #DEBUG_LINE_NO:13
  Int I = 0 ; #DEBUG_LINE_NO:15
  While I < Inputs.Length ; #DEBUG_LINE_NO:16
    values[I] = Self.GetValueAt(Inputs[I]) ; #DEBUG_LINE_NO:17
    I += 1 ; #DEBUG_LINE_NO:18
  EndWhile ; #DEBUG_LINE_NO:
  Return values ; #DEBUG_LINE_NO:21
EndFunction
