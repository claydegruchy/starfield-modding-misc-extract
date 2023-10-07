ScriptName Math Extends ScriptObject Native hidden

;-- Functions ---------------------------------------

Int Function Ceiling(Float afValue) Global Native

Float Function DegreesToRadians(Float afDegrees) Global Native

Int Function Floor(Float afValue) Global Native

Float Function RadiansToDegrees(Float afRadians) Global Native

Float Function abs(Float afValue) Global Native

Float Function acos(Float afValue) Global Native

Float Function asin(Float afValue) Global Native

Float Function atan(Float afValue) Global Native

Float Function cos(Float afValue) Global Native

Float Function pow(Float x, Float y) Global Native

Float Function sin(Float afValue) Global Native

Float Function sqrt(Float afValue) Global Native

Float Function tan(Float afValue) Global Native

Float Function Max(Float afValue1, Float afValue2) Global
  If afValue1 > afValue2 ; #DEBUG_LINE_NO:44
    Return afValue1 ; #DEBUG_LINE_NO:45
  Else ; #DEBUG_LINE_NO:
    Return afValue2 ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Float Function Min(Float afValue1, Float afValue2) Global
  If afValue1 < afValue2 ; #DEBUG_LINE_NO:53
    Return afValue1 ; #DEBUG_LINE_NO:54
  Else ; #DEBUG_LINE_NO:
    Return afValue2 ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Float Function Clamp(Float ValueToClamp, Float afValueMin, Float afValueMax) Global
  Return Math.Max(Math.Min(ValueToClamp, afValueMax), afValueMin) ; #DEBUG_LINE_NO:62
EndFunction

Float Function Normalize(Float afValue, Float afMin, Float afMax) Global
  Return (afValue - afMin) / (afMax - afMin) ; #DEBUG_LINE_NO:67
EndFunction

Int Function Round(Float afValueToRound) Global
  Int trunc = afValueToRound as Int ; #DEBUG_LINE_NO:72
  If Math.abs(afValueToRound) - Math.abs(trunc as Float) >= 0.5 ; #DEBUG_LINE_NO:74
    If afValueToRound < 0.0 ; #DEBUG_LINE_NO:75
      Return trunc - 1 ; #DEBUG_LINE_NO:76
    Else ; #DEBUG_LINE_NO:
      Return trunc + 1 ; #DEBUG_LINE_NO:78
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return trunc ; #DEBUG_LINE_NO:82
EndFunction

Int Function ExtractDigit(Int number, Int position, Int NonExistentDigit) Global
  Int leftDigits = number / Math.pow(10.0, position as Float) as Int ; #DEBUG_LINE_NO:97
  If leftDigits < 1 ; #DEBUG_LINE_NO:99
    Return NonExistentDigit ; #DEBUG_LINE_NO:100
  Else ; #DEBUG_LINE_NO:
    Return leftDigits % 10 ; #DEBUG_LINE_NO:102
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Float Function HoursAsDays(Float afHours) Global
  Return afHours / 24.0 ; #DEBUG_LINE_NO:109
EndFunction

Float Function MinutesAsDays(Float afMinutes) Global
  Return afMinutes / 24.0 / 60.0 ; #DEBUG_LINE_NO:114
EndFunction

Float Function SecondsAsDays(Float afSeconds) Global
  Return afSeconds / 24.0 / 60.0 / 60.0 ; #DEBUG_LINE_NO:119
EndFunction

Float Function DaysAsHours(Float afDays) Global
  Return afDays * 24.0 ; #DEBUG_LINE_NO:124
EndFunction

Float Function DaysAsMinutes(Float afDays) Global
  Return afDays * 24.0 * 60.0 ; #DEBUG_LINE_NO:129
EndFunction

Float Function DaysAsSeconds(Float afDays) Global
  Return afDays * 24.0 * 60.0 * 60.0 ; #DEBUG_LINE_NO:134
EndFunction
