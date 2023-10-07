ScriptName MQ207CShiftingQuestScript Extends Quest
{ Quest script for MQ207C, Entangled. }

;-- Variables ---------------------------------------
Int CONST_DistanceFromDistortionToForceFallback = 8 Const
Int CONST_EmergencyShutdownStage = 720 Const
Int NishinaIIx
Int NishinaIx
ObjectReference[] distortionRefs
Actor player
mq207cquestscript selfAsQuestScript
ObjectReference shiftingActivatorRef
ObjectReference[] shiftingTriggerRefs

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ShiftingGuard

;-- Properties --------------------------------------
Group ShiftingSystemProperties
  ReferenceAlias Property NishinaIOriginMarker Auto Const mandatory
  { A marker representing the position of Nishina I, set below the minimum X coordinate for Nishina I. Used to calculate the position offset to Nishina II, and to determine which Nishina the player is in. }
  ReferenceAlias Property NishinaIIOriginMarker Auto Const mandatory
  { A marker representing the position of Nishina II, set below the minimum X coordinate for Nishina II. Used to calculate the position offset to Nishina I, and to determine which Nishina the player is in. }
  ReferenceAlias Property ShiftingActivator Auto Const mandatory
  { Activator that handles the shifting imagespace animation. }
  Scene[] Property ScenesToStopOnShift Auto Const
  { List of scenes to force-stop when the player shifts. }
EndGroup

Group AutofillProperties
  RefCollectionAlias Property ShiftingTriggers Auto Const mandatory
  RefCollectionAlias Property Distortions01 Auto Const mandatory
  RefCollectionAlias Property Distortions02 Auto Const mandatory
  RefCollectionAlias Property Nishina01_CreaturesAll_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_SecurityCameras_I Auto Const mandatory
  RefCollectionAlias Property Nishina02_CreaturesAll_II Auto Const mandatory
  RefCollectionAlias Property Nishina02_RobotsAndTurrets_All_I Auto Const mandatory
  Cell Property LC116Nishina01 Auto Const mandatory
  wwiseevent Property WwiseEvent_QSTMQ207C_ShiftToA Auto Const mandatory
  wwiseevent Property WwiseEvent_QSTMQ207C_ShiftToB Auto Const mandatory
  Keyword Property MQ207CLinkTarget Auto Const mandatory
  Static Property XMarker Auto Const mandatory
EndGroup

Int Property NishinaOffset Auto hidden

