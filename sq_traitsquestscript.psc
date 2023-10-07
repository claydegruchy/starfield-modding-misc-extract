ScriptName SQ_TraitsQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct TaskmasterSystemDatum
  String SystemName
  { for readability and console command use, not used by script logic }
  ActorValue SystemAV
  { the AV the code uses for the health of this system }
  ActorValue SystemHealthAV
  { the ship part id associated with this system - for repairs }
  Perk AssociatedCrewSkill
  { the skill that crew need to repair this system with Taskmaster. For multiple skills, use AssociatedCrewSkillsList }
  FormList AssociatedCrewSkillsList
  { IGNORED if AssociatedCrewSkill is set, the skills that crew need to repair this system with Taskmaster }
  Message RepairedMessage
  { message to display when repairing }
  Bool allowToRollForRestore = True
EndStruct


;-- Variables ---------------------------------------
Int TimerID_KidStuff = 1 Const
Bool initialized

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard TaskMasterRestoreGuard

;-- Properties --------------------------------------
Group Taskmaster
  Perk Property TRAIT_Taskmaster Auto Const mandatory
  { autofill }
  ReferenceAlias Property PlayerShip Auto Const mandatory
  { autofill; linked alias to PlayerShip alias on SQ_PlayerShip }
  Float Property ShipPartHealthPercentTriggerThreshold = 0.5 Auto Const
  { in 0-1 range, the system health percent that triggers the Taskmaster die roll }
  Int Property TaskmasterChance = 25 Auto Const
  { chance on a d100, chance to restore system health when rolling to do so }
  sq_traitsquestscript:taskmastersystemdatum[] Property TaskmasterSystemData Auto mandatory
  { data to connect ship part IDs to various data }
EndGroup

Group Empathy
  Perk Property TRAIT_Empath Auto Const mandatory
  { autofill }
  ActorValue Property COM_Affinity Auto Const mandatory
  { autofill }
  Spell Property Trait_EmpathBuff Auto Const mandatory
  { autofill }
  Spell Property Trait_EmpathDebuff Auto Const mandatory
  { autofill }
  Message Property Trait_EmpathyBuff_Msg Auto Const mandatory
  { autofill }
  Message Property Trait_EmpathyDebuff_Msg Auto Const mandatory
  { autofill }
EndGroup

