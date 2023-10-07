ScriptName QuestDebuggerScript Extends Quest
{ You can call the following on this Quest:
Function SetDebugStage(int DebugStage, bool FastFowarding = false)
Function SetActorValueOnPlayer(ActorValue ActorValueToSet, float ValueToSetTo)
Function MoveToDebugStageMarker(int DebugStage)
Function MoveToLatestDebugStageMarker()
Function MoveToNextDebugStageMarker()

In server console like:
CQF <QuestEditorID> FunctionName Param1 Param2 etc. }

;-- Structs -----------------------------------------
Struct DebugStageDatum
  Int Stage
  Bool TriggerOnStandardStageSet = False
  { IDefault: False. If true, setting the actual quest stage will also cause this DebugStage to trigger.
	Use this for stages that are only ever "Debug stages" and not "real" stages }
  ObjectReference RefToMoveTo
  { reference to move player to }
  ReferenceAlias RefAliasToMoveTo
  { if RefToMoveTo is none, it will try to move the player to this RefAlias }
  ReferenceAlias RefAliasToKill
  { kill this ReferenceAlias }
  RefCollectionAlias RefColToKill
  { kills everything in this refcol to the player }
  Form FormToAdd
  { add this for to player }
  ReferenceAlias AliasRefToAdd1
  { add this reference to the player }
  ReferenceAlias AliasRefToAdd2
  { add this reference to the player }
  RefCollectionAlias RefColToAdd
  { adds everything in this refcol to the player }
  ActorValue ActorValueToSet
  { set this actorvalue on player }
  Float ValueToSetTo
  { set actor value to this value }
  Scene SceneToStopWhenFastForwarding
  { stop scene instances of this scene when fast forwarding THROUGH this stage }
  Bool SetStageOnFastForward = True
  { if true (default), if fastforwarding past this stage, do this along the way }
  Bool RefToMoveToOnFastForward = False
  { if true, if fastforwarding past this stage, do this along the way }
  Bool RefToKillOnFastForward = False
  { if true, if fastforwarding past this stage, do this along the way }
  Bool AddToPlayerOnFastForward = True
  { if true (default), if fastforwarding past this stage, do this along the way }
  Bool SetActorValueOnFastForward = True
  { if true (default), if fastforwarding past this stage, do this along the way }
EndStruct


;-- Variables ---------------------------------------
Actor PlayerRef

;-- Properties --------------------------------------
questdebuggerscript:debugstagedatum[] Property DebugStageData Auto Const mandatory
{ THESE MUST BE DEFINED IN SEQUENTIAL ORDER }

;-- Functions ---------------------------------------