;-- Functions ---------------------------------------

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestInit()
  selfAsQuestScript = (Self as Quest) as mq207cquestscript ; #DEBUG_LINE_NO:63
  player = Game.GetPlayer() ; #DEBUG_LINE_NO:64
  NishinaIx = NishinaIOriginMarker.GetRef().GetPositionX() as Int ; #DEBUG_LINE_NO:65
  NishinaIIx = NishinaIIOriginMarker.GetRef().GetPositionX() as Int ; #DEBUG_LINE_NO:66
  NishinaOffset = NishinaIIx - NishinaIx ; #DEBUG_LINE_NO:67
  shiftingActivatorRef = ShiftingActivator.GetRef() ; #DEBUG_LINE_NO:69
  shiftingTriggerRefs = ShiftingTriggers.GetArray() ; #DEBUG_LINE_NO:71
  Int I = 0 ; #DEBUG_LINE_NO:72
  While I < shiftingTriggerRefs.Length ; #DEBUG_LINE_NO:73
    Self.RegisterForRemoteEvent(shiftingTriggerRefs[I] as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:74
    I += 1 ; #DEBUG_LINE_NO:75
  EndWhile ; #DEBUG_LINE_NO:
  distortionRefs = Distortions01.GetArray() ; #DEBUG_LINE_NO:78
  ObjectReference[] distortionRefs2 = Distortions02.GetArray() ; #DEBUG_LINE_NO:79
  I = 0 ; #DEBUG_LINE_NO:80
  While I < distortionRefs2.Length ; #DEBUG_LINE_NO:81
    distortionRefs.add(distortionRefs2[I], 1) ; #DEBUG_LINE_NO:82
    I += 1 ; #DEBUG_LINE_NO:83
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:85
  While I < distortionRefs.Length ; #DEBUG_LINE_NO:86
    distortionRefs[I].BlockActivation(True, True) ; #DEBUG_LINE_NO:87
    distortionRefs[I].DisableNoWait(False) ; #DEBUG_LINE_NO:88
    I += 1 ; #DEBUG_LINE_NO:89
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Bool Function ShouldPerformShift(ObjectReference akSource, mq207cshiftingobjectscript shiftingObject)
  If akSource != player as ObjectReference ; #DEBUG_LINE_NO:137
    Return False ; #DEBUG_LINE_NO:138
  ElseIf shiftingObject.PrereqStage >= 0 && !Self.GetStageDone(shiftingObject.PrereqStage) ; #DEBUG_LINE_NO:139
    Return False ; #DEBUG_LINE_NO:140
  ElseIf shiftingObject.TurnOffStage >= 0 && Self.GetStage() > shiftingObject.TurnOffStage ; #DEBUG_LINE_NO:141
    Return False ; #DEBUG_LINE_NO:142
  ElseIf Self.GetStageDone(CONST_EmergencyShutdownStage) ; #DEBUG_LINE_NO:143
    Return False ; #DEBUG_LINE_NO:144
  Else ; #DEBUG_LINE_NO:
    Return True ; #DEBUG_LINE_NO:146
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Shift(mq207cshiftingobjectscript shiftingObject, Bool shiftingObjectIsTrigger, Bool shouldForceFallback, Int additionalStageToSet, ObjectReference shiftToMarker)
  Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:153
    Self.Private_Shift(shiftingObject, shiftingObjectIsTrigger, shouldForceFallback, additionalStageToSet, shiftToMarker, False, False) ; #DEBUG_LINE_NO:154
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function ShiftNoFX(mq207cshiftingobjectscript shiftingObject, Bool shiftingObjectIsTrigger, Bool shouldForceFallback, Int additionalStageToSet, ObjectReference shiftToMarker)
  Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:159
    Self.Private_Shift(shiftingObject, shiftingObjectIsTrigger, shouldForceFallback, additionalStageToSet, shiftToMarker, True, True) ; #DEBUG_LINE_NO:160
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function Private_Shift(mq207cshiftingobjectscript shiftingObject, Bool shiftingObjectIsTrigger, Bool shouldForceFallback, Int additionalStageToSet, ObjectReference shiftToMarker, Bool useCollisionCheck, Bool omitFX)
  Int currentUniverse = Self.GetCurrentUniverse() ; #DEBUG_LINE_NO:167
  Int newUniverse = 0 ; #DEBUG_LINE_NO:168
  If currentUniverse == 1 ; #DEBUG_LINE_NO:169
    newUniverse = 2 ; #DEBUG_LINE_NO:170
  Else ; #DEBUG_LINE_NO:
    newUniverse = 1 ; #DEBUG_LINE_NO:172
  EndIf ; #DEBUG_LINE_NO:
  If !omitFX ; #DEBUG_LINE_NO:176
    If currentUniverse == 1 ; #DEBUG_LINE_NO:177
      WwiseEvent_QSTMQ207C_ShiftToB.Play(player as ObjectReference, None, None) ; #DEBUG_LINE_NO:178
    Else ; #DEBUG_LINE_NO:
      WwiseEvent_QSTMQ207C_ShiftToA.Play(player as ObjectReference, None, None) ; #DEBUG_LINE_NO:180
    EndIf ; #DEBUG_LINE_NO:
    If shiftingObjectIsTrigger || shiftingObject == None ; #DEBUG_LINE_NO:183
      shiftingActivatorRef.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:184
    Else ; #DEBUG_LINE_NO:
      shiftingActivatorRef.MoveTo(shiftingObject as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:186
    EndIf ; #DEBUG_LINE_NO:
    shiftingActivatorRef.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:188
  EndIf ; #DEBUG_LINE_NO:
  Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:192
  akArgs[0] = newUniverse as Var ; #DEBUG_LINE_NO:193
  Self.CallFunctionNoWait("StopCombatOnShift", akArgs) ; #DEBUG_LINE_NO:194
  Int offset = 0 ; #DEBUG_LINE_NO:197
  If currentUniverse == 1 ; #DEBUG_LINE_NO:198
    offset = NishinaOffset ; #DEBUG_LINE_NO:199
  Else ; #DEBUG_LINE_NO:
    offset = -NishinaOffset ; #DEBUG_LINE_NO:201
  EndIf ; #DEBUG_LINE_NO:
  If shiftingObject != None ; #DEBUG_LINE_NO:207
    If shiftingObject.shouldForceFallback ; #DEBUG_LINE_NO:208
      shouldForceFallback = True ; #DEBUG_LINE_NO:209
      shiftToMarker = shiftingObject.GetLinkedRef(MQ207CLinkTarget) ; #DEBUG_LINE_NO:210
    ElseIf shiftingObjectIsTrigger && !shiftingObject.IsInTrigger(player as ObjectReference) ; #DEBUG_LINE_NO:211
      shouldForceFallback = True ; #DEBUG_LINE_NO:212
    ElseIf !shiftingObjectIsTrigger && (player.GetDistance(shiftingObject as ObjectReference) > CONST_DistanceFromDistortionToForceFallback as Float) ; #DEBUG_LINE_NO:213
      shouldForceFallback = True ; #DEBUG_LINE_NO:214
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If shiftToMarker != None ; #DEBUG_LINE_NO:219
    Game.PopPlayerTo(shiftToMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:221
  ElseIf shouldForceFallback ; #DEBUG_LINE_NO:
    Self.PerformFallbackShift(shiftingObject as ObjectReference, offset) ; #DEBUG_LINE_NO:223
  ElseIf omitFX ; #DEBUG_LINE_NO:
    Game.PopPlayerTo(player as ObjectReference, offset as Float, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:225
  Else ; #DEBUG_LINE_NO:
    Bool popSuccessful = Game.PopPlayerTo(player as ObjectReference, offset as Float, 0.0, 0.0, True, useCollisionCheck) ; #DEBUG_LINE_NO:227
    If !popSuccessful ; #DEBUG_LINE_NO:228
      Self.PerformFallbackShift(shiftingObject as ObjectReference, offset) ; #DEBUG_LINE_NO:229
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:234
  While I < ScenesToStopOnShift.Length ; #DEBUG_LINE_NO:235
    ScenesToStopOnShift[I].Stop() ; #DEBUG_LINE_NO:236
    I += 1 ; #DEBUG_LINE_NO:237
  EndWhile ; #DEBUG_LINE_NO:
  If shiftingObject != None && shiftingObject.StageToSetOnShift > 0 ; #DEBUG_LINE_NO:241
    Self.SetStage(shiftingObject.StageToSetOnShift) ; #DEBUG_LINE_NO:242
  EndIf ; #DEBUG_LINE_NO:
  If additionalStageToSet > 0 ; #DEBUG_LINE_NO:246
    Self.SetStage(additionalStageToSet) ; #DEBUG_LINE_NO:247
  EndIf ; #DEBUG_LINE_NO:
  If shiftingObjectIsTrigger ; #DEBUG_LINE_NO:251
    selfAsQuestScript.UpdateGuidanceTriggerAV() ; #DEBUG_LINE_NO:252
  EndIf ; #DEBUG_LINE_NO:
  selfAsQuestScript.SilenceNishina02AlarmsNoWait() ; #DEBUG_LINE_NO:256
  selfAsQuestScript.Private_UpdateLabResearchLabStateOnShift(newUniverse) ; #DEBUG_LINE_NO:259
  If !omitFX ; #DEBUG_LINE_NO:262
    shiftingActivatorRef.PlayAnimation("Stop01") ; #DEBUG_LINE_NO:263
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PerformFallbackShift(ObjectReference shiftingObject, Int offset)
  If shiftingObject == None ; #DEBUG_LINE_NO:269
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    ObjectReference fallbackLink = shiftingObject.GetLinkedRef(MQ207CLinkTarget) ; #DEBUG_LINE_NO:272
    If fallbackLink != None ; #DEBUG_LINE_NO:273
      Game.PopPlayerTo(fallbackLink, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:274
    Else ; #DEBUG_LINE_NO:
      ObjectReference marker = shiftingObject.PlaceAtMe(XMarker as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:278
      marker.MoveTo(marker, offset as Float, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:279
      marker.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:280
      marker.SetAngle(0.0, 0.0, player.GetAngleZ()) ; #DEBUG_LINE_NO:281
      Game.PopPlayerTo(marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:282
      marker.Delete() ; #DEBUG_LINE_NO:284
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StopCombatOnShift(Int newUniverse)
  player.StopCombat() ; #DEBUG_LINE_NO:292
  If player.GetParentCell() == LC116Nishina01 ; #DEBUG_LINE_NO:293
    If newUniverse == 1 ; #DEBUG_LINE_NO:294
      Nishina01_CreaturesAll_II.StopCombat() ; #DEBUG_LINE_NO:295
    EndIf ; #DEBUG_LINE_NO:
  ElseIf newUniverse == 1 ; #DEBUG_LINE_NO:299
    Nishina02_CreaturesAll_II.StopCombat() ; #DEBUG_LINE_NO:300
  Else ; #DEBUG_LINE_NO:
    Nishina02_SecurityCameras_I.StopCombat() ; #DEBUG_LINE_NO:302
    Nishina02_RobotsAndTurrets_All_I.StopCombat() ; #DEBUG_LINE_NO:303
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlaySpecialEndingFadeOut()
  shiftingActivatorRef.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:314
  shiftingActivatorRef.PlayAnimationAndWait("Play01", "Done") ; #DEBUG_LINE_NO:315
  WwiseEvent_QSTMQ207C_ShiftToA.Play(player as ObjectReference, None, None) ; #DEBUG_LINE_NO:316
EndFunction

Function PlaySpecialEndingFadeIn()
  shiftingActivatorRef.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:320
  shiftingActivatorRef.PlayAnimation("Stop01") ; #DEBUG_LINE_NO:321
EndFunction

Function EnableShiftingTriggers(Bool shouldBeEnabled)
  Int I = 0 ; #DEBUG_LINE_NO:331
  While I < shiftingTriggerRefs.Length ; #DEBUG_LINE_NO:332
    If shouldBeEnabled ; #DEBUG_LINE_NO:333
      shiftingTriggerRefs[I].EnableNoWait(False) ; #DEBUG_LINE_NO:334
    Else ; #DEBUG_LINE_NO:
      shiftingTriggerRefs[I].DisableNoWait(False) ; #DEBUG_LINE_NO:336
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:338
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function EnableDistortions(Bool shouldBeEnabled)
  Int I = 0 ; #DEBUG_LINE_NO:344
  While I < distortionRefs.Length ; #DEBUG_LINE_NO:345
    If shouldBeEnabled ; #DEBUG_LINE_NO:346
      distortionRefs[I].EnableNoWait(False) ; #DEBUG_LINE_NO:348
    Else ; #DEBUG_LINE_NO:
      distortionRefs[I].DisableNoWait(False) ; #DEBUG_LINE_NO:351
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:353
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetDistortionsActivationBlocked(Bool shouldBeActivationBlocked)
  Int I = 0 ; #DEBUG_LINE_NO:359
  While I < distortionRefs.Length ; #DEBUG_LINE_NO:360
    distortionRefs[I].BlockActivation(shouldBeActivationBlocked, shouldBeActivationBlocked) ; #DEBUG_LINE_NO:361
    If shouldBeActivationBlocked ; #DEBUG_LINE_NO:362
      Self.UnregisterForRemoteEvent(distortionRefs[I] as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:363
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForRemoteEvent(distortionRefs[I] as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:365
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:367
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Int Function GetCurrentUniverse()
  If player.GetPositionX() < NishinaIIx as Float ; #DEBUG_LINE_NO:378
    Return 1 ; #DEBUG_LINE_NO:379
  Else ; #DEBUG_LINE_NO:
    Return 2 ; #DEBUG_LINE_NO:381
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ClearVariables()
  shiftingActivatorRef = None ; #DEBUG_LINE_NO:391
  shiftingTriggerRefs = None ; #DEBUG_LINE_NO:392
  distortionRefs = None ; #DEBUG_LINE_NO:393
EndFunction

;-- State -------------------------------------------
State ProcessingShift
EndState

;-- State -------------------------------------------
Auto State WaitingForShift

  Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
    Self.GoToState("ProcessingShift") ; #DEBUG_LINE_NO:
    Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:
      mq207cshiftingobjectscript shiftingObject = akSource as mq207cshiftingobjectscript ; #DEBUG_LINE_NO:
      If shiftingObject != None && distortionRefs.find(shiftingObject as ObjectReference, 0) >= 0 && Self.ShouldPerformShift(akActivator, shiftingObject) ; #DEBUG_LINE_NO:
        Self.Private_Shift(shiftingObject, False, False, -1, None, True, False) ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
    Self.GoToState("WaitingForShift") ; #DEBUG_LINE_NO:
  EndEvent

  Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akTriggerRef)
    Self.GoToState("ProcessingShift") ; #DEBUG_LINE_NO:101
    Guard ShiftingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:102
      mq207cshiftingobjectscript shiftingObject = akSource as mq207cshiftingobjectscript ; #DEBUG_LINE_NO:103
      If shiftingObject != None && shiftingTriggerRefs.find(shiftingObject as ObjectReference, 0) >= 0 && Self.ShouldPerformShift(akTriggerRef, shiftingObject) ; #DEBUG_LINE_NO:104
        Self.Private_Shift(shiftingObject, True, False, -1, None, True, False) ; #DEBUG_LINE_NO:105
      EndIf ; #DEBUG_LINE_NO:
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
    Self.GoToState("WaitingForShift") ; #DEBUG_LINE_NO:108
  EndEvent
EndState
