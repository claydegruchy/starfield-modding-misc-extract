ScriptName ENV_AfflictionScript Extends Activator
{ script attached to activator prefixed "ENV_AFFL_" - holds various data and functions for Afflictions }

;-- Structs -----------------------------------------
Struct Stat
  String Name = "undefined"
  curve ChanceCurve
  Int Attempts_Poor = 0
  Int Attempts_Stable = 0
  Int Attempts_Good = 0
  Int Attempts_Excellent = 0
EndStruct


;-- Variables ---------------------------------------
Int iPrognosis_Excellent = 3 Const
Int iPrognosis_Good = 2 Const
Int iPrognosis_Poor = 0 Const
Int iPrognosis_Stable = 1 Const
env_afflictionscript:stat[] myStats
String strCureAttempts = "CureAttempts"
String strGainInfectionAttempts = "GainInfectionAttempts"
String strImproveAttempts = "ImproveAttempts"
String strWorsenAttempts = "WorsenAttempts"

;-- Properties --------------------------------------
Group Autofill
  sq_env_afflictionsscript Property SQ_ENV Auto Const mandatory
  ActorValue Property ENV_AFFL_BonusCureChance_Infection Auto Const mandatory
  ActorValue Property ENV_AFFL_BonusCureChance_Injury Auto Const mandatory
  ActorValue Property ENV_AFFL_SkillChallengeAV_Infection Auto Const mandatory
  ActorValue Property ENV_AFFL_SkillChallengeAV_Injury Auto Const mandatory
  ActorValue Property ENV_AFFL_SkillChance_PreventInfection Auto Const mandatory
  ActorValue Property ENV_AFFL_SkillChance_PreventInjury Auto Const mandatory
EndGroup

Group Data
  String Property ID Auto Const mandatory
  { a unique string to identify this object }
  Bool Property IsInfection = False Auto Const
  { True = infection, False (default) = Injury }
  wwiseevent Property SoundEvent Auto Const mandatory
  { what WwiseEvent to play when gaining the affliction }
  FormList Property AfflictionSpellList Auto Const mandatory
  { the spells that represent this affliction (ie Rank1, 2, 3 versions) }
  Keyword Property TreatmentEffectKeyword Auto Const mandatory
  { the keyword is on magic effect that represents the treatment for this affliction }
  env_afflictionscript[] Property InfectionArray Auto Const
  { an array of Infection Afflictions that this affliction can add }
  ActorValue Property PrognosisAV Auto Const mandatory
  { the actorvalue that will hold this afflictions prognosis value }
  curve Property Curve_Cure_Chance Auto Const mandatory
  { Curve table expression chance to cure. Input is value of PrognosisAV
    CURE means to remove the affliction completely }
  curve Property Curve_Improve_Chance Auto Const mandatory
  { Curve table expression chance to improve to the next level. Input is value of PrognosisAV
    IMPROVE means to increase the prognosis }
  curve Property Curve_Infection_Chance Auto Const
  { Curve table expression chance to gain an infection. Input is value of PrognosisAV }
  curve Property Curve_Worsen_Chance Auto Const
  { Curve table expression chance to worsen to the next level. Input is value of PrognosisAV
    WORSEN means to increase the tier of the affliction from tier i to tier - ie add additional symptoms }
  Bool Property Active Auto hidden
  { Flag set/unset when gained/cured }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  myStats = new env_afflictionscript:stat[0] ; #DEBUG_LINE_NO:80
  env_afflictionscript:stat Stat_Improve = new env_afflictionscript:stat ; #DEBUG_LINE_NO:82
  Stat_Improve.Name = strImproveAttempts ; #DEBUG_LINE_NO:83
  Stat_Improve.ChanceCurve = Curve_Improve_Chance ; #DEBUG_LINE_NO:84
  myStats.add(Stat_Improve, 1) ; #DEBUG_LINE_NO:85
  env_afflictionscript:stat Stat_Cure = new env_afflictionscript:stat ; #DEBUG_LINE_NO:87
  Stat_Cure.Name = strCureAttempts ; #DEBUG_LINE_NO:88
  Stat_Cure.ChanceCurve = Curve_Cure_Chance ; #DEBUG_LINE_NO:89
  myStats.add(Stat_Cure, 1) ; #DEBUG_LINE_NO:90
  env_afflictionscript:stat Stat_Worsen = new env_afflictionscript:stat ; #DEBUG_LINE_NO:92
  Stat_Worsen.Name = strWorsenAttempts ; #DEBUG_LINE_NO:93
  Stat_Worsen.ChanceCurve = Curve_Worsen_Chance ; #DEBUG_LINE_NO:94
  myStats.add(Stat_Worsen, 1) ; #DEBUG_LINE_NO:95
  env_afflictionscript:stat Stat_GainInfection = new env_afflictionscript:stat ; #DEBUG_LINE_NO:97
  Stat_GainInfection.Name = strGainInfectionAttempts ; #DEBUG_LINE_NO:98
  Stat_GainInfection.ChanceCurve = Curve_Infection_Chance ; #DEBUG_LINE_NO:99
  myStats.add(Stat_GainInfection, 1) ; #DEBUG_LINE_NO:101
