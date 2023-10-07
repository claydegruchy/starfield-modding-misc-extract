ScriptName SQ_ENV_AfflictionsScript Extends Quest

;-- Structs -----------------------------------------
Struct FallingAfflictionDatum
  env_afflictionscript Affliction
  Bool SmallFall
  Bool MediumFall
  Bool LargeFall
EndStruct


;-- Variables ---------------------------------------
Int DebugDieRoll_Cure = -1
Int DebugDieRoll_Improve = -1
Int DebugDieRoll_Infection = -1
Int DebugDieRoll_Worsen = -1
Int NumberOfSystems = 4 Const
Float SystemDuration = 150.0 Const
Float TimerDur_Override = -1.0
Int iNextSystem
Int iSystem_Cure = 0 Const
Int iSystem_Improve = 3 Const
Int iSystem_Infection = 1 Const
Int iSystem_Worsen = 2 Const

;-- Properties --------------------------------------
Group Autofill
  sq_envscript Property SQ_ENV Auto Const mandatory
  Message Property ENV_AFFL_Cured_Msg Auto Const mandatory
  Message Property ENV_AFFL_Gained_Msg Auto Const mandatory
  Message Property ENV_AFFL_Worsened_Msg Auto Const mandatory
  Message Property ENV_AFFL_Improved_Msg Auto Const mandatory
  Message Property ENV_AFFL_Improved_Severity_Msg Auto Const mandatory
  GlobalVariable Property ENV_AFFL_InfectionSpreadAllowed Auto Const mandatory
  ActorValue Property ENV_AFFL_Treatment_CureChance_Infection Auto Const mandatory
  ActorValue Property ENV_AFFL_Treatment_CureChance_Injury Auto Const mandatory
EndGroup

env_afflictionscript[] Property AfflictionData Auto Const mandatory
sq_env_afflictionsscript:fallingafflictiondatum[] Property FallingAfflictionData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.StartAfflictionTimer(Self as ScriptObject) ; #DEBUG_LINE_NO:46
EndEvent

Event OnTimer(Int aiTimerID)
  Self.HandleTimer() ; #DEBUG_LINE_NO:51
EndEvent

Bool Function IsInfectionSpreadAllowed()
  Bool returnVal = ENV_AFFL_InfectionSpreadAllowed.GetValue() == 1.0 ; #DEBUG_LINE_NO:55
  Return returnVal ; #DEBUG_LINE_NO:57
EndFunction

Function StartAfflictionTimer(ScriptObject CallingObject)
  Self.StartTimer(Self.GetTimerDuration(), 0) ; #DEBUG_LINE_NO:62
EndFunction

Float Function GetTimerDuration()
  Float returnVal = SystemDuration / NumberOfSystems as Float ; #DEBUG_LINE_NO:69
  If TimerDur_Override > -1.0 ; #DEBUG_LINE_NO:70
    returnVal = TimerDur_Override ; #DEBUG_LINE_NO:72
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:77
EndFunction

