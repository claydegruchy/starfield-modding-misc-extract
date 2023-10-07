ScriptName ExpandingBiomassScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference[] actorsInAwarenessVolumes
ObjectReference[] awarenessVolumes
Int detectedActorCount = 0
Bool hasAwarenessVolumes = False
Int hitCount = 0
Float maxScale
Float minScale
Float restingScale
Float scaleReductionPerHit = 0.100000001
Bool shouldDamageContract = False
Bool shouldExpandToMax = False
Bool shouldReturnToRest = False
Float waitAfterDamageSeconds = 0.25
Float waitSeconds = 0.01

;-- Properties --------------------------------------
Float Property initialScaleMultiplier = 1.0 Auto Const
Float Property minScaleMultiplier = 0.5 Auto Const
Float Property maxScaleMultiplier = 2.0 Auto Const
Float Property expandingSpeed = 0.01 Auto Const
Float Property contractingSpeed = 0.01 Auto Const
Float Property damageContractingSpeed = 0.050000001 Auto Const
Float Property detectionDistance = 15.0 Auto Const
Keyword Property RL039_AwarenessVolume Auto Const
Keyword Property RL039_BlobTarget Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:32
  Self.RegisterForCustomEvent(Self as ScriptObject, "expandingbiomassscript_ContractBlobEvent") ; #DEBUG_LINE_NO:33
  restingScale = Self.GetScale() ; #DEBUG_LINE_NO:36
  minScale = restingScale * minScaleMultiplier ; #DEBUG_LINE_NO:37
  maxScale = restingScale * maxScaleMultiplier ; #DEBUG_LINE_NO:38
  Self.SetScale(restingScale * initialScaleMultiplier) ; #DEBUG_LINE_NO:40
  awarenessVolumes = Self.GetRefsLinkedToMe(RL039_AwarenessVolume, None) ; #DEBUG_LINE_NO:43
  If awarenessVolumes.Length > 0 ; #DEBUG_LINE_NO:44
    hasAwarenessVolumes = True ; #DEBUG_LINE_NO:45
    actorsInAwarenessVolumes = new ObjectReference[0] ; #DEBUG_LINE_NO:47
    Int I = 0 ; #DEBUG_LINE_NO:49
    While I < awarenessVolumes.Length ; #DEBUG_LINE_NO:50
      ObjectReference awarenessVolume = awarenessVolumes[I] ; #DEBUG_LINE_NO:51
      Self.RegisterForRemoteEvent(awarenessVolume as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:53
      Self.RegisterForRemoteEvent(awarenessVolume as ScriptObject, "OnTriggerLeave") ; #DEBUG_LINE_NO:54
      I += 1 ; #DEBUG_LINE_NO:56
    EndWhile ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForDistanceLessThanEvent(Game.GetPlayer() as ScriptObject, Self as ScriptObject, detectionDistance, 0) ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] initialBlobTargets = Self.GetRefsLinkedToMe(RL039_BlobTarget, None) ; #DEBUG_LINE_NO:63
  If initialBlobTargets.Length > 0 ; #DEBUG_LINE_NO:64
    Int i = 0 ; #DEBUG_LINE_NO:65
    While i < initialBlobTargets.Length ; #DEBUG_LINE_NO:66
      ObjectReference initialBlobTarget = initialBlobTargets[i] ; #DEBUG_LINE_NO:67
      Float distance = Self.GetDistance(initialBlobTarget) ; #DEBUG_LINE_NO:68
      If distance < detectionDistance ; #DEBUG_LINE_NO:70
        Self.RegisterForDistanceGreaterThanEvent(initialBlobTarget as ScriptObject, Self as ScriptObject, detectionDistance, 0) ; #DEBUG_LINE_NO:71
        detectedActorCount += 1 ; #DEBUG_LINE_NO:72
      Else ; #DEBUG_LINE_NO:
        Self.RegisterForDistanceLessThanEvent(initialBlobTarget as ScriptObject, Self as ScriptObject, detectionDistance, 0) ; #DEBUG_LINE_NO:74
      EndIf ; #DEBUG_LINE_NO:
      i += 1 ; #DEBUG_LINE_NO:77
    EndWhile ; #DEBUG_LINE_NO:
    If detectedActorCount > 0 ; #DEBUG_LINE_NO:80
      shouldReturnToRest = False ; #DEBUG_LINE_NO:81
      Self.ExpandBlob() ; #DEBUG_LINE_NO:82
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
  If akActionRef is Actor ; #DEBUG_LINE_NO:88
    Int index = actorsInAwarenessVolumes.find(akActionRef, 0) ; #DEBUG_LINE_NO:89
    If index < 0 ; #DEBUG_LINE_NO:91
      actorsInAwarenessVolumes.add(akActionRef, 1) ; #DEBUG_LINE_NO:92
      Float distance = Self.GetDistance(akActionRef) ; #DEBUG_LINE_NO:94
      If distance < detectionDistance ; #DEBUG_LINE_NO:96
        Self.DetectActor(akActionRef) ; #DEBUG_LINE_NO:97
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akActionRef)
  If akActionRef is Actor ; #DEBUG_LINE_NO:104
    Int index = actorsInAwarenessVolumes.find(akActionRef, 0) ; #DEBUG_LINE_NO:105
    If index >= 0 ; #DEBUG_LINE_NO:107
      actorsInAwarenessVolumes.remove(index, 1) ; #DEBUG_LINE_NO:108
      Self.UndetectActor(akActionRef, False) ; #DEBUG_LINE_NO:110
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.DetectActor(akObj1) ; #DEBUG_LINE_NO:116
EndEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.UndetectActor(akObj1, True) ; #DEBUG_LINE_NO:120
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:124
  Self.TakeHits(1) ; #DEBUG_LINE_NO:126