EndEvent

Bool Function Improve(Int ImprovementLevels)
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:106
  Int currentValue = playerRef.GetValue(PrognosisAV) as Int ; #DEBUG_LINE_NO:108
  Bool severityImproved = False ; #DEBUG_LINE_NO:110
  Bool cured = False ; #DEBUG_LINE_NO:111
  If currentValue >= iPrognosis_Excellent ; #DEBUG_LINE_NO:115
    Int iCurrentSpell = Self.GetSpellListIndexForCurrentSpell() ; #DEBUG_LINE_NO:116
    If iCurrentSpell == 0 ; #DEBUG_LINE_NO:119
      Self.Cure() ; #DEBUG_LINE_NO:120
      cured = True ; #DEBUG_LINE_NO:121
    Else ; #DEBUG_LINE_NO:
      Spell currentSpell = AfflictionSpellList.GetAt(iCurrentSpell) as Spell ; #DEBUG_LINE_NO:123
      Spell nextSpell = AfflictionSpellList.GetAt(iCurrentSpell - 1) as Spell ; #DEBUG_LINE_NO:124
      Game.GetPlayer().RemoveSpell(currentSpell) ; #DEBUG_LINE_NO:126
      Game.GetPlayer().AddSpell(nextSpell, False) ; #DEBUG_LINE_NO:127
      SQ_ENV.StartAfflictionTimer(Self as ScriptObject) ; #DEBUG_LINE_NO:128
      severityImproved = True ; #DEBUG_LINE_NO:129
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Int newValue = currentValue + ImprovementLevels ; #DEBUG_LINE_NO:133
  newValue = Math.Min(newValue as Float, iPrognosis_Excellent as Float) as Int ; #DEBUG_LINE_NO:136
  Game.GetPlayer().SetValue(PrognosisAV, newValue as Float) ; #DEBUG_LINE_NO:140
  If severityImproved ; #DEBUG_LINE_NO:142
    SQ_ENV.ShowSeverityImprovedMessage(Self) ; #DEBUG_LINE_NO:143
  ElseIf cured == False ; #DEBUG_LINE_NO:144
    SQ_ENV.ShowImprovedMessage(Self) ; #DEBUG_LINE_NO:145
  EndIf ; #DEBUG_LINE_NO:
  Return True ; #DEBUG_LINE_NO:148
EndFunction

Function ResetPrognosis()
  Game.GetPlayer().SetValue(PrognosisAV, 0.0) ; #DEBUG_LINE_NO:153
EndFunction

Bool Function CheckSkillPrevention(ActorValue SkillAV)
  Int chanceToPrevent = Game.GetPlayer().GetValue(SkillAV) as Int ; #DEBUG_LINE_NO:158
  Bool preventionSuccess = Game.GetDieRollSuccess(chanceToPrevent, 1, 100, -1, -1) ; #DEBUG_LINE_NO:159
  Return preventionSuccess ; #DEBUG_LINE_NO:163
