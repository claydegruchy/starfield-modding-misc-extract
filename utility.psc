ScriptName Utility Extends ScriptObject Native hidden

;-- Functions ---------------------------------------

Var Function CallGlobalFunction(String asScriptName, String asFuncName, Var[] aParams) Global Native

Function CallGlobalFunctionNoWait(String asScriptName, String asFuncName, Var[] aParams) Global Native

String Function CaptureFrameRate(Int numFrames) Global Native

Function EndFrameRateCapture() Global Native

Function EnterTestData(String astestType, String astestMatter, String astestDetails, String astestResultContext, String astestResult) Global Native

String Function GameTimeToString(Float afGameTime) Global Native

Float Function GetAverageFrameRate() Global Native

Int Function GetBudgetCount() Global Native

String Function GetBudgetLimit(Int aiBudgetNumber) Global Native

String Function GetBudgetName(Int aiBudgetNumber) Global Native

String Function GetCurrentBudget(Int aiBudgetNumber) Global Native

Float Function GetCurrentGameTime() Global Native

String Function GetCurrentMemory() Global Native

Float Function GetCurrentRealTime() Global Native

Int Function GetCurrentStackID() Global Native

Float Function GetMaxFrameRate() Global Native

Float Function GetMinFrameRate() Global Native

String Function IntToHex(Int IntID) Global Native

Bool Function IsGameMenuPaused() Global Native

Bool Function OverBudget(Int aiBudgetNumber) Global Native

Function PostStartUpTimes() Global Native

Float Function RandomFloat(Float afMin, Float afMax) Global Native

Float[] Function RandomFloatsFromSeed(Int aiSeed, Int aiCount, Float afMin, Float afMax) Global Native

Int Function RandomInt(Int aiMin, Int aiMax) Global Native

Int[] Function RandomIntsFromSeed(Int aiSeed, Int aiCount, Int aiMin, Int aiMax) Global Native

Function SetINIBool(String ini, Bool value) Global Native

Function SetINIFloat(String ini, Float value) Global Native

Function SetINIInt(String ini, Int value) Global Native

Function SetINIString(String ini, String value) Global Native

Int[] Function SplitStringChars(String aString) Global Native

Function StartFrameRateCapture() Global Native

Function Wait(Float afSeconds) Global Native

Function WaitGameTime(Float afHours) Global Native

Function WaitMenuPause(Float afSeconds) Global Native

Float Function ExpiryDay(Float DaysFromNow, planet LocalPlanet, Float MaxUniversalDays, Float FutureStartDay) Global
  Float startDay = Math.Max(FutureStartDay, Utility.GetCurrentGameTime()) ; #DEBUG_LINE_NO:103
  Float localPlanetDayMult = 1.0 ; #DEBUG_LINE_NO:105
  If LocalPlanet ; #DEBUG_LINE_NO:106
    localPlanetDayMult = 24.0 / LocalPlanet.GetDayLength() ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
  Float globalDaysToAdd = DaysFromNow * localPlanetDayMult ; #DEBUG_LINE_NO:110
  If MaxUniversalDays > 0.0 ; #DEBUG_LINE_NO:112
    globalDaysToAdd = Math.Min(globalDaysToAdd, MaxUniversalDays) ; #DEBUG_LINE_NO:113
  EndIf ; #DEBUG_LINE_NO:
  Float ExpiryDay = startDay + globalDaysToAdd ; #DEBUG_LINE_NO:116
  Return ExpiryDay ; #DEBUG_LINE_NO:118
EndFunction

Bool Function HasExpiryDayPassed(Float afExpiryDay) Global
  Return Utility.GetCurrentGameTime() >= afExpiryDay ; #DEBUG_LINE_NO:123
EndFunction