Function HandleTimer()
  env_afflictionscript[] activeAfflictionDataToProcess = None ; #DEBUG_LINE_NO:85
  If iNextSystem == iSystem_Cure ; #DEBUG_LINE_NO:88
    activeAfflictionDataToProcess = Self.GetActiveAfflictions(True, False, False, False, None) ; #DEBUG_LINE_NO:89
  ElseIf iNextSystem == iSystem_Infection && Self.IsInfectionSpreadAllowed() ; #DEBUG_LINE_NO:91
    activeAfflictionDataToProcess = Self.GetActiveAfflictions(False, True, False, False, None) ; #DEBUG_LINE_NO:92
  ElseIf iNextSystem == iSystem_Worsen ; #DEBUG_LINE_NO:94
    activeAfflictionDataToProcess = Self.GetActiveAfflictions(False, False, True, False, None) ; #DEBUG_LINE_NO:95
  ElseIf iNextSystem == iSystem_Improve ; #DEBUG_LINE_NO:97
    activeAfflictionDataToProcess = Self.GetActiveAfflictions(False, False, False, True, None) ; #DEBUG_LINE_NO:98
  EndIf ; #DEBUG_LINE_NO:
  Bool handled = False ; #DEBUG_LINE_NO:104
  Int[] randomizedIndexes = commonarrayfunctions.GetRandomizedIndexes(activeAfflictionDataToProcess.Length) ; #DEBUG_LINE_NO:105
  Int dieRoll = Game.GetDieRoll(1, 100, -1) ; #DEBUG_LINE_NO:110
  Int I = 0 ; #DEBUG_LINE_NO:112
  While I < randomizedIndexes.Length && handled == False ; #DEBUG_LINE_NO:113
    env_afflictionscript currentAffliction = activeAfflictionDataToProcess[randomizedIndexes[I]] ; #DEBUG_LINE_NO:114
    If iNextSystem == iSystem_Cure ; #DEBUG_LINE_NO:118
      handled = currentAffliction.AttemptToCure(dieRoll, DebugDieRoll_Cure) ; #DEBUG_LINE_NO:120
    ElseIf iNextSystem == iSystem_Infection ; #DEBUG_LINE_NO:121
      handled = currentAffliction.AttemptToGainInfection(dieRoll, DebugDieRoll_Infection) ; #DEBUG_LINE_NO:124
    ElseIf iNextSystem == iSystem_Worsen ; #DEBUG_LINE_NO:125
      handled = currentAffliction.AttemptToWorsen(dieRoll, DebugDieRoll_Worsen) ; #DEBUG_LINE_NO:128
    ElseIf iNextSystem == iSystem_Improve ; #DEBUG_LINE_NO:129
      handled = currentAffliction.AttemptToImprove(dieRoll, DebugDieRoll_Improve) ; #DEBUG_LINE_NO:131
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:135
  EndWhile ; #DEBUG_LINE_NO:
  iNextSystem = (iNextSystem + 1) % NumberOfSystems ; #DEBUG_LINE_NO:139
  Self.StartAfflictionTimer(Self as ScriptObject) ; #DEBUG_LINE_NO:142
EndFunction

env_afflictionscript[] Function GetActiveAfflictions(Bool OnlyCurable, Bool OnlyInfectable, Bool OnlyWorsenable, Bool OnlyImproveable, Keyword OnlyMatchingTreatmentEffectKeyword)
  env_afflictionscript[] activeAfflictionData = new env_afflictionscript[0] ; #DEBUG_LINE_NO:149
  Int I = 0 ; #DEBUG_LINE_NO:151
  While I < AfflictionData.Length ; #DEBUG_LINE_NO:152
    env_afflictionscript currentAffliction = AfflictionData[I] ; #DEBUG_LINE_NO:153
    If currentAffliction.Active ; #DEBUG_LINE_NO:155
      If OnlyCurable == False || currentAffliction.GetChance_Cure() > 0 ; #DEBUG_LINE_NO:156
        If OnlyInfectable == False || currentAffliction.GetChance_Infection() > 0 ; #DEBUG_LINE_NO:157
          If OnlyWorsenable == False || currentAffliction.GetChance_Worsen() > 0 ; #DEBUG_LINE_NO:158
            If OnlyImproveable == False || currentAffliction.GetChance_Improve() > 0 ; #DEBUG_LINE_NO:159
              If OnlyMatchingTreatmentEffectKeyword == None || currentAffliction.TreatmentEffectKeyword == OnlyMatchingTreatmentEffectKeyword ; #DEBUG_LINE_NO:160
                activeAfflictionData.add(currentAffliction, 1) ; #DEBUG_LINE_NO:161
              EndIf ; #DEBUG_LINE_NO:
            EndIf ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:169
  EndWhile ; #DEBUG_LINE_NO:
  Return activeAfflictionData ; #DEBUG_LINE_NO:174
EndFunction