EndFunction

Bool Function Gain(Bool PerformSkillCheck, Bool OnlyWorsen)
  Bool skillCheckPrevented = False ; #DEBUG_LINE_NO:171
  If PerformSkillCheck ; #DEBUG_LINE_NO:172
    If IsInfection && Self.CheckSkillPrevention(ENV_AFFL_SkillChance_PreventInfection) ; #DEBUG_LINE_NO:173
      skillCheckPrevented = True ; #DEBUG_LINE_NO:175
    ElseIf IsInfection == False && Self.CheckSkillPrevention(ENV_AFFL_SkillChance_PreventInjury) ; #DEBUG_LINE_NO:176
      skillCheckPrevented = True ; #DEBUG_LINE_NO:178
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If skillCheckPrevented ; #DEBUG_LINE_NO:182
    Return False ; #DEBUG_LINE_NO:184
  EndIf ; #DEBUG_LINE_NO:
  Bool gained = False ; #DEBUG_LINE_NO:187
  Bool worsened = False ; #DEBUG_LINE_NO:188
  Int iCurrentSpell = Self.GetSpellListIndexForCurrentSpell() ; #DEBUG_LINE_NO:190
  Int currentSpellListMaxIndex = AfflictionSpellList.GetSize() - 1 ; #DEBUG_LINE_NO:192
  If iCurrentSpell == currentSpellListMaxIndex ; #DEBUG_LINE_NO:194
     ; #DEBUG_LINE_NO:
  ElseIf iCurrentSpell == -1 ; #DEBUG_LINE_NO:197
    If OnlyWorsen == False ; #DEBUG_LINE_NO:198
      Int nextSpellInt = 0 ; #DEBUG_LINE_NO:201
      Spell nextSpell = AfflictionSpellList.GetAt(nextSpellInt) as Spell ; #DEBUG_LINE_NO:203
      Game.GetPlayer().AddSpell(nextSpell, False) ; #DEBUG_LINE_NO:205
      SQ_ENV.ShowGainedMessage(Self) ; #DEBUG_LINE_NO:206
      SQ_ENV.StartAfflictionTimer(Self as ScriptObject) ; #DEBUG_LINE_NO:207
      gained = True ; #DEBUG_LINE_NO:208
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Spell currentSpell = AfflictionSpellList.GetAt(iCurrentSpell) as Spell ; #DEBUG_LINE_NO:214
    Spell nextspell = AfflictionSpellList.GetAt(iCurrentSpell + 1) as Spell ; #DEBUG_LINE_NO:215
    Game.GetPlayer().RemoveSpell(currentSpell) ; #DEBUG_LINE_NO:217
    Game.GetPlayer().AddSpell(nextspell, False) ; #DEBUG_LINE_NO:218
    SQ_ENV.ShowWorsenedMessage(Self) ; #DEBUG_LINE_NO:219
    SQ_ENV.StartAfflictionTimer(Self as ScriptObject) ; #DEBUG_LINE_NO:220
    worsened = True ; #DEBUG_LINE_NO:221
  EndIf ; #DEBUG_LINE_NO:
  If gained ; #DEBUG_LINE_NO:224
    Active = True ; #DEBUG_LINE_NO:225
  EndIf ; #DEBUG_LINE_NO:
  If gained || worsened ; #DEBUG_LINE_NO:228
    SoundEvent.PlayUI(None, None) ; #DEBUG_LINE_NO:229
    Self.ResetPrognosis() ; #DEBUG_LINE_NO:230
    SQ_ENV.SQ_ENV.SQ_ENV_Tutorial.StartAfflictionTutorial() ; #DEBUG_LINE_NO:231
  EndIf ; #DEBUG_LINE_NO:
  Return gained || worsened ; #DEBUG_LINE_NO:234
EndFunction