EndEvent

Function TakeHits(Int count)
  hitCount += count ; #DEBUG_LINE_NO:130
  If !shouldDamageContract ; #DEBUG_LINE_NO:132
    Self.SendCustomEvent("expandingbiomassscript_ContractBlobEvent", None) ; #DEBUG_LINE_NO:133
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ExpandingBiomassScript.ContractBlobEvent(ExpandingBiomassScript akSender, Var[] akArgs)
  Self.ContractBlobOnDamage() ; #DEBUG_LINE_NO:138
EndEvent

Function DetectActor(ObjectReference akActor)
  Self.RegisterForDistanceGreaterThanEvent(akActor as ScriptObject, Self as ScriptObject, detectionDistance, 0) ; #DEBUG_LINE_NO:142
  detectedActorCount += 1 ; #DEBUG_LINE_NO:144
  If detectedActorCount == 1 ; #DEBUG_LINE_NO:146
    shouldReturnToRest = False ; #DEBUG_LINE_NO:147
    Self.ExpandBlob() ; #DEBUG_LINE_NO:148
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UndetectActor(ObjectReference akActor, Bool registerForDistanceEvents)
  If registerForDistanceEvents ; #DEBUG_LINE_NO:154
    Self.RegisterForDistanceLessThanEvent(akActor as ScriptObject, Self as ScriptObject, detectionDistance, 0) ; #DEBUG_LINE_NO:155
  Else ; #DEBUG_LINE_NO:
    Self.UnregisterForDistanceEvents(akActor as ScriptObject, Self as ScriptObject, -1) ; #DEBUG_LINE_NO:157
  EndIf ; #DEBUG_LINE_NO:
  detectedActorCount -= 1 ; #DEBUG_LINE_NO:160
  If detectedActorCount < 0 ; #DEBUG_LINE_NO:162
    detectedActorCount == 0 ; #DEBUG_LINE_NO:163
  EndIf ; #DEBUG_LINE_NO:
  If detectedActorCount == 0 ; #DEBUG_LINE_NO:166
    shouldExpandToMax = False ; #DEBUG_LINE_NO:167
    Self.ReturnToRest() ; #DEBUG_LINE_NO:168
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsReferenceInAwarenessVolumes(ObjectReference reference)
  Int I = 0 ; #DEBUG_LINE_NO:173
  While I < awarenessVolumes.Length ; #DEBUG_LINE_NO:174
    ObjectReference awarenessVolume = awarenessVolumes[I] ; #DEBUG_LINE_NO:175
    If awarenessVolume.IsInTrigger(reference) ; #DEBUG_LINE_NO:177
      Return True ; #DEBUG_LINE_NO:178
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:181
  EndWhile ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:184
EndFunction