Float Function GetHoursUntilLocalHour(Float afTargetHourLocal) Global
  Float dayLength = 24.0 ; #DEBUG_LINE_NO:128
  planet currentPlanet = Game.GetPlayer().GetCurrentPlanet() ; #DEBUG_LINE_NO:129
  If currentPlanet ; #DEBUG_LINE_NO:130
    dayLength = currentPlanet.GetDayLength() ; #DEBUG_LINE_NO:131
  EndIf ; #DEBUG_LINE_NO:
  Float currentTime = 0.0 ; #DEBUG_LINE_NO:133
  If currentPlanet ; #DEBUG_LINE_NO:134
    currentTime = Game.GetLocalTime() ; #DEBUG_LINE_NO:135
  Else ; #DEBUG_LINE_NO:
    Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:137
    currentTime = (currentGameTime - Math.Floor(currentGameTime) as Float) * 24.0 ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
  Float hoursUntil = 0.0 ; #DEBUG_LINE_NO:141
  If afTargetHourLocal > currentTime ; #DEBUG_LINE_NO:142
    hoursUntil = afTargetHourLocal - currentTime ; #DEBUG_LINE_NO:143
  Else ; #DEBUG_LINE_NO:
    hoursUntil = 24.0 - currentTime + afTargetHourLocal ; #DEBUG_LINE_NO:145
  EndIf ; #DEBUG_LINE_NO:
  Float realHoursUntil = hoursUntil * dayLength / 24.0 ; #DEBUG_LINE_NO:149
  Return realHoursUntil ; #DEBUG_LINE_NO:153
EndFunction

ObjectReference Function GetFirstPlayer(ObjectReference refToCheck01, ObjectReference refToCheck02, ObjectReference refToCheck03, ObjectReference refTocheck04) Global
  ObjectReference thePlayer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:159
  ObjectReference foundPlayerRef = None ; #DEBUG_LINE_NO:160
  ObjectReference[] refsToCheck = new ObjectReference[4] ; #DEBUG_LINE_NO:162
  refsToCheck[0] = refToCheck01 ; #DEBUG_LINE_NO:163
  refsToCheck[1] = refToCheck02 ; #DEBUG_LINE_NO:164
  refsToCheck[2] = refToCheck03 ; #DEBUG_LINE_NO:165
  refsToCheck[3] = refTocheck04 ; #DEBUG_LINE_NO:166
  Int I = 0 ; #DEBUG_LINE_NO:169
  While foundPlayerRef == None && I < refsToCheck.Length ; #DEBUG_LINE_NO:170
    If refsToCheck[I] == thePlayer ; #DEBUG_LINE_NO:171
      foundPlayerRef = refsToCheck[I] ; #DEBUG_LINE_NO:172
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:174
  EndWhile ; #DEBUG_LINE_NO:
  Return foundPlayerRef ; #DEBUG_LINE_NO:177
EndFunction

ObjectReference Function GetFirstNonPlayer(ObjectReference refToCheck01, ObjectReference refToCheck02, ObjectReference refToCheck03, ObjectReference refTocheck04) Global
  ObjectReference thePlayer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:182
  ObjectReference foundNonPlayerRef = None ; #DEBUG_LINE_NO:183
  ObjectReference[] refsToCheck = new ObjectReference[4] ; #DEBUG_LINE_NO:185
  refsToCheck[0] = refToCheck01 ; #DEBUG_LINE_NO:186
  refsToCheck[1] = refToCheck02 ; #DEBUG_LINE_NO:187
  refsToCheck[2] = refToCheck03 ; #DEBUG_LINE_NO:188
  refsToCheck[3] = refTocheck04 ; #DEBUG_LINE_NO:189
  Int I = 0 ; #DEBUG_LINE_NO:192
  While foundNonPlayerRef == None && I < refsToCheck.Length ; #DEBUG_LINE_NO:193
    If refsToCheck[I] != thePlayer ; #DEBUG_LINE_NO:194
      foundNonPlayerRef = refsToCheck[I] ; #DEBUG_LINE_NO:195
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:197
  EndWhile ; #DEBUG_LINE_NO:
  Return foundNonPlayerRef ; #DEBUG_LINE_NO:200
EndFunction
