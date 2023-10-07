ScriptName LandingPadBlastShields Extends ObjectReference
{ Handle the opening and closing of the landing pad blast shields. }

;-- Variables ---------------------------------------
Int BeforeOpenTimerID = 3 Const
Int OpenToCloseTimerID = 2 Const

;-- Properties --------------------------------------
Float Property BaseAnimSpeed = 1.0 Auto Const
Float Property AnimSpeedVariance = 0.0 Auto Const
Float Property BeforeOpenTimer = 12.0 Auto Const
Float Property OpenToCloseTimer = 13.0 Auto Const
Keyword Property LinkedRef_LandingPadShield_EnableMarker Auto Const mandatory
String Property blastShieldOpen = "Play01" Auto Const
String Property blastShieldClose = "Play02" Auto Const
String Property blastShieldInstantClose = "StateA_Idle" Auto Const

;-- Functions ---------------------------------------

Event SpaceshipReference.OnShipTakeOff(spaceshipreference akSender, Bool abComplete)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function ActivateBlastShields(Bool isLanding)
  Self.GoToState("Busy") ; #DEBUG_LINE_NO:18
  If isLanding ; #DEBUG_LINE_NO:19
    Self.StartTimer(BeforeOpenTimer, BeforeOpenTimerID) ; #DEBUG_LINE_NO:20
  Else ; #DEBUG_LINE_NO:
    Self.StartTimer(0.0, BeforeOpenTimerID) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnCellLoad()
  Self.AnimateBlastShields(blastShieldInstantClose) ; #DEBUG_LINE_NO:33
EndEvent

Function AnimateBlastShields(String animationString)
  ObjectReference[] linkedrefs = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:93
  Int index = 0 ; #DEBUG_LINE_NO:94
  While index < linkedrefs.Length ; #DEBUG_LINE_NO:95
    ObjectReference blastShield = linkedrefs[index] ; #DEBUG_LINE_NO:96
    Self.AnimateBlastShield(blastShield, animationString) ; #DEBUG_LINE_NO:97
    index += 1 ; #DEBUG_LINE_NO:98
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function AnimateBlastShield(ObjectReference blastShield, String animationString)
  If blastShield as Bool && blastShield.Is3DLoaded() ; #DEBUG_LINE_NO:103
    blastShield.SetAnimationVariableFloat("AnimSpeed", BaseAnimSpeed + Utility.RandomFloat(-AnimSpeedVariance, AnimSpeedVariance)) ; #DEBUG_LINE_NO:105
    blastShield.PlayAnimation(animationString) ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State Busy

  Event SpaceshipReference.OnShipTakeOff(spaceshipreference akSender, Bool abComplete)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnTimer(Int aiTimerID)
    If aiTimerID == OpenToCloseTimerID ; #DEBUG_LINE_NO:
      Self.AnimateBlastShields(blastShieldClose) ; #DEBUG_LINE_NO:
      ObjectReference EnableMarker = Self.GetLinkedRef(LinkedRef_LandingPadShield_EnableMarker) ; #DEBUG_LINE_NO:
      If EnableMarker ; #DEBUG_LINE_NO:
        EnableMarker.Disable(False) ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      Self.GoToState("Idle") ; #DEBUG_LINE_NO:
    ElseIf aiTimerID == BeforeOpenTimerID ; #DEBUG_LINE_NO:
      Self.AnimateBlastShields(blastShieldOpen) ; #DEBUG_LINE_NO:
      ObjectReference enablemarker = Self.GetLinkedRef(LinkedRef_LandingPadShield_EnableMarker) ; #DEBUG_LINE_NO:
      If enablemarker ; #DEBUG_LINE_NO:
        enablemarker.Enable(False) ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      Self.StartTimer(OpenToCloseTimer, OpenToCloseTimerID) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnUnload()
    Self.CancelTimer(OpenToCloseTimerID) ; #DEBUG_LINE_NO:63
    Self.CancelTimer(BeforeOpenTimerID) ; #DEBUG_LINE_NO:64
    Self.GoToState("Idle") ; #DEBUG_LINE_NO:65
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Idle

  Event SpaceshipReference.OnShipTakeOff(spaceshipreference akSender, Bool abComplete)
    If !abComplete ; #DEBUG_LINE_NO:
      Self.ActivateBlastShields(False) ; #DEBUG_LINE_NO:
      Self.UnregisterForRemoteEvent(akSender as ScriptObject, "OnShipTakeOff") ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnActivate(ObjectReference akActionRef)
    ObjectReference[] linkedrefs = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:40
    If linkedrefs.Length > 0 ; #DEBUG_LINE_NO:41
      spaceshipreference spaceshipRef = akActionRef as spaceshipreference ; #DEBUG_LINE_NO:42
      If spaceshipRef ; #DEBUG_LINE_NO:43
        Self.RegisterForRemoteEvent(spaceshipRef as ScriptObject, "OnShipTakeOff") ; #DEBUG_LINE_NO:44
        Self.ActivateBlastShields(True) ; #DEBUG_LINE_NO:45
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
