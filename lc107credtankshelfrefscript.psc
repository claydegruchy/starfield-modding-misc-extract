ScriptName LC107CredTankShelfRefScript Extends LC107CredTankSystemRefScript
{ Script for the CredTank Racks in the Vault.

CredTank Racks are instanced packins consisting of:
- This script, on the pivot dummy.
- The shelves themselves, linked to an enable marker.
- A set of 'Responsive' CredTanks, which this script animates based on player proximity, linked to an enable marker.
- A set of 'Always-On' CredTanks, linked to an enable marker.
- A set of 'Always-Off' CredTanks, linked to an enable marker.

The Responsive CredTanks look Off at Position=0, and On at Position=1, but we have to use this elaborate and complicated
system of enable swaps for perf reasons-- the renderer doesn't support having this many animatable objects enabled at
the same time, in the same cell. (Even if they aren't actually animating at any given moment, the mere fact that they
*could* animate is enough to kill the perf.) There's been a lot of back-and-forth over this. }

;-- Variables ---------------------------------------
Float CONST_CredTankProximityMaxRange = 20.0 Const
Float CONST_CredTankProximityMinRange = 2.0 Const
Int CONST_CredTankProximityPrecision = 4 Const
Float CONST_CredTankShelfTimerDelay = 1.0 Const
Int CONST_PlayerEnteredVaultStage = 301 Const
Float credTankProximityRange
ObjectReference[] credTanks
ObjectReference offTanksEnableMarker
ObjectReference onTanksEnableMarker
Actor player
Bool playerEnteredVaultStageDone
Int playerLastSeenUpdatesAgo
ObjectReference responsiveTanksEnableMarker
ObjectReference shelfEnableMarker
ObjectReference shelfTrigger
Bool verbose

;-- Properties --------------------------------------
Group AutofillProperties
  GlobalVariable Property LC107CredTankShelvesCurrentGlobal Auto Const mandatory
  GlobalVariable Property LC107CredTankShelvesTotalGlobal Auto Const mandatory
  Keyword Property LC107_LinkCredTankShelfTrigger Auto Const mandatory
  Keyword Property LC107_LinkCredTankEnableMarker Auto Const mandatory
EndGroup

String Property CONST_AnimVariable_Position = "Position" Auto Const hidden
String Property CONST_AnimVariable_Speed = "Speed" Auto Const hidden

;-- Functions ---------------------------------------

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function PerformOperation(Int myNewOperation)
  Self.SetState(myNewOperation) ; #DEBUG_LINE_NO:52
  LC107CredTankShelvesCurrentGlobal.Mod(1.0) ; #DEBUG_LINE_NO:53
EndFunction

Function SetState(Int myNewOperation)
  myOperation = myNewOperation ; #DEBUG_LINE_NO:57
  If myOperation == CONST_Operation_Initialize ; #DEBUG_LINE_NO:58
    player = Game.GetPlayer() ; #DEBUG_LINE_NO:59
    shelfTrigger = Self.GetLinkedRef(LC107_LinkCredTankShelfTrigger) ; #DEBUG_LINE_NO:60
    shelfEnableMarker = Self.GetLinkedRef(LC107_LinkCredTankEnableMarker) ; #DEBUG_LINE_NO:61
    responsiveTanksEnableMarker = shelfEnableMarker.GetLinkedRef(LC107_LinkCredTankEnableMarker) ; #DEBUG_LINE_NO:62
    onTanksEnableMarker = responsiveTanksEnableMarker.GetLinkedRef(LC107_LinkCredTankEnableMarker) ; #DEBUG_LINE_NO:63
    offTanksEnableMarker = onTanksEnableMarker.GetLinkedRef(LC107_LinkCredTankEnableMarker) ; #DEBUG_LINE_NO:64
    credTanks = Self.GetLinkedRefChain(ChildObjectKeyword, 100) ; #DEBUG_LINE_NO:65
    credTankProximityRange = CONST_CredTankProximityMaxRange - CONST_CredTankProximityMinRange ; #DEBUG_LINE_NO:66
    Self.RegisterForRemoteEvent(shelfTrigger as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:67
    shelfEnableMarker.EnableNoWait(False) ; #DEBUG_LINE_NO:69
    Self.SetState(CONST_Operation_Waiting) ; #DEBUG_LINE_NO:70
  ElseIf myOperation == CONST_Operation_Waiting ; #DEBUG_LINE_NO:71
    offTanksEnableMarker.EnableNoWait(False) ; #DEBUG_LINE_NO:74
    Utility.Wait(0.01) ; #DEBUG_LINE_NO:75
    responsiveTanksEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:76
    Self.GoToState("Waiting") ; #DEBUG_LINE_NO:77
    shelfTrigger.Enable(False) ; #DEBUG_LINE_NO:78
  ElseIf myOperation == CONST_Operation_Responsive ; #DEBUG_LINE_NO:79
    responsiveTanksEnableMarker.EnableNoWait(False) ; #DEBUG_LINE_NO:82
    Utility.Wait(0.01) ; #DEBUG_LINE_NO:83
    offTanksEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:84
    Self.GoToState("Active") ; #DEBUG_LINE_NO:85
    playerLastSeenUpdatesAgo = 0 ; #DEBUG_LINE_NO:86
    Self.StartTimer(0.0, 0) ; #DEBUG_LINE_NO:87
  ElseIf myOperation == CONST_Operation_Boot ; #DEBUG_LINE_NO:88
    onTanksEnableMarker.Enable(False) ; #DEBUG_LINE_NO:90
    responsiveTanksEnableMarker.Disable(False) ; #DEBUG_LINE_NO:91
    offTanksEnableMarker.Disable(False) ; #DEBUG_LINE_NO:92
    shelfTrigger.Disable(False) ; #DEBUG_LINE_NO:94
    Self.GoToState("Inactive") ; #DEBUG_LINE_NO:95
  ElseIf myOperation == CONST_Operation_Drain ; #DEBUG_LINE_NO:96
    offTanksEnableMarker.Enable(False) ; #DEBUG_LINE_NO:98
    onTanksEnableMarker.Disable(False) ; #DEBUG_LINE_NO:99
  ElseIf myOperation == CONST_Operation_Shutdown ; #DEBUG_LINE_NO:100
    shelfTrigger.DisableNoWait(False) ; #DEBUG_LINE_NO:102
    shelfEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:103
    responsiveTanksEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:104
    onTanksEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:105
    offTanksEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:106
    Self.GoToState("Inactive") ; #DEBUG_LINE_NO:107
    player = None ; #DEBUG_LINE_NO:109
    shelfTrigger = None ; #DEBUG_LINE_NO:110
    shelfEnableMarker = None ; #DEBUG_LINE_NO:111
    responsiveTanksEnableMarker = None ; #DEBUG_LINE_NO:112
    offTanksEnableMarker = None ; #DEBUG_LINE_NO:113
    onTanksEnableMarker = None ; #DEBUG_LINE_NO:114
    credTanks = None ; #DEBUG_LINE_NO:115
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdateOnTimer()
  Bool playerIsInTrigger = shelfTrigger.IsInTrigger(player as ObjectReference) ; #DEBUG_LINE_NO:158
  If !playerEnteredVaultStageDone ; #DEBUG_LINE_NO:159
    playerEnteredVaultStageDone = LC107.GetStageDone(CONST_PlayerEnteredVaultStage) ; #DEBUG_LINE_NO:160
  EndIf ; #DEBUG_LINE_NO:
  If !playerEnteredVaultStageDone ; #DEBUG_LINE_NO:162
    Self.StartTimer(CONST_CredTankShelfTimerDelay, 0) ; #DEBUG_LINE_NO:164
  ElseIf !playerIsInTrigger && playerLastSeenUpdatesAgo > 1 ; #DEBUG_LINE_NO:165
    Self.GoToState("Busy") ; #DEBUG_LINE_NO:170
    shelfTrigger.Disable(False) ; #DEBUG_LINE_NO:171
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:172
    Self.SetState(CONST_Operation_Waiting) ; #DEBUG_LINE_NO:173
  Else ; #DEBUG_LINE_NO:
    If !playerIsInTrigger ; #DEBUG_LINE_NO:175
      playerLastSeenUpdatesAgo += 1 ; #DEBUG_LINE_NO:179
      Int I = 0 ; #DEBUG_LINE_NO:180
      While I < credTanks.Length && myOperation == CONST_Operation_Responsive ; #DEBUG_LINE_NO:181
        credTanks[I].SetAnimationVariableFloat(CONST_AnimVariable_Position, 0.0) ; #DEBUG_LINE_NO:182
        I += 1 ; #DEBUG_LINE_NO:186
      EndWhile ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      playerLastSeenUpdatesAgo = 0 ; #DEBUG_LINE_NO:193
      Float[] tankDistances = new Float[credTanks.Length] ; #DEBUG_LINE_NO:194
      Float tankMinDistance = 0.0 ; #DEBUG_LINE_NO:195
      Int i = 0 ; #DEBUG_LINE_NO:196
      While i < credTanks.Length ; #DEBUG_LINE_NO:197
        tankDistances[i] = player.GetDistance(credTanks[i]) ; #DEBUG_LINE_NO:198
        i += CONST_CredTankProximityPrecision ; #DEBUG_LINE_NO:199
      EndWhile ; #DEBUG_LINE_NO:
      If tankDistances[credTanks.Length - 1] == 0.0 ; #DEBUG_LINE_NO:201
        tankDistances[credTanks.Length - 1] = player.GetDistance(credTanks[credTanks.Length - 1]) ; #DEBUG_LINE_NO:202
      EndIf ; #DEBUG_LINE_NO:
      i = 0 ; #DEBUG_LINE_NO:204
      While i < credTanks.Length ; #DEBUG_LINE_NO:205
        If tankDistances[i] == 0.0 ; #DEBUG_LINE_NO:206
          Int priorIndex = i - i % CONST_CredTankProximityPrecision ; #DEBUG_LINE_NO:207
          Int priorIndexBelowCurrent = i - priorIndex ; #DEBUG_LINE_NO:208
          Int nextIndex = Math.Min((tankDistances.Length - 1) as Float, (priorIndex + CONST_CredTankProximityPrecision) as Float) as Int ; #DEBUG_LINE_NO:209
          Int nextIndexAboveCurrent = nextIndex - i ; #DEBUG_LINE_NO:210
          Float indexRange = (priorIndexBelowCurrent + nextIndexAboveCurrent) as Float ; #DEBUG_LINE_NO:211
          Float priorMultiple = 1.0 - (priorIndexBelowCurrent as Float / indexRange) ; #DEBUG_LINE_NO:212
          Float nextMultiple = 1.0 - (nextIndexAboveCurrent as Float / indexRange) ; #DEBUG_LINE_NO:213
          tankDistances[i] = tankDistances[priorIndex] * priorMultiple + tankDistances[nextIndex] * nextMultiple ; #DEBUG_LINE_NO:214
        EndIf ; #DEBUG_LINE_NO:
        i += 1 ; #DEBUG_LINE_NO:219
      EndWhile ; #DEBUG_LINE_NO:
      i = 0 ; #DEBUG_LINE_NO:222
      While i < credTanks.Length && myOperation == CONST_Operation_Responsive ; #DEBUG_LINE_NO:223
        Float tankPosition = 1.0 - Math.Min(Math.Max(Math.Max(tankDistances[i] - CONST_CredTankProximityMinRange, 0.0) / credTankProximityRange, 0.0), 1.0) ; #DEBUG_LINE_NO:224
        credTanks[i].SetAnimationVariableFloat(CONST_AnimVariable_Position, tankPosition) ; #DEBUG_LINE_NO:225
        i += 1 ; #DEBUG_LINE_NO:226
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.StartTimer(CONST_CredTankShelfTimerDelay, 0) ; #DEBUG_LINE_NO:232
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DEBUG_SetVerbose(Bool shouldBeVerbose)
  verbose = shouldBeVerbose ; #DEBUG_LINE_NO:243
EndFunction

;-- State -------------------------------------------
State Active

  Event OnTimer(Int timerID)
    Self.UpdateOnTimer() ; #DEBUG_LINE_NO:139
  EndEvent
EndState

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
Auto State Inactive
EndState

;-- State -------------------------------------------
State Waiting

  Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
    Self.GoToState("Busy") ; #DEBUG_LINE_NO:129
    Self.SetState(CONST_Operation_Responsive) ; #DEBUG_LINE_NO:130
  EndEvent
EndState
