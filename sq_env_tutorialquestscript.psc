ScriptName SQ_Env_TutorialQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct MagicEffectTutorialDatum
  Keyword TutorialEffectKeyword
  { filter for: ENV_TutorialEffect_* }
  String TutorialEvent
EndStruct


;-- Variables ---------------------------------------
Int AfflictionTutorialState
String EventString_CarbondioxideGain = "GainCarbonDioxide"
String EventString_CarbondioxideMaxed = "MaxedCarbonDioxide"
String EventString_EnvDmg = "EnvDmg"
String EventString_EnvDmgReminder = "EnvDmg3"
String EventString_EnvDmgSoak = "EnvDmgSoak"
String EventString_GainInjury = "GainInjury"
String EventString_MatchingTreatment = "MatchingTreatment"
String EventString_Oxygen = "Oxygen"
String EventString_OxygenOut = "OutOfOxygen"
Bool FirstCarbonDioxideTutorialFinished
Bool FirstOxygenTutorialFinished
Float InitialValue_Env_Damage_Soak = 200.0
String MenuName_InventoryMenu = "InventoryMenu" Const
String MenuName_StatusMenu = "StatusMenu" Const
Float TimerDur_EnvDmgHealReminder = 60.0
Float TimerDur_TimerDurMax_EnvDmgHealReminder = 960.0 Const
Int TimerID_EnvDmgHealReminder = 1 Const
Int TreatmentAcquireTutorialState
Int TreatmentTutorialState
defaulttutorialquestscript TutorialIns
Bool TutorialsEnabled = False
Int iTutorialState_Finished = 2
Int iTutorialState_Started = 1
Int iTutorialState_Unset = 0

;-- Properties --------------------------------------
Group Autofill
  sq_env_afflictionsscript Property SQ_Env Auto Const mandatory
  Message Property SQ_ENV_TutorialMsgBox_StatusMenu_Afflictions Auto Const mandatory
  Message Property SQ_ENV_TutorialMsgBox_InventoryMenu_MatchingTreatment Auto Const mandatory
  FormList Property ENV_AFFL_TreatmentTypeKeywords Auto Const mandatory
  ActorValue Property Oxygen Auto Const mandatory
  ActorValue Property CarbonDioxide Auto Const mandatory
  ActorValue Property EnvDmg Auto Const mandatory
  ActorValue Property ENV_Damage_Soak Auto Const mandatory
  Keyword Property ENV_EffectType_AFFL_Affliction Auto Const mandatory
EndGroup

Group EnableTutorials
  Quest Property MQ101 Auto Const mandatory
  Int Property EnableStage = 640 Auto Const
EndGroup

