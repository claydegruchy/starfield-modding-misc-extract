ScriptName GlobalVariable Extends Form Native hidden

;-- Properties --------------------------------------
Float Property value hidden
  Float Function Get()
    Return Self.GetValue() ; #DEBUG_LINE_NO:22
  EndFunction
  Function Set(Float afValue)
    Self.SetValue(afValue) ; #DEBUG_LINE_NO:26
  EndFunction
EndProperty

;-- Functions ---------------------------------------

Float Function GetValue() Native

Function SetValue(Float afNewValue) Native

Int Function GetValueInt()
  Return Self.GetValue() as Int ; #DEBUG_LINE_NO:11
EndFunction

Function SetValueInt(Int aiNewValue)
  Self.SetValue(aiNewValue as Float) ; #DEBUG_LINE_NO:16
EndFunction

Float Function Mod(Float afHowMuch)
  Self.value = Self.value + afHowMuch ; #DEBUG_LINE_NO:32
  Return Self.value ; #DEBUG_LINE_NO:33
EndFunction
