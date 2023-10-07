ScriptName ShipLiftActivator Extends ObjectReference conditional
{ Handles raising and lowering of ship interior lift }

;-- Variables ---------------------------------------
ObjectReference player

;-- Properties --------------------------------------
Group AnimationName_Properties
  String Property raiseAnim = "Stage2" Auto
  { Animation to play when raising }
  String Property lowerAnim = "Stage1" Auto
  { Animation to play when lowering }
  String Property raiseEvent = "TransitionComplete" Auto
  { Raise event name - waits for this event before considering itself "raised" }
  String Property lowerEvent = "TransitionComplete" Auto
  { Lower event name - waits for this event before considering itself "lowered" }
  String Property startRaiseAnim = "Stage2" Auto
  { OnLoad calls this if the object starts in the raised state }
EndGroup

Group Optional_Properties
  Bool Property isRaised = False Auto conditional
  { Set to TRUE to start raised. }
  Bool Property doOnce = False Auto
  { Set to TRUE to raise/lower on first trigger only. }
  Bool Property shouldSetDefaultState = True Auto Const
  { Should this use SetDefaultState? Set to False only for Activators with identical raise/lower events. }
  Bool Property AllowInterrupt = False Auto
  { Allow interrupts while animation? Default: FALSE }
  Bool Property InvertCollision = False Auto
  { Typically this will be False (DEFAULT).  The References LinkRef'd Chained with the TwoStateCollisionKeyword will typically be 
	Disabled onOpen, and Enabled on Close.  If you want that functionality inverted set this to TRUE }
EndGroup

Group Autofill_Properties
  Keyword Property TwoStateCollisionKeyword Auto
  { Keword to link to the collision you want to enable/disable based on this activators raised/lowered state. }
EndGroup

Bool Property isAnimating = False Auto conditional hidden
{ Is the ramp currently animating from one state to another? }
Bool Property shouldRaiseNext = True Auto conditional hidden
{ Used for SetRaiseNoWait. Should we raise when the timer fires? }
Int Property myState = 1 Auto conditional hidden
{ true when static or animating
 0 == raise or raising
 1 == lower or lowering }

;-- Functions ---------------------------------------

Event OnLoad()
  player = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:63
  If shouldSetDefaultState ; #DEBUG_LINE_NO:64
    Self.SetDefaultState() ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnReset()
  If shouldSetDefaultState ; #DEBUG_LINE_NO:70
    Self.SetDefaultState() ; #DEBUG_LINE_NO:71
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetDefaultState()
  If isRaised ; #DEBUG_LINE_NO:77
    Self.playAnimationandWait(startRaiseAnim, raiseEvent) ; #DEBUG_LINE_NO:78
    If InvertCollision == False ; #DEBUG_LINE_NO:80
      Self.DisableLinkChain(TwoStateCollisionKeyword, False) ; #DEBUG_LINE_NO:82
    Else ; #DEBUG_LINE_NO:
      Self.EnableLinkChain(TwoStateCollisionKeyword, False) ; #DEBUG_LINE_NO:85
    EndIf ; #DEBUG_LINE_NO:
    myState = 0 ; #DEBUG_LINE_NO:88
  Else ; #DEBUG_LINE_NO:
    Self.playAnimationandWait(lowerAnim, lowerEvent) ; #DEBUG_LINE_NO:90
    If InvertCollision == False ; #DEBUG_LINE_NO:92
      Self.EnableLinkChain(TwoStateCollisionKeyword, False) ; #DEBUG_LINE_NO:94
    Else ; #DEBUG_LINE_NO:
      Self.DisableLinkChain(TwoStateCollisionKeyword, False) ; #DEBUG_LINE_NO:97
    EndIf ; #DEBUG_LINE_NO:
    myState = 1 ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetRaiseNoWait(Bool adRaise)
  shouldRaiseNext = adRaise ; #DEBUG_LINE_NO:136
  Self.StartTimer(0.0, 0) ; #DEBUG_LINE_NO:137
EndFunction

Event OnTimer(Int timerID)
  Self.SetRaise(shouldRaiseNext) ; #DEBUG_LINE_NO:141
EndEvent

Function SetRaise(Bool adRaise)
  While Self.getState() == "busy" ; #DEBUG_LINE_NO:146
    Utility.wait(1.0) ; #DEBUG_LINE_NO:147
  EndWhile ; #DEBUG_LINE_NO:
  isAnimating = True ; #DEBUG_LINE_NO:150
  Self.gotoState("busy") ; #DEBUG_LINE_NO:151
  If adRaise ; #DEBUG_LINE_NO:152
    Self.playAnimationandWait(raiseAnim, raiseEvent) ; #DEBUG_LINE_NO:154
    isRaised = True ; #DEBUG_LINE_NO:155
  Else ; #DEBUG_LINE_NO:
    Self.playAnimationandWait(lowerAnim, lowerEvent) ; #DEBUG_LINE_NO:158
    isRaised = False ; #DEBUG_LINE_NO:159
  EndIf ; #DEBUG_LINE_NO:
  Self.gotoState("waiting") ; #DEBUG_LINE_NO:162
  isAnimating = False ; #DEBUG_LINE_NO:163
EndFunction

;-- State -------------------------------------------
State busy

  Event onActivate(ObjectReference triggerRef)
    If AllowInterrupt == True ; #DEBUG_LINE_NO:118
      Self.SetRaise(!isRaised) ; #DEBUG_LINE_NO:120
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State done

  Event onActivate(ObjectReference triggerRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State waiting

  Event onActivate(ObjectReference triggerRef)
    If triggerRef == player ; #DEBUG_LINE_NO:106
      Self.SetRaise(!isRaised) ; #DEBUG_LINE_NO:107
      If doOnce ; #DEBUG_LINE_NO:108
        Self.gotoState("done") ; #DEBUG_LINE_NO:109
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