Function ImproveActiveAfflictions(Keyword TreatmentEffectKeyword, Int ImprovementLevels, Bool IsTreatment)
  env_afflictionscript[] afflictionsToImprove = Self.GetActiveAfflictions(False, False, False, False, TreatmentEffectKeyword) ; #DEBUG_LINE_NO:180
  Bool hardcoreMode = False ; #DEBUG_LINE_NO:182
  Bool cureRandomInfection = IsTreatment && Game.GetDieRollSuccess(Game.GetPlayer().GetValue(ENV_AFFL_Treatment_CureChance_Infection) as Int, 1, 100, -1, -1) ; #DEBUG_LINE_NO:184
  Bool cureRandomInjury = IsTreatment && Game.GetDieRollSuccess(Game.GetPlayer().GetValue(ENV_AFFL_Treatment_CureChance_Injury) as Int, 1, 100, -1, -1) ; #DEBUG_LINE_NO:185
  Int[] randomizedIndexes = commonarrayfunctions.GetRandomizedIndexes(afflictionsToImprove.Length) ; #DEBUG_LINE_NO:189
  Int I = 0 ; #DEBUG_LINE_NO:190
  While I < randomizedIndexes.Length ; #DEBUG_LINE_NO:191
    env_afflictionscript currentAffliction = afflictionsToImprove[randomizedIndexes[I]] ; #DEBUG_LINE_NO:192
    If hardcoreMode ; #DEBUG_LINE_NO:194
      If cureRandomInfection && currentAffliction.IsInfection ; #DEBUG_LINE_NO:195
        currentAffliction.Cure() ; #DEBUG_LINE_NO:197
        cureRandomInfection = False ; #DEBUG_LINE_NO:198
      ElseIf cureRandomInjury && currentAffliction.IsInfection == False ; #DEBUG_LINE_NO:199
        currentAffliction.Cure() ; #DEBUG_LINE_NO:201
        cureRandomInjury = False ; #DEBUG_LINE_NO:202
      Else ; #DEBUG_LINE_NO:
        currentAffliction.Improve(ImprovementLevels) ; #DEBUG_LINE_NO:205
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      currentAffliction.Cure() ; #DEBUG_LINE_NO:209
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:213
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Keyword[] Function GetTreatmentKeywordsForActiveAfflictions()
  Keyword[] treatmentKeywords = new Keyword[0] ; #DEBUG_LINE_NO:223
  env_afflictionscript[] activeAfflictions = Self.GetActiveAfflictions(False, False, False, False, None) ; #DEBUG_LINE_NO:225
  Int I = 0 ; #DEBUG_LINE_NO:227
  While I < activeAfflictions.Length ; #DEBUG_LINE_NO:228
    env_afflictionscript currentAffliction = activeAfflictions[I] ; #DEBUG_LINE_NO:229
    If treatmentKeywords.find(currentAffliction.TreatmentEffectKeyword, 0) < 0 ; #DEBUG_LINE_NO:232
      treatmentKeywords.add(currentAffliction.TreatmentEffectKeyword, 1) ; #DEBUG_LINE_NO:233
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:236
  EndWhile ; #DEBUG_LINE_NO:
  Return treatmentKeywords ; #DEBUG_LINE_NO:240
EndFunction

Bool Function PlayerHasMatchingTreatmentItemForAnActiveAffliction()
  Bool returnVal = False ; #DEBUG_LINE_NO:247
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:248
  Keyword[] neededTreatmentKeywords = Self.GetTreatmentKeywordsForActiveAfflictions() ; #DEBUG_LINE_NO:249
  Int I = 0 ; #DEBUG_LINE_NO:251
  While returnVal == False && I < neededTreatmentKeywords.Length ; #DEBUG_LINE_NO:252
    Keyword currentKeyword = neededTreatmentKeywords[I] ; #DEBUG_LINE_NO:253
    returnVal = PlayerRef.GetItemCount(currentKeyword as Form) > 0 ; #DEBUG_LINE_NO:254
    I += 1 ; #DEBUG_LINE_NO:255
  EndWhile ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:260
EndFunction

Bool Function FormHasMatchingTreatmentItemForAnActiveAffliction(Form FormToCheck)
  Bool returnVal = False ; #DEBUG_LINE_NO:266
  Keyword[] neededTreatmentKeywords = Self.GetTreatmentKeywordsForActiveAfflictions() ; #DEBUG_LINE_NO:268
  Int I = 0 ; #DEBUG_LINE_NO:272
  While returnVal == False && I < neededTreatmentKeywords.Length ; #DEBUG_LINE_NO:273
    Keyword currentKeyword = neededTreatmentKeywords[I] ; #DEBUG_LINE_NO:274
    returnVal = FormToCheck.HasKeyword(currentKeyword) ; #DEBUG_LINE_NO:278
    I += 1 ; #DEBUG_LINE_NO:280
  EndWhile ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:285
EndFunction

env_afflictionscript[] Function GetFallingAfflictionsSmall()
  Return Self.GetFallingAfflictions(FallingAfflictionData.GetMatchingStructs("SmallFall", True, 0, -1)) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs  ; #DEBUG_LINE_NO:290