Event OnQuestInit()
  PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:64
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
  questdebuggerscript:debugstagedatum[] matchingDebugStages = DebugStageData.GetMatchingStructs("Stage", auiStageID, 0, -1) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs  ; #DEBUG_LINE_NO:68
  Int I = 0 ; #DEBUG_LINE_NO:70
  While I < matchingDebugStages.Length ; #DEBUG_LINE_NO:71
    questdebuggerscript:debugstagedatum currentDebugStageDatum = matchingDebugStages[I] ; #DEBUG_LINE_NO:72
    If currentDebugStageDatum.TriggerOnStandardStageSet ; #DEBUG_LINE_NO:74
      Self._SetDebugStageDatum(currentDebugStageDatum, False) ; #DEBUG_LINE_NO:75
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:78
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Function SetDebugStage(Int DebugStage, Bool FastFowarding)
  Bool SetSpecifiedStage = False ; #DEBUG_LINE_NO:86
  If FastFowarding == False ; #DEBUG_LINE_NO:88
    questdebuggerscript:debugstagedatum foundDatum = Self._GetDebugStageDatum(DebugStage) ; #DEBUG_LINE_NO:89
    If foundDatum ; #DEBUG_LINE_NO:90
      Self._SetDebugStageDatum(foundDatum, False) ; #DEBUG_LINE_NO:91
      SetSpecifiedStage = True ; #DEBUG_LINE_NO:92
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Int I = 0 ; #DEBUG_LINE_NO:96
    While I < DebugStageData.Length && DebugStageData[I].Stage <= DebugStage ; #DEBUG_LINE_NO:97
      If DebugStageData[I].Stage == DebugStage ; #DEBUG_LINE_NO:98
        Self._SetDebugStageDatum(DebugStageData[I], False) ; #DEBUG_LINE_NO:99
        SetSpecifiedStage = True ; #DEBUG_LINE_NO:100
      Else ; #DEBUG_LINE_NO:
        Self._SetDebugStageDatum(DebugStageData[I], True) ; #DEBUG_LINE_NO:102
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:104
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If SetSpecifiedStage == False ; #DEBUG_LINE_NO:108
    Self.SetStage(DebugStage) ; #DEBUG_LINE_NO:110
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function _SetDebugStageDatum(questdebuggerscript:debugstagedatum DebugStageDatumToSet, Bool FastFowardedThru)
  If FastFowardedThru == False || DebugStageDatumToSet.SetStageOnFastForward ; #DEBUG_LINE_NO:118
    Self.SetStage(DebugStageDatumToSet.Stage) ; #DEBUG_LINE_NO:120
  EndIf ; #DEBUG_LINE_NO:
  If FastFowardedThru == False || DebugStageDatumToSet.RefToMoveToOnFastForward ; #DEBUG_LINE_NO:123
    If DebugStageDatumToSet.RefToMoveTo ; #DEBUG_LINE_NO:124
      PlayerRef.MoveTo(DebugStageDatumToSet.RefToMoveTo, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:125
    ElseIf DebugStageDatumToSet.RefAliasToMoveTo ; #DEBUG_LINE_NO:126
      PlayerRef.MoveTo(DebugStageDatumToSet.RefAliasToMoveTo.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:127
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If FastFowardedThru == False || DebugStageDatumToSet.RefToKillOnFastForward ; #DEBUG_LINE_NO:131
    If DebugStageDatumToSet.RefAliasToKill ; #DEBUG_LINE_NO:132
      DebugStageDatumToSet.RefAliasToKill.TryToKill(None) ; #DEBUG_LINE_NO:133
    EndIf ; #DEBUG_LINE_NO:
    If DebugStageDatumToSet.RefColToKill.GetCount() > 0 ; #DEBUG_LINE_NO:135
      DebugStageDatumToSet.RefColToKill.KillAll(None) ; #DEBUG_LINE_NO:136
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If FastFowardedThru == False || DebugStageDatumToSet.AddToPlayerOnFastForward ; #DEBUG_LINE_NO:141
    If DebugStageDatumToSet.FormToAdd ; #DEBUG_LINE_NO:142
      PlayerRef.AddItem(DebugStageDatumToSet.FormToAdd, 1, False) ; #DEBUG_LINE_NO:143
    EndIf ; #DEBUG_LINE_NO:
    If DebugStageDatumToSet.AliasRefToAdd1 ; #DEBUG_LINE_NO:146
      Self.AddRefAliasToPlayer(DebugStageDatumToSet.AliasRefToAdd1) ; #DEBUG_LINE_NO:147
    EndIf ; #DEBUG_LINE_NO:
    If DebugStageDatumToSet.AliasRefToAdd2 ; #DEBUG_LINE_NO:150
      Self.AddRefAliasToPlayer(DebugStageDatumToSet.AliasRefToAdd2) ; #DEBUG_LINE_NO:151
    EndIf ; #DEBUG_LINE_NO:
    If DebugStageDatumToSet.RefColToAdd ; #DEBUG_LINE_NO:154
      ObjectReference[] itemsToAdd = DebugStageDatumToSet.RefColToAdd.GetArray() ; #DEBUG_LINE_NO:155
      Int I = 0 ; #DEBUG_LINE_NO:156
      While I < itemsToAdd.Length ; #DEBUG_LINE_NO:157
        PlayerRef.AddItem(itemsToAdd[I] as Form, 1, False) ; #DEBUG_LINE_NO:158
        I += 1 ; #DEBUG_LINE_NO:159
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If FastFowardedThru == False || DebugStageDatumToSet.SetActorValueOnFastForward ; #DEBUG_LINE_NO:165
    If DebugStageDatumToSet.ActorValueToSet ; #DEBUG_LINE_NO:166
      PlayerRef.SetValue(DebugStageDatumToSet.ActorValueToSet, DebugStageDatumToSet.ValueToSetTo) ; #DEBUG_LINE_NO:167
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If FastFowardedThru && DebugStageDatumToSet.SceneToStopWhenFastForwarding as Bool ; #DEBUG_LINE_NO:171
    DebugStageDatumToSet.SceneToStopWhenFastForwarding.Stop() ; #DEBUG_LINE_NO:172
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Int Function GetNextDebugStage()
  questdebuggerscript:debugstagedatum nextDatum = Self._GetNextDebugStageDatum() ; #DEBUG_LINE_NO:178
  If nextDatum ; #DEBUG_LINE_NO:180
    Return nextDatum.Stage ; #DEBUG_LINE_NO:182
  Else ; #DEBUG_LINE_NO:
    Return -1 ; #DEBUG_LINE_NO:185
  EndIf ; #DEBUG_LINE_NO:
EndFunction

questdebuggerscript:debugstagedatum Function _GetDebugStageDatum(Int StageToFind)
  Int iFound = DebugStageData.findstruct("Stage", StageToFind, 0) ; #DEBUG_LINE_NO:191
  If iFound > -1 ; #DEBUG_LINE_NO:192
    Return DebugStageData[iFound] ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
  Return None ; #DEBUG_LINE_NO:196
EndFunction

questdebuggerscript:debugstagedatum Function _GetLatestDebugStageDatum()
  questdebuggerscript:debugstagedatum latestDatum = None ; #DEBUG_LINE_NO:200
  Int I = Self._GetLatestDebugStageDatumIndex() ; #DEBUG_LINE_NO:202
  If I > -1 ; #DEBUG_LINE_NO:204
    latestDatum = DebugStageData[I] ; #DEBUG_LINE_NO:205
  EndIf ; #DEBUG_LINE_NO:
  Return latestDatum ; #DEBUG_LINE_NO:210
EndFunction

Int Function _GetLatestDebugStageDatumIndex()
  Int index = -1 ; #DEBUG_LINE_NO:214
  Int I = 0 ; #DEBUG_LINE_NO:216
  While I < DebugStageData.Length ; #DEBUG_LINE_NO:217
    If Self.GetStageDone(DebugStageData[I].Stage) ; #DEBUG_LINE_NO:218
      index = I ; #DEBUG_LINE_NO:219
      I = DebugStageData.Length ; #DEBUG_LINE_NO:220
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:222
  EndWhile ; #DEBUG_LINE_NO:
  Return index ; #DEBUG_LINE_NO:227
EndFunction

questdebuggerscript:debugstagedatum Function _GetNextDebugStageDatum()
  Int iLatest = Self._GetLatestDebugStageDatumIndex() ; #DEBUG_LINE_NO:231
  Int iNext = 0 ; #DEBUG_LINE_NO:232
  If iLatest > -1 ; #DEBUG_LINE_NO:233
    iNext = iLatest + 1 ; #DEBUG_LINE_NO:234
  Else ; #DEBUG_LINE_NO:
    iNext = 0 ; #DEBUG_LINE_NO:237
  EndIf ; #DEBUG_LINE_NO:
  If iNext <= DebugStageData.Length ; #DEBUG_LINE_NO:244
    Return DebugStageData[iNext] ; #DEBUG_LINE_NO:246
  EndIf ; #DEBUG_LINE_NO:
  Return None ; #DEBUG_LINE_NO:250
EndFunction

Function MoveToDebugStageMarker(Int DebugStage)
  questdebuggerscript:debugstagedatum datumToUse = Self._GetDebugStageDatum(DebugStage) ; #DEBUG_LINE_NO:259
  Self._MoveToDatumRefToMoveTo(datumToUse) ; #DEBUG_LINE_NO:262
EndFunction

Function MoveToLatestDebugStageMarker()
  questdebuggerscript:debugstagedatum datumToUse = Self._GetLatestDebugStageDatum() ; #DEBUG_LINE_NO:269
  Self._MoveToDatumRefToMoveTo(datumToUse) ; #DEBUG_LINE_NO:272
EndFunction

Function MoveToNextDebugStageMarker()
  questdebuggerscript:debugstagedatum datumToUse = Self._GetNextDebugStageDatum() ; #DEBUG_LINE_NO:278
  Self._MoveToDatumRefToMoveTo(datumToUse) ; #DEBUG_LINE_NO:281
EndFunction

Function _MoveToDatumRefToMoveTo(questdebuggerscript:debugstagedatum datumToUse)
  ObjectReference RefToMoveTo = None ; #DEBUG_LINE_NO:285
  If datumToUse ; #DEBUG_LINE_NO:287
    If datumToUse.RefToMoveTo ; #DEBUG_LINE_NO:288
      RefToMoveTo = datumToUse.RefToMoveTo ; #DEBUG_LINE_NO:289
    ElseIf datumToUse.RefAliasToMoveTo ; #DEBUG_LINE_NO:290
      RefToMoveTo = datumToUse.RefAliasToMoveTo.GetReference() ; #DEBUG_LINE_NO:291
    EndIf ; #DEBUG_LINE_NO:
    If RefToMoveTo ; #DEBUG_LINE_NO:294
      PlayerRef.MoveTo(RefToMoveTo, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:296
    ElseIf RefToMoveTo ; #DEBUG_LINE_NO:
      PlayerRef.MoveTo(RefToMoveTo, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:298
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function AddRefAliasToPlayer(ReferenceAlias AliasRefToAdd)
  ObjectReference refToAdd = AliasRefToAdd.GetReference() ; #DEBUG_LINE_NO:308
  PlayerRef.AddItem(refToAdd as Form, 1, False) ; #DEBUG_LINE_NO:310
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String DejaSubChannel, Bool bShowNormalTrace)
  Return Debug.TraceLog(CallingObject, asTextToPrint, "default", DejaSubChannel, aiSeverity, bShowNormalTrace, False, False, True) ; #DEBUG_LINE_NO:319
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String DejaSubChannel, Bool bShowNormalTrace)
  Game.warning(CallingObject as String + asTextToPrint) ; #DEBUG_LINE_NO:323
EndFunction