Int Function GetSpellListIndexForCurrentSpell()
  Int I = AfflictionSpellList.GetSize() - 1 ; #DEBUG_LINE_NO:238
  Int iLastFound = 0 ; #DEBUG_LINE_NO:239
  While I > -1 ; #DEBUG_LINE_NO:240
    Spell currentSpell = AfflictionSpellList.GetAt(I) as Spell ; #DEBUG_LINE_NO:241
    If Game.GetPlayer().HasSpell(currentSpell as Form) ; #DEBUG_LINE_NO:243
      Return I ; #DEBUG_LINE_NO:245
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:248
  EndWhile ; #DEBUG_LINE_NO:
  Return -1 ; #DEBUG_LINE_NO:252
EndFunction

Bool Function AttemptToWorsen(Int ForcedDieRoll, Int DebugDieRoll)
  Int Chance_Worsen = Self.GetChance_Worsen() ; #DEBUG_LINE_NO:263
  If Chance_Worsen > 0 ; #DEBUG_LINE_NO:267
    Bool WorsenSuccess = Game.GetDieRollSuccess(Chance_Worsen, 1, 100, DebugDieRoll, ForcedDieRoll) ; #DEBUG_LINE_NO:269
    Self.IncrementStat(strWorsenAttempts) ; #DEBUG_LINE_NO:271
    If WorsenSuccess ; #DEBUG_LINE_NO:276
      Return Self.Gain(False, True) ; #DEBUG_LINE_NO:277
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:282
EndFunction

Function IncrementStat(String Name)
  Int iFound = myStats.findstruct("Name", Name, 0) ; #DEBUG_LINE_NO:286
  If iFound > -1 ; #DEBUG_LINE_NO:288
    env_afflictionscript:stat statToIncrement = myStats[iFound] ; #DEBUG_LINE_NO:290
    Float PrognosisLevel = Game.GetPlayer().GetValue(PrognosisAV) ; #DEBUG_LINE_NO:292
    If PrognosisLevel == iPrognosis_Poor as Float ; #DEBUG_LINE_NO:294
      statToIncrement.Attempts_Poor = statToIncrement.Attempts_Poor + 1 ; #DEBUG_LINE_NO:295
    ElseIf PrognosisLevel == iPrognosis_Stable as Float ; #DEBUG_LINE_NO:296
      statToIncrement.Attempts_Stable = statToIncrement.Attempts_Stable + 1 ; #DEBUG_LINE_NO:297
    ElseIf PrognosisLevel == iPrognosis_Good as Float ; #DEBUG_LINE_NO:298
      statToIncrement.Attempts_Good = statToIncrement.Attempts_Good + 1 ; #DEBUG_LINE_NO:299
    ElseIf PrognosisLevel == iPrognosis_Excellent as Float ; #DEBUG_LINE_NO:300
      statToIncrement.Attempts_Excellent = statToIncrement.Attempts_Excellent + 1 ; #DEBUG_LINE_NO:301
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ResetStats()
  Int I = 0 ; #DEBUG_LINE_NO:308
  While I < myStats.Length ; #DEBUG_LINE_NO:309
    myStats[I].Attempts_Poor = 0 ; #DEBUG_LINE_NO:310
    myStats[I].Attempts_Stable = 0 ; #DEBUG_LINE_NO:311
    myStats[I].Attempts_Good = 0 ; #DEBUG_LINE_NO:312
    myStats[I].Attempts_Excellent = 0 ; #DEBUG_LINE_NO:313
    I += 1 ; #DEBUG_LINE_NO:314
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function AttemptToImprove(Int ForcedDieRoll, Int DebugDieRoll)
  Int Chance_Improve = Self.GetChance_Improve() ; #DEBUG_LINE_NO:321
  If Chance_Improve > 0 ; #DEBUG_LINE_NO:325
    Bool ImproveSuccess = Game.GetDieRollSuccess(Chance_Improve, 1, 100, DebugDieRoll, ForcedDieRoll) ; #DEBUG_LINE_NO:326
    Self.IncrementStat(strImproveAttempts) ; #DEBUG_LINE_NO:328
    If ImproveSuccess ; #DEBUG_LINE_NO:331
      Return Self.Improve(1) ; #DEBUG_LINE_NO:332
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:337
EndFunction

