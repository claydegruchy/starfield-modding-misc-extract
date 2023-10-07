ScriptName TerminalScript Extends ObjectReference
{ script for all terminals that need to animate }

;-- Variables ---------------------------------------
Float checkStateTimeEnter = 0.100000001 Const
Float checkStateTimeExit = 2.0 Const
Int checkStateTimerID = 1 Const
ObjectReference myTrigger
Bool requiresPower = False

;-- Properties --------------------------------------
Float Property AnimateDistanceOpen = 3.0 Auto Const
{ used for the "animate open" distance check if no trigger is linked }
Float Property AnimateDistanceClose = 6.0 Auto Const
{ used for the "animate close" distance check if no trigger is linked }
String Property myOpenAnimation = "play01" Auto Const
String Property myCloseAnimation = "play02" Auto Const
ActorValue Property PowerCanBePowered Auto Const
{ to check for terminals that require power (e.g. outpost) }

;-- Functions ---------------------------------------

Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
  If requiresPower ; #DEBUG_LINE_NO:122
    Self.StartTimer(checkStateTimeEnter, checkStateTimerID) ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnPowerOff()
  If requiresPower ; #DEBUG_LINE_NO:129
    Self.StartTimer(checkStateTimeEnter, checkStateTimerID) ; #DEBUG_LINE_NO:131
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == checkStateTimerID ; #DEBUG_LINE_NO:136
    Self.CheckOpenState() ; #DEBUG_LINE_NO:137
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckOpenState()
  Bool checkSucceeded = True ; #DEBUG_LINE_NO:143
  If Self.Is3dLoaded() ; #DEBUG_LINE_NO:144
    If requiresPower && Self.IsPowered() == False ; #DEBUG_LINE_NO:145
      If Self.IsFurnitureInUse(False) == False && Self.GetOpenState() < 3 ; #DEBUG_LINE_NO:147
        checkSucceeded = Self.PlayAnimationAndWait(myCloseAnimation, "done") ; #DEBUG_LINE_NO:149
      EndIf ; #DEBUG_LINE_NO:
    ElseIf Self.IsFurnitureInUse(False) && Self.GetOpenState() > 2 ; #DEBUG_LINE_NO:153
      checkSucceeded = Self.PlayAnimationAndWait(myOpenAnimation, "done") ; #DEBUG_LINE_NO:155
    ElseIf myTrigger ; #DEBUG_LINE_NO:
      If myTrigger.IsInTrigger(Game.GetPlayer() as ObjectReference) && Self.GetOpenState() > 2 ; #DEBUG_LINE_NO:158
        checkSucceeded = Self.PlayAnimationAndWait(myOpenAnimation, "done") ; #DEBUG_LINE_NO:159
      ElseIf Self.IsFurnitureInUse(False) == False && Self.GetOpenState() < 3 ; #DEBUG_LINE_NO:163
        checkSucceeded = Self.PlayAnimationAndWait(myCloseAnimation, "done") ; #DEBUG_LINE_NO:164
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      ObjectReference player = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:170
      If Self.GetDistance(player) < AnimateDistanceClose && Self.GetOpenState() > 2 ; #DEBUG_LINE_NO:171
        checkSucceeded = Self.PlayAnimationAndWait(myOpenAnimation, "done") ; #DEBUG_LINE_NO:172
      ElseIf Self.GetDistance(player) >= AnimateDistanceClose ; #DEBUG_LINE_NO:174
        If Self.IsFurnitureInUse(False) == False && Self.GetOpenState() < 3 ; #DEBUG_LINE_NO:176
          checkSucceeded = Self.PlayAnimationAndWait(myCloseAnimation, "done") ; #DEBUG_LINE_NO:177
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If checkSucceeded == False && Self.Is3dLoaded() ; #DEBUG_LINE_NO:184
      Self.StartTimer(checkStateTimeEnter, checkStateTimerID) ; #DEBUG_LINE_NO:187
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnActivate(ObjectReference akActionRef)
  If akActionRef != Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:196
    Self.CheckOpenState() ; #DEBUG_LINE_NO:197
  ElseIf requiresPower ; #DEBUG_LINE_NO:
    If Self.IsPowered() && Self.IsActivationBlocked() ; #DEBUG_LINE_NO:200
      Self.Activate(akActionRef, False) ; #DEBUG_LINE_NO:201
      Self.IncrementAchievement() ; #DEBUG_LINE_NO:202
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.IncrementAchievement() ; #DEBUG_LINE_NO:205
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function IncrementAchievement()
  sq_parentscript SQ_Parent = Game.GetFormFromFile(461100, "Starfield.esm") as sq_parentscript ; #DEBUG_LINE_NO:212
  If SQ_Parent ; #DEBUG_LINE_NO:213
    SQ_Parent.IncrementComputersAchievement(Self as ObjectReference) ; #DEBUG_LINE_NO:214
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State loaded

  Event ObjectReference.OnTriggerEnter(ObjectReference akSource, ObjectReference akActionRef)
    Self.StartTimer(checkStateTimeEnter, checkStateTimerID) ; #DEBUG_LINE_NO:
  EndEvent

  Event ObjectReference.OnTriggerLeave(ObjectReference akSource, ObjectReference akActionRef)
    Self.StartTimer(checkStateTimeExit, checkStateTimerID) ; #DEBUG_LINE_NO:
  EndEvent

  Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
    Self.StartTimer(checkStateTimeExit, checkStateTimerID) ; #DEBUG_LINE_NO:
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceOpen, 0) ; #DEBUG_LINE_NO:
  EndEvent

  Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
    Self.StartTimer(checkStateTimeEnter, checkStateTimerID) ; #DEBUG_LINE_NO:
    Self.RegisterForDistanceGreaterThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceClose, 0) ; #DEBUG_LINE_NO:
  EndEvent

  Event OnExitFurniture(ObjectReference akActionRef)
    If akActionRef != Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:
      If myTrigger ; #DEBUG_LINE_NO:
        Self.CheckOpenState() ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.RegisterForDistanceGreaterThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceClose, 0) ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnUnload()
    Self.gotoState("unloaded") ; #DEBUG_LINE_NO:60
    Self.CancelTimer(checkStateTimerID) ; #DEBUG_LINE_NO:62
    If myTrigger ; #DEBUG_LINE_NO:63
      Self.UnregisterForRemoteEvent(myTrigger as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:65
      Self.UnregisterForRemoteEvent(myTrigger as ScriptObject, "OnTriggerLeave") ; #DEBUG_LINE_NO:66
    Else ; #DEBUG_LINE_NO:
      Self.UnregisterForDistanceEvents(Self as ScriptObject, Game.GetPlayer() as ScriptObject, -1) ; #DEBUG_LINE_NO:69
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State unloaded

  Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    Self.gotoState("loaded") ; #DEBUG_LINE_NO:27
    myTrigger = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:29
    If myTrigger ; #DEBUG_LINE_NO:30
      Self.RegisterForRemoteEvent(myTrigger as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:33
      Self.RegisterForRemoteEvent(myTrigger as ScriptObject, "OnTriggerLeave") ; #DEBUG_LINE_NO:34
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, AnimateDistanceOpen, 0) ; #DEBUG_LINE_NO:38
    EndIf ; #DEBUG_LINE_NO:
    If PowerCanBePowered as Bool && Self.GetValue(PowerCanBePowered) > 0.0 ; #DEBUG_LINE_NO:41
      requiresPower = True ; #DEBUG_LINE_NO:42
      Self.BlockActivation(True, False) ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
    Self.CheckOpenState() ; #DEBUG_LINE_NO:45
  EndEvent
EndState