EndFunction

env_afflictionscript[] Function GetFallingAfflictionsMedium()
  Return Self.GetFallingAfflictions(FallingAfflictionData.GetMatchingStructs("MediumFall", True, 0, -1)) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs  ; #DEBUG_LINE_NO:293
EndFunction

env_afflictionscript[] Function GetFallingAfflictionsLarge()
  Return Self.GetFallingAfflictions(FallingAfflictionData.GetMatchingStructs("LargeFall", True, 0, -1)) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs  ; #DEBUG_LINE_NO:296
EndFunction

env_afflictionscript[] Function GetFallingAfflictions(sq_env_afflictionsscript:fallingafflictiondatum[] MatchingData)
  env_afflictionscript[] matchingAfflictions = new env_afflictionscript[MatchingData.Length] ; #DEBUG_LINE_NO:301
  Int I = 0 ; #DEBUG_LINE_NO:303
  While I < MatchingData.Length ; #DEBUG_LINE_NO:304
    matchingAfflictions[I] = MatchingData[I].Affliction ; #DEBUG_LINE_NO:305
    I += 1 ; #DEBUG_LINE_NO:306
  EndWhile ; #DEBUG_LINE_NO:
  Return matchingAfflictions ; #DEBUG_LINE_NO:308
EndFunction

Function ShowCuredMessage(env_afflictionscript AfflictionToShowMessageFor)
  SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Cured_Msg, AfflictionToShowMessageFor as Form) ; #DEBUG_LINE_NO:314
  wwiseevent.PlayMenuSound("UIAfflictionPopUpMessageCured") ; #DEBUG_LINE_NO:315
EndFunction

Function ShowGainedMessage(env_afflictionscript AfflictionToShowMessageFor)
  SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Gained_Msg, AfflictionToShowMessageFor as Form) ; #DEBUG_LINE_NO:319
  wwiseevent.PlayMenuSound("UIAfflictionPopUpMessageGained") ; #DEBUG_LINE_NO:320
EndFunction

Function ShowWorsenedMessage(env_afflictionscript AfflictionToShowMessageFor)
  SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Worsened_Msg, AfflictionToShowMessageFor as Form) ; #DEBUG_LINE_NO:324
  wwiseevent.PlayMenuSound("UIAfflictionPopUpMessageWorsens") ; #DEBUG_LINE_NO:325
EndFunction

Function ShowImprovedMessage(env_afflictionscript AfflictionToShowMessageFor)
  SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Improved_Msg, AfflictionToShowMessageFor as Form) ; #DEBUG_LINE_NO:329
  wwiseevent.PlayMenuSound("UIAfflictionPopUpMessageImproved") ; #DEBUG_LINE_NO:330
EndFunction

Function ShowSeverityImprovedMessage(env_afflictionscript AfflictionToShowMessageFor)
  SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Improved_Severity_Msg, AfflictionToShowMessageFor as Form) ; #DEBUG_LINE_NO:334
  wwiseevent.PlayMenuSound("UIAfflictionPopUpMessageImproved") ; #DEBUG_LINE_NO:335
EndFunction

env_afflictionscript Function GetAfflictionByID(String ID)
  Int I = 0 ; #DEBUG_LINE_NO:339
  Int iMax = AfflictionData.Length ; #DEBUG_LINE_NO:340
  While I < iMax ; #DEBUG_LINE_NO:341
    env_afflictionscript currentAffliction = AfflictionData[I] ; #DEBUG_LINE_NO:342
    If currentAffliction.ID == ID ; #DEBUG_LINE_NO:343
      Return currentAffliction ; #DEBUG_LINE_NO:344
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:346
  EndWhile ; #DEBUG_LINE_NO:
  Return None ; #DEBUG_LINE_NO:350
EndFunction