Function ExpandBlob()
  shouldExpandToMax = True ; #DEBUG_LINE_NO:188
  While shouldExpandToMax && !shouldDamageContract ; #DEBUG_LINE_NO:190
    Float currentScale = Self.GetScale() ; #DEBUG_LINE_NO:191
    Float nextScale = currentScale + expandingSpeed ; #DEBUG_LINE_NO:192
    Bool expansionComplete = False ; #DEBUG_LINE_NO:193
    If nextScale > maxScale ; #DEBUG_LINE_NO:195
      nextScale = maxScale ; #DEBUG_LINE_NO:196
      expansionComplete = True ; #DEBUG_LINE_NO:197
    EndIf ; #DEBUG_LINE_NO:
    Self.SetScale(nextScale) ; #DEBUG_LINE_NO:200
    If expansionComplete ; #DEBUG_LINE_NO:202
      shouldExpandToMax = False ; #DEBUG_LINE_NO:203
    Else ; #DEBUG_LINE_NO:
      Utility.Wait(waitSeconds) ; #DEBUG_LINE_NO:205
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ReturnToRest()
  shouldReturnToRest = True ; #DEBUG_LINE_NO:211
  Float currentScale = Self.GetScale() ; #DEBUG_LINE_NO:213
  Float speed = expandingSpeed ; #DEBUG_LINE_NO:215
  Int direction = 1 ; #DEBUG_LINE_NO:216
  If currentScale > restingScale ; #DEBUG_LINE_NO:218
    speed = -contractingSpeed ; #DEBUG_LINE_NO:219
    direction = -1 ; #DEBUG_LINE_NO:220
  EndIf ; #DEBUG_LINE_NO:
  While shouldReturnToRest && !shouldDamageContract ; #DEBUG_LINE_NO:223
    currentScale = Self.GetScale() ; #DEBUG_LINE_NO:224
    Float nextScale = currentScale + speed ; #DEBUG_LINE_NO:225
    Bool returnComplete = False ; #DEBUG_LINE_NO:226
    If direction == 1 ; #DEBUG_LINE_NO:228
      If nextScale > restingScale ; #DEBUG_LINE_NO:229
        nextScale = restingScale ; #DEBUG_LINE_NO:230
        returnComplete = True ; #DEBUG_LINE_NO:231
      EndIf ; #DEBUG_LINE_NO:
    ElseIf direction == -1 ; #DEBUG_LINE_NO:233
      If nextScale < restingScale ; #DEBUG_LINE_NO:234
        nextScale = restingScale ; #DEBUG_LINE_NO:235
        returnComplete = True ; #DEBUG_LINE_NO:236
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.SetScale(nextScale) ; #DEBUG_LINE_NO:240
    If returnComplete ; #DEBUG_LINE_NO:242
      shouldReturnToRest = False ; #DEBUG_LINE_NO:243
    Else ; #DEBUG_LINE_NO:
      Utility.Wait(waitSeconds) ; #DEBUG_LINE_NO:245
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function ContractBlobOnDamage()
  shouldDamageContract = True ; #DEBUG_LINE_NO:251
  Bool minScaleReached = False ; #DEBUG_LINE_NO:252
  While hitCount > 0 && !minScaleReached ; #DEBUG_LINE_NO:254
    Float currentScale = Self.GetScale() ; #DEBUG_LINE_NO:255
    Float targetScale = Math.Clamp(currentScale - scaleReductionPerHit, minScale, currentScale) ; #DEBUG_LINE_NO:256
    Bool hitContractionComplete = False ; #DEBUG_LINE_NO:257
    While !hitContractionComplete ; #DEBUG_LINE_NO:259
      currentScale = Self.GetScale() ; #DEBUG_LINE_NO:260
      Float nextScale = Math.Clamp(currentScale - damageContractingSpeed, minScale, currentScale) ; #DEBUG_LINE_NO:261
      If nextScale == minScale ; #DEBUG_LINE_NO:263
        hitContractionComplete = True ; #DEBUG_LINE_NO:264
        minScaleReached = True ; #DEBUG_LINE_NO:265
      ElseIf nextScale == targetScale ; #DEBUG_LINE_NO:266
        hitContractionComplete = True ; #DEBUG_LINE_NO:267
      EndIf ; #DEBUG_LINE_NO:
      Self.SetScale(nextScale) ; #DEBUG_LINE_NO:270
      If hitContractionComplete ; #DEBUG_LINE_NO:272
        hitCount -= 1 ; #DEBUG_LINE_NO:273
      Else ; #DEBUG_LINE_NO:
        Utility.Wait(waitSeconds) ; #DEBUG_LINE_NO:275
      EndIf ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(waitAfterDamageSeconds) ; #DEBUG_LINE_NO:280
  shouldDamageContract = False ; #DEBUG_LINE_NO:282
  If detectedActorCount > 0 ; #DEBUG_LINE_NO:284
    Self.ExpandBlob() ; #DEBUG_LINE_NO:285
  ElseIf Self.GetScale() != restingScale ; #DEBUG_LINE_NO:286
    Self.ReturnToRest() ; #DEBUG_LINE_NO:287
  EndIf ; #DEBUG_LINE_NO:
EndFunction