Bool Function AttemptToGainInfection(Int ForcedDieRoll, Int DebugDieRoll)
  Int GainChance_Infection = Self.GetChance_Infection() ; #DEBUG_LINE_NO:345
  If GainChance_Infection > 0 ; #DEBUG_LINE_NO:349
    Bool GainInfectionSuccess = Game.GetDieRollSuccess(GainChance_Infection, 1, 100, DebugDieRoll, ForcedDieRoll) ; #DEBUG_LINE_NO:351
    Self.IncrementStat(strGainInfectionAttempts) ; #DEBUG_LINE_NO:353
    If GainInfectionSuccess ; #DEBUG_LINE_NO:357
      ENV_AfflictionScript randomInfection = None ; #DEBUG_LINE_NO:358
      Int[] randomizedIndexes = commonarrayfunctions.GetRandomizedIndexes(InfectionArray.Length) ; #DEBUG_LINE_NO:360
      Int I = 0 ; #DEBUG_LINE_NO:361
      While I < randomizedIndexes.Length && randomInfection == None ; #DEBUG_LINE_NO:362
        ENV_AfflictionScript currentInfection = InfectionArray[randomizedIndexes[I]] ; #DEBUG_LINE_NO:363
        If currentInfection.PlayerHasAffliction() == False ; #DEBUG_LINE_NO:365
          randomInfection = currentInfection ; #DEBUG_LINE_NO:366
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:369
      EndWhile ; #DEBUG_LINE_NO:
      Return randomInfection.Gain(True, False) ; #DEBUG_LINE_NO:374
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:379
EndFunction

Bool Function PlayerHasAffliction()
  Bool returnVal = False ; #DEBUG_LINE_NO:383
  Int I = 0 ; #DEBUG_LINE_NO:385
  Int iMax = AfflictionSpellList.GetSize() ; #DEBUG_LINE_NO:386
  While I < iMax && returnVal == False ; #DEBUG_LINE_NO:387
    Spell currentSpell = AfflictionSpellList.GetAt(I) as Spell ; #DEBUG_LINE_NO:388
    If Game.GetPlayer().HasSpell(currentSpell as Form) ; #DEBUG_LINE_NO:390
      returnVal = True ; #DEBUG_LINE_NO:391
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:394
  EndWhile ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:399
EndFunction

Bool Function AttemptToCure(Int ForcedDieRoll, Int DebugDieRoll)
  Int cureChance = Self.GetChance_Cure() ; #DEBUG_LINE_NO:406
  Bool cureSuccess = Game.GetDieRollSuccess(cureChance, 1, 100, DebugDieRoll, ForcedDieRoll) ; #DEBUG_LINE_NO:410
  Self.IncrementStat(strCureAttempts) ; #DEBUG_LINE_NO:412
  If cureSuccess ; #DEBUG_LINE_NO:417
    Return Self.Cure() ; #DEBUG_LINE_NO:418
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:421
EndFunction