Function CureAllAfflictions()
  Int I = 0 ; #DEBUG_LINE_NO:355
  While I < AfflictionData.Length ; #DEBUG_LINE_NO:356
    AfflictionData[I].Cure() ; #DEBUG_LINE_NO:358
    I += 1 ; #DEBUG_LINE_NO:359
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CureRandomAffliction(Int CureChance)
  Bool success = Game.GetDieRollSuccess(CureChance, 1, 100, -1, -1) ; #DEBUG_LINE_NO:364
  If success ; #DEBUG_LINE_NO:368
    env_afflictionscript[] activeAfflictions = Self.GetActiveAfflictions(False, False, False, False, None) ; #DEBUG_LINE_NO:369
    Int iRandom = Utility.RandomInt(0, activeAfflictions.Length - 1) ; #DEBUG_LINE_NO:371
    env_afflictionscript randomENV_AfflictionScript = activeAfflictions[iRandom] ; #DEBUG_LINE_NO:372
    randomENV_AfflictionScript.Cure() ; #DEBUG_LINE_NO:375
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DebugGainAffliction(String stringID, Bool PerformSkillCheck)
  env_afflictionscript Affliction = Self.GetAfflictionByID(stringID) ; #DEBUG_LINE_NO:382
  Affliction.Gain(PerformSkillCheck, False) ; #DEBUG_LINE_NO:384
EndFunction

Function DebugCureAffliction(String stringID)
  env_afflictionscript Affliction = Self.GetAfflictionByID(stringID) ; #DEBUG_LINE_NO:388
  Affliction.Cure() ; #DEBUG_LINE_NO:390
EndFunction

Function DebugAttemptToCureAFfliction(String stringID)
  env_afflictionscript Affliction = Self.GetAfflictionByID(stringID) ; #DEBUG_LINE_NO:394
  Affliction.AttemptToCure(-1, -1) ; #DEBUG_LINE_NO:396
EndFunction

Function DebugImproveAffliction(String stringID)
  env_afflictionscript Affliction = Self.GetAfflictionByID(stringID) ; #DEBUG_LINE_NO:400
  Affliction.Improve(1) ; #DEBUG_LINE_NO:402
EndFunction

Function DebugSetTimerDuration(Float duration)
  TimerDur_Override = duration ; #DEBUG_LINE_NO:407
  Self.StartAfflictionTimer(Self as ScriptObject) ; #DEBUG_LINE_NO:408
EndFunction

Function DebugSetDieRollCure(Int dieRoll)
  DebugDieRoll_Cure = dieRoll ; #DEBUG_LINE_NO:413
EndFunction

Function DebugSetDieRollWorsen(Int dieRoll)
  DebugDieRoll_Worsen = dieRoll ; #DEBUG_LINE_NO:418
EndFunction

Function DebugSetDieRollImprove(Int dieRoll)
  DebugDieRoll_Improve = dieRoll ; #DEBUG_LINE_NO:423
EndFunction

Function DebugSetDieRollInfection(Int dieRoll)
  DebugDieRoll_Infection = dieRoll ; #DEBUG_LINE_NO:428
EndFunction

Function DebugTestCycle(String stringID, Int NumberOfCycles)
  NumberOfCycles = Math.Max(NumberOfCycles as Float, 1.0) as Int ; #DEBUG_LINE_NO:433
  env_afflictionscript Affliction = Self.GetAfflictionByID(stringID) ; #DEBUG_LINE_NO:437
  Self.DebugSetTimerDuration(0.5) ; #DEBUG_LINE_NO:439
  Int I = 0 ; #DEBUG_LINE_NO:441
  While I < NumberOfCycles + 1 ; #DEBUG_LINE_NO:442
    Int waitBailout = 100 ; #DEBUG_LINE_NO:443
    Int waitCount = 0 ; #DEBUG_LINE_NO:444
    While Affliction.Active && waitCount < waitBailout ; #DEBUG_LINE_NO:445
      waitCount += 1 ; #DEBUG_LINE_NO:446
      Utility.Wait(1.0) ; #DEBUG_LINE_NO:447
    EndWhile ; #DEBUG_LINE_NO:
    If I < NumberOfCycles ; #DEBUG_LINE_NO:450
      Affliction.Gain(False, False) ; #DEBUG_LINE_NO:452
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:454
  EndWhile ; #DEBUG_LINE_NO:
  Self.DebugSetTimerDuration(-1.0) ; #DEBUG_LINE_NO:461
EndFunction

Function DebugTestCycleAll(Int NumberOfCycles)
  NumberOfCycles = Math.Max(NumberOfCycles as Float, 1.0) as Int ; #DEBUG_LINE_NO:465
  Int I = 0 ; #DEBUG_LINE_NO:467
  While I < AfflictionData.Length ; #DEBUG_LINE_NO:468
    I += 1 ; #DEBUG_LINE_NO:470
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:479
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:483
EndFunction