sq_env_tutorialquestscript:magiceffecttutorialdatum[] Property MagicEffectTutorialData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  TutorialIns = (Self as Quest) as defaulttutorialquestscript ; #DEBUG_LINE_NO:72
  Self.RegisterForRemoteEvent(MQ101 as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:73
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == TimerID_EnvDmgHealReminder ; #DEBUG_LINE_NO:77
    If Game.GetPlayer().GetValue(EnvDmg) > 0.0 ; #DEBUG_LINE_NO:78
      TutorialIns.ShowHelpMessage(EventString_EnvDmgReminder) ; #DEBUG_LINE_NO:79
      If TimerDur_EnvDmgHealReminder < TimerDur_TimerDurMax_EnvDmgHealReminder ; #DEBUG_LINE_NO:82
        TimerDur_EnvDmgHealReminder *= 2.0 ; #DEBUG_LINE_NO:83
        Self.StartTimer(TimerDur_EnvDmgHealReminder, TimerID_EnvDmgHealReminder) ; #DEBUG_LINE_NO:84
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If akSender == MQ101 && auiStageID == EnableStage ; #DEBUG_LINE_NO:93
    Self.EnableTutorials() ; #DEBUG_LINE_NO:94
    Self.UnregisterForRemoteEvent(MQ101 as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:95
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function EnableTutorials()
  TutorialsEnabled = True ; #DEBUG_LINE_NO:102
  Self.StartOxygenTutorial() ; #DEBUG_LINE_NO:103
  Self.StartEnvDmgTutorial() ; #DEBUG_LINE_NO:104
  If SQ_Env.GetActiveAfflictions(False, False, False, False, None).Length > 0 ; #DEBUG_LINE_NO:108
    Self.StartAfflictionTutorial() ; #DEBUG_LINE_NO:109
  EndIf ; #DEBUG_LINE_NO:
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:113
  Int I = 0 ; #DEBUG_LINE_NO:114
  While I < MagicEffectTutorialData.Length ; #DEBUG_LINE_NO:115
    sq_env_tutorialquestscript:magiceffecttutorialdatum currentDatum = MagicEffectTutorialData[I] ; #DEBUG_LINE_NO:116
    If playerRef.HasMagicEffectWithKeyword(currentDatum.TutorialEffectKeyword) ; #DEBUG_LINE_NO:118
      String tutorialEventString = currentDatum.TutorialEvent ; #DEBUG_LINE_NO:119
      ((Self as Quest) as defaulttutorialquestscript).ShowHelpMessage(tutorialEventString) ; #DEBUG_LINE_NO:121
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:124
  EndWhile ; #DEBUG_LINE_NO:
  If playerRef.HasMagicEffectWithKeyword(ENV_EffectType_AFFL_Affliction) ; #DEBUG_LINE_NO:127
    Self.StartAfflictionTutorial() ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartAfflictionTutorial()
  If TutorialsEnabled == False ; #DEBUG_LINE_NO:136
    Return  ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
  If AfflictionTutorialState == iTutorialState_Unset ; #DEBUG_LINE_NO:141
    AfflictionTutorialState = iTutorialState_Started ; #DEBUG_LINE_NO:144
    TreatmentTutorialState = iTutorialState_Started ; #DEBUG_LINE_NO:145
    TreatmentAcquireTutorialState = iTutorialState_Started ; #DEBUG_LINE_NO:146
    TutorialIns.ShowHelpMessage(EventString_GainInjury) ; #DEBUG_LINE_NO:148
    Self.RegisterForMenuOpenCloseEvent(MenuName_StatusMenu) ; #DEBUG_LINE_NO:149
    Self.RegisterForMenuOpenCloseEvent(MenuName_InventoryMenu) ; #DEBUG_LINE_NO:150
    Self.AddInventoryEventFilter(ENV_AFFL_TreatmentTypeKeywords as Form) ; #DEBUG_LINE_NO:152
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartOxygenTutorial()
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:159
  Self.RegisterForActorValueLessThanEvent(playerRef as ObjectReference, Oxygen, 85.0) ; #DEBUG_LINE_NO:160
  Self.RegisterForActorValueGreaterThanEvent(playerRef as ObjectReference, CarbonDioxide, 25.0) ; #DEBUG_LINE_NO:161
EndFunction

Function StartEnvDmgTutorial()
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:166
  Self.RegisterForActorValueLessThanEvent(playerRef as ObjectReference, ENV_Damage_Soak, InitialValue_Env_Damage_Soak - 1.0) ; #DEBUG_LINE_NO:167
EndFunction

Function ShowEffectScriptHelpMessage(Keyword TutorialEffectKeyword)
  If TutorialsEnabled ; #DEBUG_LINE_NO:174
    Int foundIndex = MagicEffectTutorialData.findstruct("TutorialEffectKeyword", TutorialEffectKeyword, 0) ; #DEBUG_LINE_NO:175
    If foundIndex > -1 ; #DEBUG_LINE_NO:177
      String tutorialEventString = MagicEffectTutorialData[foundIndex].TutorialEvent ; #DEBUG_LINE_NO:178
      ((Self as Quest) as defaulttutorialquestscript).ShowHelpMessage(tutorialEventString) ; #DEBUG_LINE_NO:181
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == Oxygen ; #DEBUG_LINE_NO:189
    If FirstOxygenTutorialFinished == False ; #DEBUG_LINE_NO:190
      TutorialIns.ShowHelpMessage(EventString_Oxygen) ; #DEBUG_LINE_NO:191
      FirstOxygenTutorialFinished = True ; #DEBUG_LINE_NO:192
      Self.RegisterForActorValueLessThanEvent(Game.GetPlayer() as ObjectReference, Oxygen, 20.0) ; #DEBUG_LINE_NO:193
    Else ; #DEBUG_LINE_NO:
      TutorialIns.UnshowHelpMessage(EventString_Oxygen) ; #DEBUG_LINE_NO:195
      TutorialIns.ShowHelpMessage(EventString_OxygenOut) ; #DEBUG_LINE_NO:196
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akActorValue == ENV_Damage_Soak ; #DEBUG_LINE_NO:199
    TutorialIns.ShowHelpMessage(EventString_EnvDmgSoak) ; #DEBUG_LINE_NO:200
    Utility.Wait(10.0) ; #DEBUG_LINE_NO:203
    Self.RegisterForActorValueGreaterThanEvent(Game.GetPlayer() as ObjectReference, EnvDmg, 1.0) ; #DEBUG_LINE_NO:204
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActorValueGreaterThan(ObjectReference akObjRef, ActorValue akActorValue)
  If akActorValue == CarbonDioxide ; #DEBUG_LINE_NO:210
    If FirstCarbonDioxideTutorialFinished == False ; #DEBUG_LINE_NO:211
      TutorialIns.UnshowHelpMessage(EventString_OxygenOut) ; #DEBUG_LINE_NO:212
      TutorialIns.ShowHelpMessage(EventString_CarbondioxideGain) ; #DEBUG_LINE_NO:213
      FirstCarbonDioxideTutorialFinished = True ; #DEBUG_LINE_NO:214
      Self.RegisterForActorValueGreaterThanEvent(Game.GetPlayer() as ObjectReference, CarbonDioxide, 99.0) ; #DEBUG_LINE_NO:215
    Else ; #DEBUG_LINE_NO:
      TutorialIns.UnshowHelpMessage(EventString_CarbondioxideGain) ; #DEBUG_LINE_NO:217
      TutorialIns.ShowHelpMessage(EventString_CarbondioxideMaxed) ; #DEBUG_LINE_NO:218
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akActorValue == EnvDmg ; #DEBUG_LINE_NO:221
    TutorialIns.UnshowHelpMessage(EventString_EnvDmgSoak) ; #DEBUG_LINE_NO:222
    TutorialIns.ShowHelpMessage(EventString_EnvDmg) ; #DEBUG_LINE_NO:223
    Self.StartTimer(TimerDur_EnvDmgHealReminder, TimerID_EnvDmgHealReminder) ; #DEBUG_LINE_NO:224
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If abOpening ; #DEBUG_LINE_NO:231
    If asMenuName == MenuName_StatusMenu && AfflictionTutorialState == iTutorialState_Started ; #DEBUG_LINE_NO:233
      TutorialIns.UnshowHelpMessage(EventString_GainInjury) ; #DEBUG_LINE_NO:234
      SQ_ENV_TutorialMsgBox_StatusMenu_Afflictions.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:235
      Self.UnregisterForMenuOpenCloseEvent(MenuName_StatusMenu) ; #DEBUG_LINE_NO:236
      AfflictionTutorialState = iTutorialState_Finished ; #DEBUG_LINE_NO:237
    ElseIf asMenuName == MenuName_InventoryMenu && TreatmentTutorialState == iTutorialState_Started ; #DEBUG_LINE_NO:240
      Bool hasMatchingAfflictionTreatment = SQ_Env.PlayerHasMatchingTreatmentItemForAnActiveAffliction() ; #DEBUG_LINE_NO:241
      If hasMatchingAfflictionTreatment ; #DEBUG_LINE_NO:244
        TutorialIns.UnshowHelpMessage(EventString_MatchingTreatment) ; #DEBUG_LINE_NO:245
        SQ_ENV_TutorialMsgBox_InventoryMenu_MatchingTreatment.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:246
        TreatmentTutorialState = iTutorialState_Finished ; #DEBUG_LINE_NO:247
        TreatmentAcquireTutorialState = iTutorialState_Finished ; #DEBUG_LINE_NO:248
        Self.UnregisterForMenuOpenCloseEvent(MenuName_InventoryMenu) ; #DEBUG_LINE_NO:251
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If TreatmentAcquireTutorialState == iTutorialState_Started ; #DEBUG_LINE_NO:260
    Bool hasMatchingAfflictionTreatment = SQ_Env.FormHasMatchingTreatmentItemForAnActiveAffliction(akBaseItem) ; #DEBUG_LINE_NO:261
    If hasMatchingAfflictionTreatment ; #DEBUG_LINE_NO:265
      TutorialIns.ShowHelpMessage("MatchingTreatment") ; #DEBUG_LINE_NO:266
      TreatmentAcquireTutorialState = iTutorialState_Finished ; #DEBUG_LINE_NO:267
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If TreatmentAcquireTutorialState == iTutorialState_Finished ; #DEBUG_LINE_NO:271
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:272
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:282
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:286
EndFunction