Bool Function Cure()
  FormList AfflictionList = AfflictionSpellList ; #DEBUG_LINE_NO:427
  Bool hadAffliction = False ; #DEBUG_LINE_NO:429
  Int I = 0 ; #DEBUG_LINE_NO:431
  Int iMax = AfflictionList.GetSize() ; #DEBUG_LINE_NO:432
  While I < iMax ; #DEBUG_LINE_NO:433
    Spell currentSpell = AfflictionList.GetAt(I) as Spell ; #DEBUG_LINE_NO:434
    hadAffliction = hadAffliction || Game.GetPlayer().HasSpell(currentSpell as Form) ; #DEBUG_LINE_NO:436
    Game.GetPlayer().RemoveSpell(currentSpell) ; #DEBUG_LINE_NO:438
    I += 1 ; #DEBUG_LINE_NO:439
  EndWhile ; #DEBUG_LINE_NO:
  If hadAffliction ; #DEBUG_LINE_NO:442
    SQ_ENV.ShowCuredMessage(Self) ; #DEBUG_LINE_NO:443
    Active = False ; #DEBUG_LINE_NO:444
    Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:447
    If IsInfection ; #DEBUG_LINE_NO:448
      playerRef.SetValue(ENV_AFFL_SkillChallengeAV_Infection, playerRef.GetValue(ENV_AFFL_SkillChallengeAV_Infection) + 1.0) ; #DEBUG_LINE_NO:449
    Else ; #DEBUG_LINE_NO:
      playerRef.SetValue(ENV_AFFL_SkillChallengeAV_Injury, playerRef.GetValue(ENV_AFFL_SkillChallengeAV_Injury) + 1.0) ; #DEBUG_LINE_NO:451
    EndIf ; #DEBUG_LINE_NO:
    Self.ResetStats() ; #DEBUG_LINE_NO:455
    Return True ; #DEBUG_LINE_NO:458
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:463
EndFunction

Int Function GetCurveChance(curve curveTable)
  Int iPrognosis = Game.GetPlayer().GetValue(PrognosisAV) as Int ; #DEBUG_LINE_NO:468
  Int returnVal = 0 ; #DEBUG_LINE_NO:470
  If curveTable ; #DEBUG_LINE_NO:472
    returnVal = curveTable.GetValueAt(iPrognosis as Float) as Int ; #DEBUG_LINE_NO:473
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:477
EndFunction

Int Function GetChance_Cure()
  Int returnVal = Self.GetCurveChance(Curve_Cure_Chance) ; #DEBUG_LINE_NO:483
  If returnVal > 0 ; #DEBUG_LINE_NO:485
    If IsInfection ; #DEBUG_LINE_NO:486
      returnVal += Game.GetPlayer().GetValue(ENV_AFFL_BonusCureChance_Infection) as Int ; #DEBUG_LINE_NO:487
    Else ; #DEBUG_LINE_NO:
      returnVal += Game.GetPlayer().GetValue(ENV_AFFL_BonusCureChance_Injury) as Int ; #DEBUG_LINE_NO:489
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:496
EndFunction

Int Function GetChance_Improve()
  Return Self.GetCurveChance(Curve_Improve_Chance) ; #DEBUG_LINE_NO:501
EndFunction

Int Function GetChance_Worsen()
  Return Self.GetCurveChance(Curve_Worsen_Chance) ; #DEBUG_LINE_NO:506
EndFunction

Int Function GetChance_Infection()
  Return Self.GetCurveChance(Curve_Infection_Chance) ; #DEBUG_LINE_NO:511
EndFunction

String Function MakeStatString(env_afflictionscript:stat StatToGet)
  String returnVal = ((((", " + ID + ", " + StatToGet.Name + ", " + StatToGet.ChanceCurve as String) + ", " + StatToGet.Attempts_Poor as String) + ", " + StatToGet.Attempts_Stable as String) + ", " + StatToGet.Attempts_Good as String) + ", " + StatToGet.Attempts_Excellent as String ; #DEBUG_LINE_NO:515,516,517,518,519,520,521
  Return returnVal ; #DEBUG_LINE_NO:522
EndFunction

; Fixup hacks for debug-only function: TraceStats
Function TraceStats()
  String logname = "EnvironmentalGameplay_Afflictions_STATS" ; #DEBUG_LINE_NO:527
  Bool opened = false ; #DEBUG_LINE_NO:529
  If opened ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:536
  While I < myStats.Length ; #DEBUG_LINE_NO:537
    env_afflictionscript:stat currentStat = myStats[I] ; #DEBUG_LINE_NO:538
    String statString = Self.MakeStatString(currentStat) ; #DEBUG_LINE_NO:540
    I += 1 ; #DEBUG_LINE_NO:544
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:553
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:557
EndFunction
