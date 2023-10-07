ScriptName GenericSwitchScript Extends ObjectReference
{ Script for controlling the state and color of generic switches. }

;-- Variables ---------------------------------------
Bool initialized

;-- Properties --------------------------------------
Group OptionalProperties
  String Property CurrentState = "On" Auto
  { DEFAULT=On. The switch's current state.
	Available states: Off, On, Pulse, PulseFast, Flicker }
  String Property CurrentColor = "Green" Auto
  { DEFAULT=Green. The switch's current color.
	Available colors: Green, Red, Blue, Orange, Yellow, White, Violet. }
  Keyword Property ParentSwitchLink Auto Const
  { DEFAULT=None. If not none, if this switch is linked to another switch with this keyword, register for events on that switch. }
EndGroup

Bool Property HasParentSwitch Auto hidden
Bool Property IsParentSwitch Auto hidden

;-- Functions ---------------------------------------

Event OnCellLoad()
  If !initialized ; #DEBUG_LINE_NO:28
    initialized = True ; #DEBUG_LINE_NO:29
    If ParentSwitchLink != None ; #DEBUG_LINE_NO:30
      GenericSwitchScript parentSwitch = Self.GetLinkedRef(ParentSwitchLink) as GenericSwitchScript ; #DEBUG_LINE_NO:31
      If parentSwitch != None ; #DEBUG_LINE_NO:32
        HasParentSwitch = True ; #DEBUG_LINE_NO:33
        parentSwitch.IsParentSwitch = True ; #DEBUG_LINE_NO:34
        Self.RegisterForCustomEvent(parentSwitch as ScriptObject, "genericswitchscript_SetColorEvent") ; #DEBUG_LINE_NO:35
        Self.RegisterForCustomEvent(parentSwitch as ScriptObject, "genericswitchscript_SetStateEvent") ; #DEBUG_LINE_NO:36
        Self.SetColor(parentSwitch.CurrentColor) ; #DEBUG_LINE_NO:37
        Self.SetState(parentSwitch.CurrentState) ; #DEBUG_LINE_NO:38
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If !HasParentSwitch ; #DEBUG_LINE_NO:42
    Self.SetColor(CurrentColor) ; #DEBUG_LINE_NO:43
    Self.SetState(CurrentState) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event GenericSwitchScript.SetColorEvent(GenericSwitchScript akSender, Var[] akArgs)
  Self.SetColor(akArgs[0] as String) ; #DEBUG_LINE_NO:50
EndEvent

Function SetColor(String newColor)
  If IsParentSwitch ; #DEBUG_LINE_NO:54
    Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:55
    akArgs[0] = newColor as Var ; #DEBUG_LINE_NO:56
    Self.SendCustomEvent("genericswitchscript_SetColorEvent", akArgs) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
  If newColor == "Green" || newColor == "Red" || newColor == "Blue" || newColor == "Orange" || newColor == "Yellow" || newColor == "White" || newColor == "Violet" ; #DEBUG_LINE_NO:59,60
    CurrentColor = newColor ; #DEBUG_LINE_NO:61
    Self.PlayAnimationIfLoaded("TurnColor" + newColor) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event GenericSwitchScript.SetStateEvent(GenericSwitchScript akSender, Var[] akArgs)
  Self.SetState(akArgs[0] as String) ; #DEBUG_LINE_NO:70
EndEvent

Function SetState(String newState)
  If IsParentSwitch ; #DEBUG_LINE_NO:74
    Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:75
    akArgs[0] = newState as Var ; #DEBUG_LINE_NO:76
    Self.SendCustomEvent("genericswitchscript_SetStateEvent", akArgs) ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
  If newState == "Off" ; #DEBUG_LINE_NO:79
    CurrentState = newState ; #DEBUG_LINE_NO:80
    Self.PlayAnimationIfLoaded("TurnOffFull") ; #DEBUG_LINE_NO:81
  ElseIf newState == "On" ; #DEBUG_LINE_NO:82
    CurrentState = newState ; #DEBUG_LINE_NO:83
    Self.PlayAnimationIfLoaded("TurnOnFull") ; #DEBUG_LINE_NO:84
  ElseIf newState == "Pulse" ; #DEBUG_LINE_NO:85
    CurrentState = newState ; #DEBUG_LINE_NO:86
    Self.PlayAnimationIfLoaded("TurnOnPulse") ; #DEBUG_LINE_NO:87
  ElseIf newState == "PulseFast" ; #DEBUG_LINE_NO:88
    CurrentState = newState ; #DEBUG_LINE_NO:89
    Self.PlayAnimationIfLoaded("TurnOnPulseFast") ; #DEBUG_LINE_NO:90
  ElseIf newState == "Flicker" ; #DEBUG_LINE_NO:91
    CurrentState = newState ; #DEBUG_LINE_NO:92
    Self.PlayAnimationIfLoaded("TurnOnFlicker") ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlayAnimationIfLoaded(String animationToPlay)
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:100
    Self.PlayAnimation(animationToPlay) ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
EndFunction
