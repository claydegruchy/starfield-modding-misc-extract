ScriptName ScriptObject Native hidden

;-- Functions ---------------------------------------

Function AddInventoryEventFilter(Form akFilter) Native

Var Function CallFunction(String asFuncName, Var[] aParams) Native

Function CallFunctionNoWait(String asFuncName, Var[] aParams) Native

Function CancelTimer(Int aiTimerID) Native

Function CancelTimerGameTime(Int aiTimerID) Native

ScriptObject Function CastAs(String asScriptName) Native

Var Function GetPropertyValue(String asPropertyName) Native

Bool Function IsBoundGameObjectAvailable() Native

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnActorValueGreaterThan(ObjectReference akObjRef, ActorValue akActorValue)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAffinityEventSent(affinityevent akAffinityEvent, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAnimationEventUnregistered(ObjectReference akSource, String asEventName)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnBeginState(String asOldState)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnChallengeCompleted(ObjectReference akOwner, challenge akChallenge)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEndState(String asNewState)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnInit()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlanetSiteSelectEvent(Location aSite)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime, ObjectReference akBed)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerSleepStop(Bool abInterrupted, ObjectReference akBed)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerTeleport()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerWaitStart(Float afWaitStartTime, Float afDesiredWaitEndTime)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerWaitStop(Bool abInterrupted)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnRadiationDamage(ObjectReference akTarget, Bool abIngested)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnStarmapTargetSelectEvent(Location aSite)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTrackedStatsEvent(String arStatName, Int aiStatValue)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTutorialEvent(String asEventName, Message aMessage)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function PauseTimer(Int aiTimerID, Bool abPause) Native

Function PauseTimerGameTime(Int aiTimerID, Bool abPause) Native

Function RegisterForActorValueChangedEvent(ObjectReference akObjRef, ActorValue akActorValue) Native

Function RegisterForActorValueGreaterThanEvent(ObjectReference akObjRef, ActorValue akActorValue, Float afCompareValue) Native

Function RegisterForActorValueLessThanEvent(ObjectReference akObjRef, ActorValue akActorValue, Float afCompareValue) Native

Function RegisterForAffinityEvent(affinityevent akAffinityEvent) Native

Bool Function RegisterForAnimationEvent(ObjectReference akSender, String asEventName) Native

Function RegisterForChallengeEvents() Native

Function RegisterForCustomEvent(ScriptObject akSender, String asEventName) Native

Function RegisterForDetectionLOSGain(Actor akViewer, ObjectReference akTarget) Native

Function RegisterForDetectionLOSLost(Actor akViewer, ObjectReference akTarget) Native

Function RegisterForDirectLOSGain(ObjectReference akViewer, ObjectReference akTarget, String asViewerNode, String asTargetNode) Native

Function RegisterForDirectLOSLost(ObjectReference akViewer, ObjectReference akTarget, String asViewerNode, String asTargetNode) Native

Function RegisterForDistanceGreaterThanEvent(ScriptObject akObj1, ScriptObject akObj2, Float afDistance, Int aiEventID) Native

Function RegisterForDistanceLessThanEvent(ScriptObject akObj1, ScriptObject akObj2, Float afDistance, Int aiEventID) Native

Function RegisterForHitEvent(ScriptObject akTarget, ScriptObject akAggressorFilter, Form akSourceFilter, Form akProjectileFilter, Int aiPowerFilter, Int aiSneakFilter, Int aiBashFilter, Int aiBlockFilter, Bool abMatch) Native

Function RegisterForMagicEffectApplyEvent(ScriptObject akTarget, ScriptObject akCasterFilter, Form akEffectFilter, Bool abMatch) Native

Function RegisterForMenuOpenCloseEvent(String asMenuName) Native

Function RegisterForPlanetSiteSelectEvent() Native

Function RegisterForPlayerSleep() Native

Function RegisterForPlayerTeleport() Native

Function RegisterForPlayerWait() Native

Function RegisterForRadiationDamageEvent(ScriptObject akTarget) Native

Bool Function RegisterForRemoteEvent(ScriptObject akEventSource, String asEventName) Native

Function RegisterForStarmapTargetSelectEvent() Native

Function RegisterForTrackedStatsEvent(String asStat, Int aiThreshold) Native

Function RegisterForTutorialEvent(String asEventName) Native

Function RemoveAllInventoryEventFilters() Native

Function RemoveInventoryEventFilter(Form akFilter) Native

Function SendCustomEvent(String asEvent, Var[] akArgs) Native

Function SetPropertyValue(String asPropertyName, Var aValue) Native

Function SetPropertyValueNoWait(String asPropertyName, Var aValue) Native

Function StartTimer(Float afInterval, Int aiTimerID) Native

Function StartTimerGameTime(Float afInterval, Int aiTimerID) Native

Function UnregisterForActorValueChangedEvent(ObjectReference akObjRef, ActorValue akActorValue) Native

Function UnregisterForActorValueGreaterThanEvent(ObjectReference akObjRef, ActorValue akActorValue, Float afCompareValue) Native

Function UnregisterForActorValueLessThanEvent(ObjectReference akObjRef, ActorValue akActorValue, Float afCompareValue) Native

Function UnregisterForAffinityEvent(affinityevent akAffinityEvent) Native

Function UnregisterForAllActorValueEvents() Native

