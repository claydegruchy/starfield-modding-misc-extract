ScriptName ENV_PeriodicEffectScript Extends ActiveMagicEffect

;-- Structs -----------------------------------------
Struct PeriodicEffectDatum
  Bool FireOnStart
  { These effects should fire when the magic effect starts }
  Int FireOnTimerID = -1
  { These effects should fire when the OnTimer event for this ID occurs }
  Bool StopFiringIfSuccessful = True
  { If true (default), if this Periodic Effect fires, ignore any further Periodic Effect that would also fire on this same FireOnTimerID / FireOnStart }
  GlobalVariable ChanceGlobal
  { if there is a ChanceGlobal, that becomes a chance on a d100 to fire the effect (everything below) }
  ActorValue ChanceAV
  { added to the ChanceGlobal }
  Bool MagnitudeScalesChance
  { If true: If there is a ChanceGlobal, it's value is multiplied by the magnitude; if there is no ChanceGlobal the magnitude IS the chance. }
  conditionform Conditions
  { if true, before firing, make sure this condition form is true for the subject }
  Spell SpellToCast
  { Cast this spell when this effect is fired }
  FormList IncrementalSpellListToCast
  { Cast a spell from this list when effect is fired. Start with spells in lower index. If already present, dispell it and cast the next higher one that isn't already running on player. }
  Bool AddSpellInsteadOfCast = False
  { If true will add spell instead of casting it (for abilities, etc.) }
  env_afflictionscript AfflictionToGain
  { Gain this affliction when this effect is fired }
  FormList RandomAfflictionsToGainList
  { Gain the afflictions in this formlist when this effect is fired. Put the same affliction in the array if you want to weight it to be more likely that others }
  Message MessageToDisplay
  { Display this message when this effect is fired }
  Bool ShowAsHelpMessage
  { Display the message as a tutorial message }
  Float HelpMessageDuration
  { How long to disply help message }
  Keyword DialogueSubTopicToSay
  { Dialogue for player to "say" when this effect is fired (ie choking, gasping, etc.)
A quest must be running with this dialogue... usually a unique game started quest) }
  Int DetectionEventSoundLevel = -1
  { if > -1, will send a detection event with this sound level }
EndStruct

Struct TimerDatum
  Int ID
  GlobalVariable IntervalGlobal
  { A global holding the interval in seconds, for this timer. Values of 0 or less are ignored. }
  GlobalVariable MaxIntervalGlobal
  { Optional: If set, IntervalGlobal becomes a min and this global becomes the max of a randomized interval in seconds, for this timer. Values of 0 or less are ignored. }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TimerDataSetting
  env_periodiceffectscript:timerdatum[] Property TimerData Auto Const
  { If you aren't just firing things on start, then you need to create at least one TimerDatum in this list. }
EndGroup

Group PeriodicEffectDataSetting
  env_periodiceffectscript:periodiceffectdatum[] Property PeriodicEffectData Auto Const mandatory
  Message Property MessageToDisplayOnFinish Auto Const
  { Display this message when this effect finishes }
EndGroup


;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.ProcessPeriodicEventData(Self.GetAllPeriodicEffectsFiringOnStart()) ; #DEBUG_LINE_NO:86
  Self.StartTimers(TimerData) ; #DEBUG_LINE_NO:89
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If MessageToDisplayOnFinish != None ; #DEBUG_LINE_NO:95
    MessageToDisplayOnFinish.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:96
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  env_periodiceffectscript:periodiceffectdatum[] foundPeriodicEffectData = Self.GetAllPeriodicEffectsFiringOnTimerID(aiTimerID) ; #DEBUG_LINE_NO:103
  Self.ProcessPeriodicEventData(foundPeriodicEffectData) ; #DEBUG_LINE_NO:106
  Self.StartTimerInDatum(TimerData[TimerData.findstruct("ID", aiTimerID, 0)]) ; #DEBUG_LINE_NO:109
EndEvent

Function StartTimers(env_periodiceffectscript:timerdatum[] Timers)
  Int I = 0 ; #DEBUG_LINE_NO:114
  While I < Timers.Length ; #DEBUG_LINE_NO:115
    Self.StartTimerInDatum(Timers[I]) ; #DEBUG_LINE_NO:116
    I += 1 ; #DEBUG_LINE_NO:117
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function StartTimerInDatum(env_periodiceffectscript:timerdatum TimerDatumToStart)
  GlobalVariable IntervalGlobal = TimerDatumToStart.IntervalGlobal ; #DEBUG_LINE_NO:123
  GlobalVariable MaxIntervalGlobal = TimerDatumToStart.MaxIntervalGlobal ; #DEBUG_LINE_NO:124
  If IntervalGlobal ; #DEBUG_LINE_NO:126
    Float interval = IntervalGlobal.GetValue() ; #DEBUG_LINE_NO:127
    If MaxIntervalGlobal ; #DEBUG_LINE_NO:129
      interval = Utility.RandomFloat(interval, MaxIntervalGlobal.GetValue()) ; #DEBUG_LINE_NO:130
    EndIf ; #DEBUG_LINE_NO:
    If interval > 0.0 ; #DEBUG_LINE_NO:133
      Self.StartTimer(interval, TimerDatumToStart.ID) ; #DEBUG_LINE_NO:134
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ProcessPeriodicEventData(env_periodiceffectscript:periodiceffectdatum[] PeriodicEffectDataToProcess)
  If Self.IsBoundGameObjectAvailable() == False ; #DEBUG_LINE_NO:142
    Return  ; #DEBUG_LINE_NO:143
  EndIf ; #DEBUG_LINE_NO:
  Actor TargetActor = Self.GetTargetActor() ; #DEBUG_LINE_NO:148
  Actor CasterActor = Self.GetCasterActor() ; #DEBUG_LINE_NO:149
  If CasterActor == None ; #DEBUG_LINE_NO:151
    CasterActor = TargetActor ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
  Bool ShouldStopFiring = False ; #DEBUG_LINE_NO:156
  Int I = 0 ; #DEBUG_LINE_NO:157
  While I < PeriodicEffectDataToProcess.Length && ShouldStopFiring == False && CasterActor as Bool ; #DEBUG_LINE_NO:158
    env_periodiceffectscript:periodiceffectdatum currentPeriodicEffectDatum = PeriodicEffectDataToProcess[I] ; #DEBUG_LINE_NO:159
    Bool chanceSuccess = True ; #DEBUG_LINE_NO:163
    Bool conditionsSuccess = True ; #DEBUG_LINE_NO:164
    If (currentPeriodicEffectDatum.ChanceGlobal != None || currentPeriodicEffectDatum.ChanceAV as Bool) || currentPeriodicEffectDatum.MagnitudeScalesChance ; #DEBUG_LINE_NO:166
      Float chance = 1.0 ; #DEBUG_LINE_NO:168
      If currentPeriodicEffectDatum.ChanceGlobal ; #DEBUG_LINE_NO:170
        chance = currentPeriodicEffectDatum.ChanceGlobal.GetValueInt() as Float ; #DEBUG_LINE_NO:171
        If currentPeriodicEffectDatum.ChanceAV ; #DEBUG_LINE_NO:173
          chance += TargetActor.GetValue(currentPeriodicEffectDatum.ChanceAV) ; #DEBUG_LINE_NO:174
        EndIf ; #DEBUG_LINE_NO:
      ElseIf currentPeriodicEffectDatum.ChanceAV ; #DEBUG_LINE_NO:177
        chance = TargetActor.GetValue(currentPeriodicEffectDatum.ChanceAV) ; #DEBUG_LINE_NO:178
      EndIf ; #DEBUG_LINE_NO:
      If currentPeriodicEffectDatum.MagnitudeScalesChance ; #DEBUG_LINE_NO:181
        Float magnitude = Self.GetMagnitude() ; #DEBUG_LINE_NO:182
        chance *= magnitude ; #DEBUG_LINE_NO:185
      EndIf ; #DEBUG_LINE_NO:
      chanceSuccess = Game.GetDieRollSuccess(chance as Int, 1, 100, -1, -1) ; #DEBUG_LINE_NO:190
    EndIf ; #DEBUG_LINE_NO:
    If currentPeriodicEffectDatum.Conditions != None ; #DEBUG_LINE_NO:194
      conditionsSuccess = currentPeriodicEffectDatum.Conditions.IsTrue(TargetActor as ObjectReference, None) ; #DEBUG_LINE_NO:196
    EndIf ; #DEBUG_LINE_NO:
    If chanceSuccess == True && conditionsSuccess == True ; #DEBUG_LINE_NO:200
      If currentPeriodicEffectDatum.SpellToCast ; #DEBUG_LINE_NO:201
        currentPeriodicEffectDatum.SpellToCast.Cast(CasterActor as ObjectReference, TargetActor as ObjectReference) ; #DEBUG_LINE_NO:203
      EndIf ; #DEBUG_LINE_NO:
      If currentPeriodicEffectDatum.IncrementalSpellListToCast ; #DEBUG_LINE_NO:206
        FormList currentSpellList = currentPeriodicEffectDatum.IncrementalSpellListToCast ; #DEBUG_LINE_NO:210
        Int iSpell = 0 ; #DEBUG_LINE_NO:212
        Int iLastSpell = currentSpellList.GetSize() - 1 ; #DEBUG_LINE_NO:213
        If iLastSpell < 0 ; #DEBUG_LINE_NO:215
           ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        Spell foundSpell = None ; #DEBUG_LINE_NO:219
        While iSpell <= iLastSpell ; #DEBUG_LINE_NO:220
          Spell currentSpell = currentSpellList.GetAt(iSpell) as Spell ; #DEBUG_LINE_NO:221
          If TargetActor.IsSpellTarget(currentSpell as Form) ; #DEBUG_LINE_NO:223
            foundSpell = currentSpell ; #DEBUG_LINE_NO:224
            If iSpell < iLastSpell ; #DEBUG_LINE_NO:228
              Spell nextSpell = currentSpellList.GetAt(iSpell + 1) as Spell ; #DEBUG_LINE_NO:230
              Self.DispelOrRemoveSpell(foundSpell, TargetActor, currentPeriodicEffectDatum.AddSpellInsteadOfCast) ; #DEBUG_LINE_NO:233
              Self.CastOrAddSpell(nextSpell, CasterActor, TargetActor, currentPeriodicEffectDatum.AddSpellInsteadOfCast) ; #DEBUG_LINE_NO:234
            EndIf ; #DEBUG_LINE_NO:
            iSpell = iLastSpell ; #DEBUG_LINE_NO:238
          EndIf ; #DEBUG_LINE_NO:
          iSpell += 1 ; #DEBUG_LINE_NO:241
        EndWhile ; #DEBUG_LINE_NO:
        If foundSpell == None ; #DEBUG_LINE_NO:244
          Spell nextspell = currentSpellList.GetAt(0) as Spell ; #DEBUG_LINE_NO:246
          Self.CastOrAddSpell(nextspell, CasterActor, TargetActor, currentPeriodicEffectDatum.AddSpellInsteadOfCast) ; #DEBUG_LINE_NO:249
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If currentPeriodicEffectDatum.AfflictionToGain ; #DEBUG_LINE_NO:254
        Self.GainAffliction(TargetActor, currentPeriodicEffectDatum.AfflictionToGain) ; #DEBUG_LINE_NO:255
      EndIf ; #DEBUG_LINE_NO:
      If currentPeriodicEffectDatum.RandomAfflictionsToGainList ; #DEBUG_LINE_NO:258
        Int iRandom = Utility.RandomInt(0, currentPeriodicEffectDatum.RandomAfflictionsToGainList.GetSize() - 1) ; #DEBUG_LINE_NO:259
        env_afflictionscript randomAffliction = currentPeriodicEffectDatum.RandomAfflictionsToGainList.GetAt(iRandom) as env_afflictionscript ; #DEBUG_LINE_NO:260
        Self.GainAffliction(TargetActor, randomAffliction) ; #DEBUG_LINE_NO:263
      EndIf ; #DEBUG_LINE_NO:
      If currentPeriodicEffectDatum.MessageToDisplay ; #DEBUG_LINE_NO:266
        If currentPeriodicEffectDatum.ShowAsHelpMessage ; #DEBUG_LINE_NO:269
          currentPeriodicEffectDatum.MessageToDisplay.ShowAsHelpMessage("PeriodicEffectHelpMsg", currentPeriodicEffectDatum.HelpMessageDuration, 1.0, 1, "", 0, None) ; #DEBUG_LINE_NO:271
        Else ; #DEBUG_LINE_NO:
          currentPeriodicEffectDatum.MessageToDisplay.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:274
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If currentPeriodicEffectDatum.DialogueSubTopicToSay ; #DEBUG_LINE_NO:278
        TargetActor.SayCustom(currentPeriodicEffectDatum.DialogueSubTopicToSay, None, False, None) ; #DEBUG_LINE_NO:280
      EndIf ; #DEBUG_LINE_NO:
      If currentPeriodicEffectDatum.DetectionEventSoundLevel > -1 ; #DEBUG_LINE_NO:283
        TargetActor.CreateDetectionEvent(TargetActor, currentPeriodicEffectDatum.DetectionEventSoundLevel) ; #DEBUG_LINE_NO:285
      EndIf ; #DEBUG_LINE_NO:
      If currentPeriodicEffectDatum.StopFiringIfSuccessful ; #DEBUG_LINE_NO:288
        ShouldStopFiring = True ; #DEBUG_LINE_NO:289
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:294
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function GainAffliction(Actor TargetActor, env_afflictionscript AfflictionToGain)
  If TargetActor == Game.GetPlayer() ; #DEBUG_LINE_NO:301
    AfflictionToGain.Gain(True, False) ; #DEBUG_LINE_NO:303
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CastOrAddSpell(Spell SpellToCastOrAdd, Actor CasterActor, Actor TargetActor, Bool AddSpell)
  If AddSpell ; #DEBUG_LINE_NO:310
    TargetActor.AddSpell(SpellToCastOrAdd, True) ; #DEBUG_LINE_NO:311
  Else ; #DEBUG_LINE_NO:
    SpellToCastOrAdd.Cast(CasterActor as ObjectReference, TargetActor as ObjectReference) ; #DEBUG_LINE_NO:313
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DispelOrRemoveSpell(Spell SpellToDispelOrRemove, Actor TargetActor, Bool RemoveSpell)
  If RemoveSpell ; #DEBUG_LINE_NO:318
    TargetActor.RemoveSpell(SpellToDispelOrRemove) ; #DEBUG_LINE_NO:319
  Else ; #DEBUG_LINE_NO:
    TargetActor.DispelSpell(SpellToDispelOrRemove) ; #DEBUG_LINE_NO:321
  EndIf ; #DEBUG_LINE_NO:
EndFunction

env_periodiceffectscript:periodiceffectdatum[] Function GetAllPeriodicEffectsFiringOnStart()
  env_periodiceffectscript:periodiceffectdatum[] foundPeriodicEffectDatum = new env_periodiceffectscript:periodiceffectdatum[0] ; #DEBUG_LINE_NO:329
  Int iFound = PeriodicEffectData.findstruct("FireOnStart", True, 0) ; #DEBUG_LINE_NO:331
  While iFound >= 0 ; #DEBUG_LINE_NO:333
    foundPeriodicEffectDatum.add(PeriodicEffectData[iFound], 1) ; #DEBUG_LINE_NO:334
    If iFound < PeriodicEffectData.Length - 1 ; #DEBUG_LINE_NO:335
      iFound = PeriodicEffectData.findstruct("FireOnStart", True, iFound + 1) ; #DEBUG_LINE_NO:336
    Else ; #DEBUG_LINE_NO:
      iFound = -1 ; #DEBUG_LINE_NO:338
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
  Return foundPeriodicEffectDatum ; #DEBUG_LINE_NO:342
EndFunction

env_periodiceffectscript:periodiceffectdatum[] Function GetAllPeriodicEffectsFiringOnTimerID(Int ID)
  env_periodiceffectscript:periodiceffectdatum[] foundPeriodicEffectData = new env_periodiceffectscript:periodiceffectdatum[0] ; #DEBUG_LINE_NO:350
  Int iFound = PeriodicEffectData.findstruct("FireOnTimerID", ID, 0) ; #DEBUG_LINE_NO:352
  While iFound >= 0 ; #DEBUG_LINE_NO:354
    foundPeriodicEffectData.add(PeriodicEffectData[iFound], 1) ; #DEBUG_LINE_NO:355
    If iFound < PeriodicEffectData.Length - 1 ; #DEBUG_LINE_NO:356
      iFound = PeriodicEffectData.findstruct("FireOnTimerID", ID, iFound + 1) ; #DEBUG_LINE_NO:357
    Else ; #DEBUG_LINE_NO:
      iFound = -1 ; #DEBUG_LINE_NO:359
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
  Return foundPeriodicEffectData ; #DEBUG_LINE_NO:363
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:374
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:378
EndFunction