Group KidStuff
  Quest Property MQ101 Auto Const mandatory
  { autofill }
  Int Property CharGenCompleteStage = 105 Auto Const
  { stage in MQ101 that means player finished creating their character and has traits }
  Perk Property Trait_KidStuff Auto Const mandatory
  { autofill }
  Message Property Trait_KidStuff_Msg_SentCredits Auto Const mandatory
  { autofill }
  GlobalVariable Property Trait_KidStuff_WeeklyParentalGiftPercentage Auto Const mandatory
  { 0-1, percentage of player credits to remove each week }
  GlobalVariable Property Trait_KidStuff_WeeklyParentalGiftMax Auto Const mandatory
  { Autofill. The total amount of Credits that can be sent each week. }
  wwiseevent Property ITM_Credits_Down_WEF Auto Const mandatory
  { Autofill. Credits removal SFX. For use with Kid Stuff Parental Gift. }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  initialized = True ; #DEBUG_LINE_NO:89
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipSystemDamaged") ; #DEBUG_LINE_NO:90
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipSystemRepaired") ; #DEBUG_LINE_NO:91
  Self.RegisterForRemoteEvent(MQ101 as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:92
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If akSender == MQ101 && auiStageID == CharGenCompleteStage ; #DEBUG_LINE_NO:96
    If Game.GetPlayer().HasPerk(Trait_KidStuff) ; #DEBUG_LINE_NO:97
      Self.StartKidStuffGameTimeTimer() ; #DEBUG_LINE_NO:99
    EndIf ; #DEBUG_LINE_NO:
    Self.UnregisterForRemoteEvent(MQ101 as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == TimerID_KidStuff ; #DEBUG_LINE_NO:106
    Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:110
    If playerRef.HasPerk(Trait_KidStuff) ; #DEBUG_LINE_NO:111
      Self.HandleKidStuffTimer() ; #DEBUG_LINE_NO:112
      Self.StartKidStuffGameTimeTimer() ; #DEBUG_LINE_NO:113
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipSystemDamaged(ReferenceAlias akSender, ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  If Game.GetPlayer().HasPerk(TRAIT_Taskmaster) && aElectromagneticDamage == False ; #DEBUG_LINE_NO:120
    Self.TaskmasterPossibleRestore(akSender.GetShipReference(), akSystem, -1) ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnShipSystemRepaired(ReferenceAlias akSender, ActorValue akSystem, Int aBlocksGained, Bool aElectromagneticDamage)
  If Game.GetPlayer().HasPerk(TRAIT_Taskmaster) && aElectromagneticDamage == False ; #DEBUG_LINE_NO:127
    Self.TaskmasterSystemRepaired(akSender.GetShipReference(), akSystem, -1) ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function TaskmasterSystemRepaired(spaceshipreference shipRef, ActorValue SystemAV, Int debugDieRoll)
  sq_traitsquestscript:taskmastersystemdatum systemDatum = Self.GetTaskmasterSystemDatum(SystemAV) ; #DEBUG_LINE_NO:135
  If systemDatum.allowToRollForRestore == False ; #DEBUG_LINE_NO:136
    Float shipPartHealthPercent = Self.GetSystemHealthPercent(shipRef, systemDatum.SystemHealthAV) ; #DEBUG_LINE_NO:137
    If shipPartHealthPercent >= 1.0 ; #DEBUG_LINE_NO:141
      systemDatum.allowToRollForRestore = True ; #DEBUG_LINE_NO:142
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TaskmasterPossibleRestore(spaceshipreference shipRef, ActorValue SystemAV, Int debugDieRoll)
  If initialized == False ; #DEBUG_LINE_NO:151
    Self.OnQuestInit() ; #DEBUG_LINE_NO:152
  EndIf ; #DEBUG_LINE_NO:
  TryGuard TaskMasterRestoreGuard ;*** WARNING: Experimental syntax, may be incorrect: TryGuard  ; #DEBUG_LINE_NO:155
    sq_traitsquestscript:taskmastersystemdatum systemDatum = Self.GetTaskmasterSystemDatum(SystemAV) ; #DEBUG_LINE_NO:157
    If systemDatum.allowToRollForRestore ; #DEBUG_LINE_NO:158
      Float shipPartHealthPercent = Self.GetSystemHealthPercent(shipRef, systemDatum.SystemHealthAV) ; #DEBUG_LINE_NO:159
      If shipPartHealthPercent <= ShipPartHealthPercentTriggerThreshold ; #DEBUG_LINE_NO:163
        Bool dieRollSucess = Game.GetDieRollSuccess(TaskmasterChance, 1, 100, debugDieRoll, -1) ; #DEBUG_LINE_NO:165
        If dieRollSucess ; #DEBUG_LINE_NO:168
          Self.TaskmasterRepair(shipRef, systemDatum) ; #DEBUG_LINE_NO:169
        EndIf ; #DEBUG_LINE_NO:
        systemDatum.allowToRollForRestore = False ; #DEBUG_LINE_NO:172
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Float Function GetSystemHealthPercent(spaceshipreference shipRef, ActorValue SystemHealthAV)
  Float currentHealth = shipRef.GetValue(SystemHealthAV) ; #DEBUG_LINE_NO:182
  Float baseHealth = shipRef.GetBaseValue(SystemHealthAV) ; #DEBUG_LINE_NO:183
  Float shipPartHealthPercent = currentHealth / baseHealth ; #DEBUG_LINE_NO:184
  Return shipPartHealthPercent ; #DEBUG_LINE_NO:185
EndFunction

sq_traitsquestscript:taskmastersystemdatum Function GetTaskmasterSystemDatum(ActorValue SystemAV)
  sq_traitsquestscript:taskmastersystemdatum systemDatum = None ; #DEBUG_LINE_NO:189
  Int iFound = TaskmasterSystemData.findstruct("SystemAV", SystemAV, 0) ; #DEBUG_LINE_NO:190
  If iFound >= 0 ; #DEBUG_LINE_NO:192
    systemDatum = TaskmasterSystemData[iFound] ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
  Return systemDatum ; #DEBUG_LINE_NO:197
EndFunction

Actor[] Function GetTaskmasterSystemMatchingCrewMembers(spaceshipreference shipRef, sq_traitsquestscript:taskmastersystemdatum systemDatumToFindMatchCrewMembersFor)
  Perk[] crewSkillsNeeded = None ; #DEBUG_LINE_NO:203
  If systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkill ; #DEBUG_LINE_NO:205
    crewSkillsNeeded = new Perk[1] ; #DEBUG_LINE_NO:206
    crewSkillsNeeded[0] = systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkill ; #DEBUG_LINE_NO:207
  ElseIf systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkillsList ; #DEBUG_LINE_NO:209
    crewSkillsNeeded = systemDatumToFindMatchCrewMembersFor.AssociatedCrewSkillsList.GetArray(False) as Perk[] ; #DEBUG_LINE_NO:210
  Else ; #DEBUG_LINE_NO:
    Return None ; #DEBUG_LINE_NO:214
  EndIf ; #DEBUG_LINE_NO:
  Actor[] matchingCrewMembers = new Actor[0] ; #DEBUG_LINE_NO:217
  Actor[] crewMembers = shipRef.GetAllCrewMembers() ; #DEBUG_LINE_NO:219
  Int iCrewMember = 0 ; #DEBUG_LINE_NO:220
  While iCrewMember < crewMembers.Length ; #DEBUG_LINE_NO:222
    Actor currentCrewMember = crewMembers[iCrewMember] ; #DEBUG_LINE_NO:223
    Int iSkill = 0 ; #DEBUG_LINE_NO:226
    While iSkill < crewSkillsNeeded.Length ; #DEBUG_LINE_NO:227
      Perk currentSkill = crewSkillsNeeded[iSkill] ; #DEBUG_LINE_NO:228
      If currentCrewMember.HasPerk(currentSkill) ; #DEBUG_LINE_NO:230
        matchingCrewMembers.add(currentCrewMember, 1) ; #DEBUG_LINE_NO:231
        iSkill = crewSkillsNeeded.Length ; #DEBUG_LINE_NO:233
      EndIf ; #DEBUG_LINE_NO:
      iSkill += 1 ; #DEBUG_LINE_NO:236
    EndWhile ; #DEBUG_LINE_NO:
    iCrewMember += 1 ; #DEBUG_LINE_NO:239
  EndWhile ; #DEBUG_LINE_NO:
  Return matchingCrewMembers ; #DEBUG_LINE_NO:242
EndFunction

Function TaskmasterRepair(spaceshipreference shipRef, sq_traitsquestscript:taskmastersystemdatum systemDatum)
  Actor[] matchingCrew = Self.GetTaskmasterSystemMatchingCrewMembers(shipRef, systemDatum) ; #DEBUG_LINE_NO:248
  If matchingCrew.Length > 0 ; #DEBUG_LINE_NO:250
    Int I = Utility.RandomInt(0, matchingCrew.Length - 1) ; #DEBUG_LINE_NO:251
    Actor randomMatchingCrewMember = matchingCrew[I] ; #DEBUG_LINE_NO:252
    shipRef.RestoreValue(systemDatum.SystemHealthAV, 10000.0) ; #DEBUG_LINE_NO:256
    systemDatum.RepairedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:259
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandleAffinityEvent(Actor CompanionRef, affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  If akActorValue == COM_Affinity ; #DEBUG_LINE_NO:271
    Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:272
    Float reactionValue = akReactionValue.GetValue() ; #DEBUG_LINE_NO:273
    If reactionValue > 0.0 ; #DEBUG_LINE_NO:277
      If playerRef.IsSpellTarget(Trait_EmpathDebuff as Form) && playerRef.HasPerk(TRAIT_Empath) ; #DEBUG_LINE_NO:279
        playerRef.DispelSpell(Trait_EmpathDebuff) ; #DEBUG_LINE_NO:280
      EndIf ; #DEBUG_LINE_NO:
      Self.TriggerEmpath(CompanionRef as ObjectReference, Trait_EmpathBuff, Trait_EmpathyBuff_Msg) ; #DEBUG_LINE_NO:282
    ElseIf reactionValue < 0.0 ; #DEBUG_LINE_NO:283
      If playerRef.IsSpellTarget(Trait_EmpathBuff as Form) && playerRef.HasPerk(TRAIT_Empath) ; #DEBUG_LINE_NO:285
        playerRef.DispelSpell(Trait_EmpathBuff) ; #DEBUG_LINE_NO:286
      EndIf ; #DEBUG_LINE_NO:
      Self.TriggerEmpath(CompanionRef as ObjectReference, Trait_EmpathDebuff, Trait_EmpathyDebuff_Msg) ; #DEBUG_LINE_NO:288
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TriggerEmpath(ObjectReference CompanionRef, Spell SpellToCast, Message MessageToDisplay)
  Bool playerHasPerk = Game.GetPlayer().HasPerk(TRAIT_Empath) ; #DEBUG_LINE_NO:298
  If playerHasPerk ; #DEBUG_LINE_NO:300
    SpellToCast.Cast(CompanionRef, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:301
    MessageToDisplay.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:302
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandleKidStuffTimer()
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:307
  MiscObject credits = Game.GetCredits() ; #DEBUG_LINE_NO:308
  Int playerCredits = playerRef.GetItemCount(credits as Form) ; #DEBUG_LINE_NO:309
  Float weeklyParentalGiftPercentage = Trait_KidStuff_WeeklyParentalGiftPercentage.GetValue() ; #DEBUG_LINE_NO:311
  Int parentalGiftAmount = (playerCredits as Float * Trait_KidStuff_WeeklyParentalGiftPercentage.GetValue()) as Int ; #DEBUG_LINE_NO:312
  Int parentalGiftMax = Trait_KidStuff_WeeklyParentalGiftMax.GetValueInt() ; #DEBUG_LINE_NO:313
  If parentalGiftAmount > parentalGiftMax ; #DEBUG_LINE_NO:315
    parentalGiftAmount = parentalGiftMax ; #DEBUG_LINE_NO:316
  EndIf ; #DEBUG_LINE_NO:
  If parentalGiftAmount > 0 ; #DEBUG_LINE_NO:321
    playerRef.RemoveItem(credits as Form, parentalGiftAmount, True, None) ; #DEBUG_LINE_NO:323
    Int sfx = ITM_Credits_Down_WEF.Play(playerRef as ObjectReference, None, None) ; #DEBUG_LINE_NO:326
    Trait_KidStuff_Msg_SentCredits.Show(parentalGiftAmount as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:327
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartKidStuffGameTimeTimer()
  Float hoursUntilNextMondayAt8AM = Self.GetHoursUntilNextMondayAt8AM() ; #DEBUG_LINE_NO:332
  Self.StartTimerGameTime(hoursUntilNextMondayAt8AM, TimerID_KidStuff) ; #DEBUG_LINE_NO:334
EndFunction

Float Function GetHoursUntilNextMondayAt8AM()
  Float currentDay = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:344
  Int nextWeek = Math.Floor(currentDay + 7.0) ; #DEBUG_LINE_NO:348
  Int nextSunday = nextWeek - nextWeek % 7 ; #DEBUG_LINE_NO:349
  Int nextMonday = nextSunday + 1 ; #DEBUG_LINE_NO:351
  Float nextMondayAt8AM = nextMonday as Float + 0.333299994 ; #DEBUG_LINE_NO:352
  Float daysUntilNextMondayAt8AM = nextMondayAt8AM - currentDay ; #DEBUG_LINE_NO:353
  Float hoursUntilNextMondayAt8AM = daysUntilNextMondayAt8AM * 24.0 ; #DEBUG_LINE_NO:354
  Return hoursUntilNextMondayAt8AM ; #DEBUG_LINE_NO:364
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:372
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:376
EndFunction