Function UnregisterForAllAffinityEvents() Native

Function UnregisterForAllCustomEvents() Native

Function UnregisterForAllEvents() Native

Function UnregisterForAllHitEvents(ScriptObject akTarget) Native

Function UnregisterForAllMagicEffectApplyEvents(ScriptObject akTarget) Native

Function UnregisterForAllMenuOpenCloseEvents() Native

Function UnregisterForAllRadiationDamageEvents() Native

Function UnregisterForAllRemoteEvents() Native

Function UnregisterForAllTrackedStatsEvents() Native

Function UnregisterForAnimationEvent(ObjectReference akSender, String asEventName) Native

Function UnregisterForChallengeEvents() Native

Function UnregisterForCustomEvent(ScriptObject akSender, String asEventName) Native

Function UnregisterForDistanceEvents(ScriptObject akObj1, ScriptObject akObj2, Int aiEventID) Native

Function UnregisterForHitEvent(ScriptObject akTarget, ScriptObject akAggressorFilter, Form akSourceFilter, Form akProjectileFilter, Int aiPowerFilter, Int aiSneakFilter, Int aiBashFilter, Int aiBlockFilter, Bool abMatch) Native

Function UnregisterForLOS(ObjectReference akViewer, ObjectReference akTarget) Native

Function UnregisterForMagicEffectApplyEvent(ScriptObject akTarget, ScriptObject akCasterFilter, Form akEffectFilter, Bool abMatch) Native

Function UnregisterForMenuOpenCloseEvent(String asMenuName) Native

Function UnregisterForPlanetSiteSelectEvent() Native

Function UnregisterForPlayerSleep() Native

Function UnregisterForPlayerTeleport() Native

Function UnregisterForPlayerWait() Native

Function UnregisterForRadiationDamageEvent(ScriptObject akTarget) Native

Function UnregisterForRemoteEvent(ScriptObject akEventSource, String asEventName) Native

Function UnregisterForStarmapTargetSelectEvent() Native

Function UnregisterForTrackedStatsEvent(String asStat) Native

Function UnregisterForTrackedStatsEventThreshold(String asStat, Int aiThreshold) Native

Function UnregisterForTutorialEvent(String asEventName) Native

; Fixup hacks for native ScriptObject::GotoState/GetState
String Function GetState()
  Return __state ; #DEBUG_LINE_NO:34
EndFunction

; Fixup hacks for native ScriptObject::GotoState/GetState
Function GotoState(String asNewState)
  String soldState = __state ; #DEBUG_LINE_NO:39
  Self.OnEndState(asNewState) ; #DEBUG_LINE_NO:40
  __state = asNewState ; #DEBUG_LINE_NO:41
  Self.OnBeginState(soldState) ; #DEBUG_LINE_NO:42
EndFunction

Function RegisterForHitEventAggressorRefArray(ScriptObject akTarget, ObjectReference[] akAggressorFilterRefArray, Form akSourceFilter, Form akProjectileFilter, Int aiPowerFilter, Int aiSneakFilter, Int aiBashFilter, Int aiBlockFilter, Bool abMatch)
  Int I = 0 ; #DEBUG_LINE_NO:135
  While I < akAggressorFilterRefArray.Length ; #DEBUG_LINE_NO:136
    Self.RegisterForHitEvent(akTarget, akAggressorFilterRefArray[I] as ScriptObject, akSourceFilter, akProjectileFilter, aiPowerFilter, aiSneakFilter, aiBashFilter, aiBlockFilter, abMatch) ; #DEBUG_LINE_NO:137
    I += 1 ; #DEBUG_LINE_NO:138
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RegisterForHitEventAggressorRefAliasArray(ScriptObject akTarget, ReferenceAlias[] akAggressorFilterRefAliasArray, Form akSourceFilter, Form akProjectileFilter, Int aiPowerFilter, Int aiSneakFilter, Int aiBashFilter, Int aiBlockFilter, Bool abMatch)
  Int I = 0 ; #DEBUG_LINE_NO:145
  While I < akAggressorFilterRefAliasArray.Length ; #DEBUG_LINE_NO:146
    Self.RegisterForHitEvent(akTarget, akAggressorFilterRefAliasArray[I] as ScriptObject, akSourceFilter, akProjectileFilter, aiPowerFilter, aiSneakFilter, aiBashFilter, aiBlockFilter, abMatch) ; #DEBUG_LINE_NO:147
    I += 1 ; #DEBUG_LINE_NO:148
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RegisterForHitEventAggressorFactionArray(ScriptObject akTarget, Faction[] akAggressorFilterFactionArray, Form akSourceFilter, Form akProjectileFilter, Int aiPowerFilter, Int aiSneakFilter, Int aiBashFilter, Int aiBlockFilter, Bool abMatch)
  Int I = 0 ; #DEBUG_LINE_NO:155
  While I < akAggressorFilterFactionArray.Length ; #DEBUG_LINE_NO:156
    Self.RegisterForHitEvent(akTarget, akAggressorFilterFactionArray[I] as ScriptObject, akSourceFilter, akProjectileFilter, aiPowerFilter, aiSneakFilter, aiBashFilter, aiBlockFilter, abMatch) ; #DEBUG_LINE_NO:157
    I += 1 ; #DEBUG_LINE_NO:158
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
