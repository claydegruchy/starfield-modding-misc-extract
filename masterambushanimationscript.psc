ScriptName MasterAmbushAnimationScript Extends ObjectReference
{ This script causes the ref to animate when activated }

;-- Variables ---------------------------------------
Bool isOpened = False

;-- Properties --------------------------------------
String Property sInitialAnim = "Reset" Auto
{ By default, this property is set to Reset. }
String Property sActivateAnim = "Open" Auto
{ By default, this property is set to Open. }
Float Property fDelay = 0.0 Auto
{ By default, this property is set to 0.0f. }

;-- Functions ---------------------------------------

Event onReset()
  Self.onLoad() ; #DEBUG_LINE_NO:22
EndEvent

Event onLoad()
  If !isOpened ; #DEBUG_LINE_NO:28
    Self.playAnimation(sInitialAnim) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent

;-- State -------------------------------------------
State busy

  Event onActivate(ObjectReference triggerRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State waiting

  Event onActivate(ObjectReference triggerRef)
    Self.gotoState("busy") ; #DEBUG_LINE_NO:37
    isOpened = True ; #DEBUG_LINE_NO:38
    Utility.Wait(fDelay) ; #DEBUG_LINE_NO:39
    Self.playAnimation(sActivateAnim) ; #DEBUG_LINE_NO:40
  EndEvent
EndState
