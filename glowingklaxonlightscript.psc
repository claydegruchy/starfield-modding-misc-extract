ScriptName GlowingKlaxonLightScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property StartOn Auto
{ Whether the lights start on or not.  Default = FALSE }
Bool Property AutoOff = True Auto
{ Whether to have the klaxon automatically turn off or not.  Default = FALSE }
Int Property AutoOffTime = 10 Auto
{ Time before the klaxon automatically turns off. }

;-- Functions ---------------------------------------

Function PlayLights()
  ObjectReference KlaxonLight = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:43
  ObjectReference KlaxonSound = KlaxonLight.GetLinkedRef(None) ; #DEBUG_LINE_NO:44
  Self.PlayAnimation("Stage2") ; #DEBUG_LINE_NO:47
  KlaxonLight.Enable(False) ; #DEBUG_LINE_NO:49
  KlaxonLight.PlayAnimation("Stage2") ; #DEBUG_LINE_NO:50
  If KlaxonSound ; #DEBUG_LINE_NO:52
    KlaxonSound.Enable(False) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
  If AutoOff ; #DEBUG_LINE_NO:55
    Self.StartTimer(AutoOffTime as Float, 1) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
  Self.gotoState("WaitingOn") ; #DEBUG_LINE_NO:58
EndFunction

Function StopLights()
  ObjectReference KlaxonLight = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:64
  ObjectReference KlaxonSound = KlaxonLight.GetLinkedRef(None) ; #DEBUG_LINE_NO:65
  Self.PlayAnimation("Reset") ; #DEBUG_LINE_NO:68
  KlaxonLight.Disable(False) ; #DEBUG_LINE_NO:70
  KlaxonLight.PlayAnimation("Reset") ; #DEBUG_LINE_NO:71
  If KlaxonSound ; #DEBUG_LINE_NO:73
    KlaxonSound.Disable(False) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
  Self.CancelTimer(1) ; #DEBUG_LINE_NO:76
  Self.gotoState("WaitingOff") ; #DEBUG_LINE_NO:77
EndFunction

Event OnTimer(Int timerID)
  If timerID == 1 ; #DEBUG_LINE_NO:82
    Self.StopLights() ; #DEBUG_LINE_NO:83
  EndIf ; #DEBUG_LINE_NO:
EndEvent

;-- State -------------------------------------------
State BlockingActivation
EndState

;-- State -------------------------------------------
Auto State WaitingOff

  Event OnActivate(ObjectReference akActionRef)
    Self.gotoState("BlockingActivation") ; #DEBUG_LINE_NO:
    Self.PlayLights() ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    If StartOn == True ; #DEBUG_LINE_NO:15
      Self.gotoState("BlockingActivation") ; #DEBUG_LINE_NO:16
      Self.PlayLights() ; #DEBUG_LINE_NO:17
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State WaitingOn

  Event OnActivate(ObjectReference akActionRef)
    Self.gotoState("BlockingActivation") ; #DEBUG_LINE_NO:31
    Self.StopLights() ; #DEBUG_LINE_NO:32
  EndEvent
EndState
