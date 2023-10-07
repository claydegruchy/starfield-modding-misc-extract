ScriptName HerdControlScript Extends ObjectReference
{ Handles an array of actors to act like a herd and flee to the same spot }

;-- Variables ---------------------------------------
Bool busy = False
ObjectReference currentFallback
ObjectReference currentFleeToMarker
Float fAggression = 2.0
Float fConfidence = 4.0
ObjectReference[] fleeToMarkers
ObjectReference fleeToMasterMarker
ObjectReference[] herdRefs
Bool needNewFallback = False
ObjectReference tempFleeToMarker
Float timer = 20.0
Int timerID = 0

;-- Properties --------------------------------------
Group Required_Properties
  Keyword Property HerdKeyword Auto mandatory
  { default: DMP_TypeHerd - will find all references with this keyword }
  Static Property HerdMarker Auto mandatory
  { default: xMarkerHerd - used to fill array of markers the fleeToMasterMarker can be moved to }
EndGroup

Group Optional_Properties
  Bool Property HaveFallback = False Auto
  { default:FALSE - set to true if you want an actor to stay behind and fight when rest flee }
  Float Property FindRadius = 100.0 Auto
  { default:100m - used as radius for finding all references to fill herdRefs array and fleeToMarkers array }
EndGroup

Group Autofill_Properties
  Keyword Property DMP_FleeTo Auto
  { Keyword to link to the marker the group flees to }
  ActorValue Property DMP_Herd Auto
  { used in actor's combat interrupt package }
  ActorValue Property Aggression Auto
  ActorValue Property Suspicious Auto
  ActorValue Property Confidence Auto
EndGroup


;-- Functions ---------------------------------------

Event OnReset()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  herdRefs = Self.FindAllReferencesWithKeyword(HerdKeyword as Form, FindRadius) ; #DEBUG_LINE_NO:63
  fleeToMarkers = Self.FindAllReferencesofType(HerdMarker as Form, FindRadius) ; #DEBUG_LINE_NO:64
  If fleeToMarkers.Length > 0 ; #DEBUG_LINE_NO:67
    currentFleeToMarker = herdRefs[0] ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
  If herdRefs.Length > 0 ; #DEBUG_LINE_NO:73
    fleeToMasterMarker = Self.GetLinkedRef(DMP_FleeTo) ; #DEBUG_LINE_NO:74
    Int I = 0 ; #DEBUG_LINE_NO:77
    While I < herdRefs.Length ; #DEBUG_LINE_NO:78
      If (herdRefs[I] as Actor).isDead() == False ; #DEBUG_LINE_NO:79
        If HaveFallback == True && currentFallback == None ; #DEBUG_LINE_NO:80
          currentFallback = herdRefs[I] ; #DEBUG_LINE_NO:81
        EndIf ; #DEBUG_LINE_NO:
        Self.RegisterForRemoteEvent((herdRefs[I] as Actor) as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:84
        I += 1 ; #DEBUG_LINE_NO:85
      EndIf ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState != 0 && busy == False ; #DEBUG_LINE_NO:101
    busy = True ; #DEBUG_LINE_NO:102
    Int I = 0 ; #DEBUG_LINE_NO:105
    While I < herdRefs.Length ; #DEBUG_LINE_NO:106
      Self.UnregisterForRemoteEvent((herdRefs[I] as Actor) as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:107
      I += 1 ; #DEBUG_LINE_NO:108
    EndWhile ; #DEBUG_LINE_NO:
    I = 0 ; #DEBUG_LINE_NO:112
    tempFleeToMarker = None ; #DEBUG_LINE_NO:113
    While I < fleeToMarkers.Length ; #DEBUG_LINE_NO:114
      If fleeToMarkers[I] != currentFleeToMarker ; #DEBUG_LINE_NO:115
        If tempFleeToMarker == None ; #DEBUG_LINE_NO:116
          tempFleeToMarker = fleeToMarkers[I] ; #DEBUG_LINE_NO:117
        ElseIf fleeToMarkers[I].getDistance(akTarget) > tempFleeToMarker.getDistance(akTarget) ; #DEBUG_LINE_NO:119
          tempFleeToMarker = fleeToMarkers[I] ; #DEBUG_LINE_NO:120
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:124
    EndWhile ; #DEBUG_LINE_NO:
    currentFleeToMarker = tempFleeToMarker ; #DEBUG_LINE_NO:127
    fleeToMasterMarker.moveto(currentFleeToMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:128
    If HaveFallback == True ; #DEBUG_LINE_NO:131
      If (currentFallback as Actor).isDead() == True ; #DEBUG_LINE_NO:132
        needNewFallback = True ; #DEBUG_LINE_NO:133
      Else ; #DEBUG_LINE_NO:
        (currentFallback as Actor).SetValue(Aggression, fAggression) ; #DEBUG_LINE_NO:135
        (currentFallback as Actor).SetValue(Confidence, fConfidence) ; #DEBUG_LINE_NO:136
        (currentFallback as Actor).startCombat((akTarget as Actor) as ObjectReference, False) ; #DEBUG_LINE_NO:137
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I = 0 ; #DEBUG_LINE_NO:145
    While I < herdRefs.Length ; #DEBUG_LINE_NO:146
      If (herdRefs[I] as Actor).isDead() == False ; #DEBUG_LINE_NO:147
        (herdRefs[I] as Actor).SetValue(Suspicious, 2.0) ; #DEBUG_LINE_NO:149
        If needNewFallback == True ; #DEBUG_LINE_NO:151
          needNewFallback = False ; #DEBUG_LINE_NO:152
          currentFallback = herdRefs[I] ; #DEBUG_LINE_NO:153
          (currentFallback as Actor).SetValue(Aggression, fAggression) ; #DEBUG_LINE_NO:154
          (currentFallback as Actor).SetValue(Confidence, fConfidence) ; #DEBUG_LINE_NO:155
          (currentFallback as Actor).startCombat((akTarget as Actor) as ObjectReference, False) ; #DEBUG_LINE_NO:156
        EndIf ; #DEBUG_LINE_NO:
        If (herdRefs[I] as Actor).getValue(DMP_Herd) == 0.0 || (herdRefs[I] as Actor).getValue(DMP_Herd) == 2.0 ; #DEBUG_LINE_NO:160
          (herdRefs[I] as Actor).SetValue(DMP_Herd, 1.0) ; #DEBUG_LINE_NO:161
        Else ; #DEBUG_LINE_NO:
          (herdRefs[I] as Actor).SetValue(DMP_Herd, 2.0) ; #DEBUG_LINE_NO:163
        EndIf ; #DEBUG_LINE_NO:
        (herdRefs[I] as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:166
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:168
    EndWhile ; #DEBUG_LINE_NO:
    Self.StartTimer(timer, timerID) ; #DEBUG_LINE_NO:172
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == timerID ; #DEBUG_LINE_NO:179
    busy = False ; #DEBUG_LINE_NO:180
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:184
  While I < herdRefs.Length ; #DEBUG_LINE_NO:185
    Self.RegisterForRemoteEvent((herdRefs[I] as Actor) as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:186
    I += 1 ; #DEBUG_LINE_NO:187
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
