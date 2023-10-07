ScriptName LC165ShiftingQuestScript Extends Quest
{ One of the quest scripts for LC165, Buried Temple. Handles the memory space shifting for the quest. }

;-- Structs -----------------------------------------
Struct ShiftDatum
  String Name
  { Required. A name for this shift destination. }
  ObjectReference PlayerMoveTarget
  { Required. Marker to move the player to. }
  ObjectReference CompanionMoveTarget
  { Optional. Marker to move the Companion to. If none, Companion will be moved to the fallback point. }
  ObjectReference AllyMoveTarget
  { Optional. Marker to move the Ally to. If none, Ally will be moved to the fallback point. }
  ObjectReference AdversaryMoveTargets
  { Optional. The first marker in a chain of markers to move the StarbornAdversary_Duplicates to. If none, StarbornAdversary_Duplicates will not be moved. }
  ReferenceAlias EnableParent
  { Optional. Enable parent of the geometry for this area. }
  RefCollectionAlias RefsToDisableOnShiftTo
  { Optional. RefCollection of refs to disable when we shift to this location. }
  RefCollectionAlias RefsToEnableOnShiftTo
  { Optional. RefCollection of refs to enable and move to package locations when we shift to this location. }
  RefCollectionAlias RefsToDisableOnShiftAway
  { Optional. RefCollection of refs to disable when we shift away from this location. }
  RefCollectionAlias RefsToEnableOnShiftAway
  { Optional. RefCollection of refs to enable and move to package locations when we shift away from this location. }
  String FunctionToCallDuringShift
  { Optional. Function to call on the quest script during the shift. }
  Bool IsShiftToPrimaryUniverse = False
  { Optional. If True, this is a shift back to the player's primary universe. Affects SFX. }
  Int StageToSetBeforeShift = -1
  { Optional. Stage to set on this quest at the beginning of the shift process. }
  Int StageToSetAfterShift = -1
  { Optional. Stage to set on this quest at the end of the shift process. }
  Bool SetAfterStageAfterVFX = False
  { Optional. If True, set the After stage only after lifting the VFX. Otherwise, set just before doing so. }
  Bool IsCrossCellMove = False
  { Optional. If True, use MoveTo instead of PopPlayerTo, and omit all VFX. }
  Bool ShouldEnableHandScanner = True
  { Optional. If True, enable the hand scanner following the shift. If False, disable it. }
  Float UpdateAdversaryDelay = 0.0
  { Optional. Amount of time to delay, after the shift has finished, before moving the Adversary. }
  Bool ShouldStopCombatOnShift = False
  { Optional. Should we stop combat on the player on shift? }
  Bool hasUpdatedAdversary = False
  { Runtime. Set when the adversary has been updated. }
EndStruct


;-- Variables ---------------------------------------
Float CONST_AdversaryTeleportInDelay = 0.25 Const
Int CONST_DistortionID_EnterScow = 2 Const
Int CONST_DistortionID_EnterVectera = 0 Const
Int CONST_DistortionID_LeaveScow = 3 Const
Int CONST_DistortionID_LeaveVectera = 1 Const
Int CONST_Objective_CompleteScowDistortion = 150 Const
Int CONST_Objective_CompleteVecteraDistortion = 110 Const
Int CONST_Objective_EnterScowDistortion = 140 Const
Int CONST_Objective_EnterVecteraDistortion = 100 Const
Int CONST_Objective_FindWayOutOfScowDistortion = 145 Const
Int CONST_Stage_FoundWayOutOfScowDistortion = 780 Const
Int CONST_WaitForAdversaryUpdateFailsafe = 1000 Const
inputenablelayer inputLayer
Actor player
lc165questscript selfAsQuestScript
ObjectReference shiftingActivatorRef
Bool updateAdversaryInProgress

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ShiftingGuard

;-- Properties --------------------------------------
Group ShiftingSystemProperties
  lc165shiftingquestscript:shiftdatum[] Property ShiftData Auto mandatory
  { List of Memory Spaces shifting targets. }
EndGroup

Group AutofillProperties
  sq_followersscript Property SQ_Followers Auto Const mandatory
  ReferenceAlias Property Ally Auto Const mandatory
  RefCollectionAlias Property StarbornAdversary_Duplicates Auto Const mandatory
  RefCollectionAlias Property Followers Auto Const mandatory
  ReferenceAlias Property ShiftingActivator Auto Const mandatory
  ObjectReference Property LC165_Shift_CompanionFallbackMarkerRef Auto Const mandatory
  ObjectReference Property LC165_Shift_AllyFallbackMarkerRef Auto Const mandatory
  ObjectReference Property LC165AllyHoldingPenMarkerRef Auto Const mandatory
  ImageSpaceModifier Property MQ206DShiftFadeHoldImod Auto Const mandatory
  ImageSpaceModifier Property MQ206DShiftFadeInImod Auto Const mandatory
  wwiseevent Property WwiseEvent_QSTMQ207C_ShiftToA Auto Const mandatory
  wwiseevent Property WwiseEvent_QSTMQ207C_ShiftToB Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
  Keyword Property LC165_StarbornAdversaryInaccessibleKeyword Auto Const mandatory
EndGroup

lc165shiftingquestscript:shiftdatum Property currentShift Auto hidden

;-- Functions ---------------------------------------

Event OnQuestInit()
  selfAsQuestScript = (Self as Quest) as lc165questscript ; #DEBUG_LINE_NO:105
  player = Game.GetPlayer() ; #DEBUG_LINE_NO:106
  inputLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:107
  shiftingActivatorRef = ShiftingActivator.GetRef() ; #DEBUG_LINE_NO:108
  Int I = 0 ; #DEBUG_LINE_NO:111
  While I < ShiftData.Length ; #DEBUG_LINE_NO:112
    ShiftData[I].RefsToEnableOnShiftTo.ResetAll() ; #DEBUG_LINE_NO:113
    I += 1 ; #DEBUG_LINE_NO:114
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Function ShiftTo(String Name, String FunctionToCallDuringShift, ObjectReference distortion, Int DistortionID, Actor[] stopCombatWith)
  Int index = ShiftData.findstruct("Name", Name, 0) ; #DEBUG_LINE_NO:124
  If index < 0 ; #DEBUG_LINE_NO:125
     ; #DEBUG_LINE_NO:
  ElseIf ShiftData[index] == currentShift ; #DEBUG_LINE_NO:127
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:130
      lc165shiftingquestscript:shiftdatum oldShift = currentShift ; #DEBUG_LINE_NO:133
      currentShift = ShiftData[index] ; #DEBUG_LINE_NO:134
      If !currentShift.IsCrossCellMove ; #DEBUG_LINE_NO:137
        If currentShift.IsShiftToPrimaryUniverse == True ; #DEBUG_LINE_NO:139
          WwiseEvent_QSTMQ207C_ShiftToB.Play(player as ObjectReference, None, None) ; #DEBUG_LINE_NO:140
        Else ; #DEBUG_LINE_NO:
          WwiseEvent_QSTMQ207C_ShiftToA.Play(player as ObjectReference, None, None) ; #DEBUG_LINE_NO:142
        EndIf ; #DEBUG_LINE_NO:
        If distortion == None ; #DEBUG_LINE_NO:145
          shiftingActivatorRef.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:146
        Else ; #DEBUG_LINE_NO:
          shiftingActivatorRef.MoveTo(distortion, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:148
        EndIf ; #DEBUG_LINE_NO:
        shiftingActivatorRef.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:150
      EndIf ; #DEBUG_LINE_NO:
      inputLayer.DisablePlayerControls(True, False, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:154
      If currentShift.AdversaryMoveTargets != None ; #DEBUG_LINE_NO:157
        updateAdversaryInProgress = True ; #DEBUG_LINE_NO:163
        player.AddKeyword(LC165_StarbornAdversaryInaccessibleKeyword) ; #DEBUG_LINE_NO:164
        Game.PopPlayerTo(LC165AllyHoldingPenMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:167
      EndIf ; #DEBUG_LINE_NO:
      If oldShift != None && oldShift.RefsToEnableOnShiftAway != None ; #DEBUG_LINE_NO:171
        oldShift.RefsToEnableOnShiftAway.EnableAll(False) ; #DEBUG_LINE_NO:172
      EndIf ; #DEBUG_LINE_NO:
      If oldShift != None && oldShift.RefsToDisableOnShiftAway != None ; #DEBUG_LINE_NO:174
        oldShift.RefsToDisableOnShiftAway.DisableAll(False) ; #DEBUG_LINE_NO:175
      EndIf ; #DEBUG_LINE_NO:
      If currentShift.StageToSetBeforeShift >= 0 ; #DEBUG_LINE_NO:179
        Self.SetStage(currentShift.StageToSetBeforeShift) ; #DEBUG_LINE_NO:180
      EndIf ; #DEBUG_LINE_NO:
      If currentShift.EnableParent != None ; #DEBUG_LINE_NO:184
        currentShift.EnableParent.TryToEnable() ; #DEBUG_LINE_NO:186
      EndIf ; #DEBUG_LINE_NO:
      If currentShift.RefsToEnableOnShiftTo != None ; #DEBUG_LINE_NO:189
        ObjectReference[] refsToEnable = currentShift.RefsToEnableOnShiftTo.GetArray() ; #DEBUG_LINE_NO:191
        Int I = 0 ; #DEBUG_LINE_NO:192
        While I < refsToEnable.Length ; #DEBUG_LINE_NO:193
          refsToEnable[I].Enable(False) ; #DEBUG_LINE_NO:194
          I += 1 ; #DEBUG_LINE_NO:195
        EndWhile ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If currentShift.RefsToDisableOnShiftTo != None ; #DEBUG_LINE_NO:199
        currentShift.RefsToDisableOnShiftTo.DisableAll(False) ; #DEBUG_LINE_NO:200
      EndIf ; #DEBUG_LINE_NO:
      If !currentShift.IsCrossCellMove ; #DEBUG_LINE_NO:204
        Game.PopPlayerTo(currentShift.PlayerMoveTarget, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:205
      Else ; #DEBUG_LINE_NO:
        player.MoveTo(currentShift.PlayerMoveTarget, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:207
      EndIf ; #DEBUG_LINE_NO:
      If FunctionToCallDuringShift != "" ; #DEBUG_LINE_NO:211
        selfAsQuestScript.CallFunction(FunctionToCallDuringShift, None) ; #DEBUG_LINE_NO:212
      EndIf ; #DEBUG_LINE_NO:
      If currentShift.FunctionToCallDuringShift != "" ; #DEBUG_LINE_NO:214
        selfAsQuestScript.CallFunction(currentShift.FunctionToCallDuringShift, None) ; #DEBUG_LINE_NO:215
      EndIf ; #DEBUG_LINE_NO:
      If currentShift.CompanionMoveTarget != None ; #DEBUG_LINE_NO:219
        SQ_Followers.TeleportFollowers(currentShift.CompanionMoveTarget, None, True, True, True, False, True) ; #DEBUG_LINE_NO:221
      Else ; #DEBUG_LINE_NO:
        SQ_Followers.TeleportFollowers(LC165_Shift_CompanionFallbackMarkerRef, None, True, True, False, True, True) ; #DEBUG_LINE_NO:224
      EndIf ; #DEBUG_LINE_NO:
      Actor allyRef = Ally.GetActorRef() ; #DEBUG_LINE_NO:228
      If allyRef != None ; #DEBUG_LINE_NO:229
        Actor[] allyRefArray = new Actor[1] ; #DEBUG_LINE_NO:230
        allyRefArray[0] = allyRef ; #DEBUG_LINE_NO:231
        If currentShift.AllyMoveTarget != None ; #DEBUG_LINE_NO:232
          SQ_Followers.TeleportFollowers(currentShift.AllyMoveTarget, allyRefArray, True, True, True, False, True) ; #DEBUG_LINE_NO:234
        Else ; #DEBUG_LINE_NO:
          SQ_Followers.TeleportFollowers(LC165_Shift_AllyFallbackMarkerRef, allyRefArray, True, True, False, True, True) ; #DEBUG_LINE_NO:237
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If currentShift.ShouldStopCombatOnShift ; #DEBUG_LINE_NO:242
        player.StopCombat() ; #DEBUG_LINE_NO:243
        If stopCombatWith != None ; #DEBUG_LINE_NO:244
          Int i = 0 ; #DEBUG_LINE_NO:245
          While i < stopCombatWith.Length ; #DEBUG_LINE_NO:246
            Actor current = stopCombatWith[i] ; #DEBUG_LINE_NO:247
            If current != None ; #DEBUG_LINE_NO:248
              current.StopCombat() ; #DEBUG_LINE_NO:249
            EndIf ; #DEBUG_LINE_NO:
            i += 1 ; #DEBUG_LINE_NO:252
          EndWhile ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If !currentShift.SetAfterStageAfterVFX && currentShift.StageToSetAfterShift >= 0 ; #DEBUG_LINE_NO:258
        Self.SetStage(currentShift.StageToSetAfterShift) ; #DEBUG_LINE_NO:259
      EndIf ; #DEBUG_LINE_NO:
      If DistortionID >= 0 ; #DEBUG_LINE_NO:263
        Self.UpdateObjectivesWhenEnteringDistortion(DistortionID) ; #DEBUG_LINE_NO:264
      EndIf ; #DEBUG_LINE_NO:
      inputLayer.Reset() ; #DEBUG_LINE_NO:268
      inputLayer.EnableHandScanner(currentShift.ShouldEnableHandScanner) ; #DEBUG_LINE_NO:271
      If !currentShift.IsCrossCellMove ; #DEBUG_LINE_NO:274
        shiftingActivatorRef.PlayAnimation("Stop01") ; #DEBUG_LINE_NO:275
      EndIf ; #DEBUG_LINE_NO:
      If currentShift.SetAfterStageAfterVFX && currentShift.StageToSetAfterShift >= 0 ; #DEBUG_LINE_NO:279
        Self.SetStage(currentShift.StageToSetAfterShift) ; #DEBUG_LINE_NO:280
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ShiftAdversary(String adversaryShiftName)
  Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:287
    If currentShift == None ; #DEBUG_LINE_NO:288
       ; #DEBUG_LINE_NO:
    ElseIf currentShift.Name != adversaryShiftName ; #DEBUG_LINE_NO:290
       ; #DEBUG_LINE_NO:
    ElseIf currentShift.AdversaryMoveTargets == None ; #DEBUG_LINE_NO:292
       ; #DEBUG_LINE_NO:
    ElseIf currentShift.hasUpdatedAdversary ; #DEBUG_LINE_NO:294
       ; #DEBUG_LINE_NO:
    ElseIf currentShift.UpdateAdversaryDelay == 0.0 ; #DEBUG_LINE_NO:297
      Self.UpdateAdversary(currentShift.Name, currentShift.UpdateAdversaryDelay) ; #DEBUG_LINE_NO:298
    Else ; #DEBUG_LINE_NO:
      Var[] akArgs = new Var[2] ; #DEBUG_LINE_NO:300
      akArgs[0] = currentShift.Name as Var ; #DEBUG_LINE_NO:301
      akArgs[1] = currentShift.UpdateAdversaryDelay as Var ; #DEBUG_LINE_NO:302
      Self.CallFunctionNoWait("UpdateAdversary", akArgs) ; #DEBUG_LINE_NO:303
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function UpdateAdversary(String Name, Float delay)
  Utility.Wait(delay) ; #DEBUG_LINE_NO:310
  Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:311
    If currentShift == None ; #DEBUG_LINE_NO:312
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Int index = ShiftData.findstruct("Name", Name, 0) ; #DEBUG_LINE_NO:315
      If ShiftData[index] != currentShift ; #DEBUG_LINE_NO:316
         ; #DEBUG_LINE_NO:
      ElseIf ShiftData[index].hasUpdatedAdversary ; #DEBUG_LINE_NO:318
         ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.Private_UpdateAdversary() ; #DEBUG_LINE_NO:321
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function Private_UpdateAdversary()
  currentShift.hasUpdatedAdversary = True ; #DEBUG_LINE_NO:328
  Actor[] adversaryArray = StarbornAdversary_Duplicates.GetArray() as Actor[] ; #DEBUG_LINE_NO:329
  ObjectReference[] adversaryTargets = currentShift.AdversaryMoveTargets.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:330
  adversaryTargets.insert(currentShift.AdversaryMoveTargets, 0) ; #DEBUG_LINE_NO:331
  Int adversaryIndex = 0 ; #DEBUG_LINE_NO:332
  Int targetIndex = 0 ; #DEBUG_LINE_NO:333
  While adversaryIndex < adversaryArray.Length ; #DEBUG_LINE_NO:335
    Actor current = adversaryArray[adversaryIndex] ; #DEBUG_LINE_NO:336
    Bool currentIsDead = current.IsDead() ; #DEBUG_LINE_NO:337
    If !currentIsDead ; #DEBUG_LINE_NO:339
      Float targetHealth = current.GetValue(Health) ; #DEBUG_LINE_NO:340
      ObjectReference currentTarget = adversaryTargets[targetIndex] ; #DEBUG_LINE_NO:341
      selfAsQuestScript.TeleportIn(currentTarget, None, None) ; #DEBUG_LINE_NO:342
      current.MoveTo(currentTarget, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:343
      current.RemoveKeyword(LC165_StarbornAdversaryInaccessibleKeyword) ; #DEBUG_LINE_NO:345
      current.SetNoBleedoutRecovery(False) ; #DEBUG_LINE_NO:347
      current.RestoreValue(Health, 1.0) ; #DEBUG_LINE_NO:348
      current.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:349
      Float damageHealth = current.GetValue(Health) - targetHealth ; #DEBUG_LINE_NO:350
      If damageHealth > 0.0 ; #DEBUG_LINE_NO:351
        current.DamageValue(Health, damageHealth) ; #DEBUG_LINE_NO:352
      EndIf ; #DEBUG_LINE_NO:
      current.StartCombat(player as ObjectReference, False) ; #DEBUG_LINE_NO:355
      current.EvaluatePackage(False) ; #DEBUG_LINE_NO:356
      targetIndex = Math.Min((targetIndex + 1) as Float, (adversaryTargets.Length - 1) as Float) as Int ; #DEBUG_LINE_NO:357
    EndIf ; #DEBUG_LINE_NO:
    adversaryIndex += 1 ; #DEBUG_LINE_NO:359
  EndWhile ; #DEBUG_LINE_NO:
  player.RemoveKeyword(LC165_StarbornAdversaryInaccessibleKeyword) ; #DEBUG_LINE_NO:361
  updateAdversaryInProgress = False ; #DEBUG_LINE_NO:362
EndFunction

ObjectReference Function GetShiftEnableParentMarker(String Name)
  Int index = ShiftData.findstruct("Name", Name, 0) ; #DEBUG_LINE_NO:366
  If index < 0 ; #DEBUG_LINE_NO:367
    Return None ; #DEBUG_LINE_NO:369
  Else ; #DEBUG_LINE_NO:
    ReferenceAlias enableParentAlias = ShiftData[index].EnableParent ; #DEBUG_LINE_NO:371
    If enableParentAlias == None ; #DEBUG_LINE_NO:372
      Return None ; #DEBUG_LINE_NO:373
    Else ; #DEBUG_LINE_NO:
      Return ShiftData[index].EnableParent.GetRef() ; #DEBUG_LINE_NO:375
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ShutdownShifting()
  If inputLayer != None ; #DEBUG_LINE_NO:381
    inputLayer.Delete() ; #DEBUG_LINE_NO:382
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function WaitForAdversaryUpdateToFinish()
  Int failsafe = 0 ; #DEBUG_LINE_NO:388
  While updateAdversaryInProgress && failsafe < CONST_WaitForAdversaryUpdateFailsafe ; #DEBUG_LINE_NO:389
    Utility.Wait(0.25) ; #DEBUG_LINE_NO:390
    failsafe += 1 ; #DEBUG_LINE_NO:391
  EndWhile ; #DEBUG_LINE_NO:
  If updateAdversaryInProgress ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdateObjectivesWhenEnteringDistortion(Int DistortionID)
  If DistortionID == CONST_DistortionID_EnterVectera ; #DEBUG_LINE_NO:400
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:401
    Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:402
  ElseIf DistortionID == CONST_DistortionID_LeaveVectera ; #DEBUG_LINE_NO:403
    Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:404
    Self.SetObjectiveCompleted(100, False) ; #DEBUG_LINE_NO:405
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:406
  ElseIf DistortionID == CONST_DistortionID_EnterScow ; #DEBUG_LINE_NO:407
    Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:408
    If !Self.GetStageDone(CONST_Stage_FoundWayOutOfScowDistortion) ; #DEBUG_LINE_NO:409
      Self.SetObjectiveDisplayed(145, True, False) ; #DEBUG_LINE_NO:410
    Else ; #DEBUG_LINE_NO:
      Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:412
    EndIf ; #DEBUG_LINE_NO:
  ElseIf DistortionID == CONST_DistortionID_LeaveScow ; #DEBUG_LINE_NO:414
    Self.SetObjectiveDisplayed(145, False, False) ; #DEBUG_LINE_NO:415
    Self.SetObjectiveDisplayed(150, False, False) ; #DEBUG_LINE_NO:416
    Self.SetObjectiveCompleted(140, False) ; #DEBUG_LINE_NO:417
    Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:418
  EndIf ; #DEBUG_LINE_NO:
EndFunction
