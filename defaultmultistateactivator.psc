ScriptName DefaultMultiStateActivator Extends ObjectReference conditional default
{ Generic script for managing and maintaining the animation state of activators. }

;-- Structs -----------------------------------------
Struct AnimationStateDatum
  String StateName
  { The name of this animation state. This is the name expected by SetAnimationState. }
  String StateJumpAnim01
  { Animation to snap to this state. }
  String StateJumpAnim02
  { Animation to snap to this state. Played following StateJumpAnim01. }
  String StateStartAnim01
  { Animation to transition to the state. If empty, StateJumpAnim01, if any, will be used instead. }
  String StateStartAnim02
  { Animation to transition to the state. If empty, StateJumpAnim02, if any, will be used instead. }
  Bool EnableOverrideDisplayName
  { If True, use OverrideDisplayName. }
  Message OverrideDisplayName
  { If EnableOverrideDisplayName, change the display name to this. }
  Bool EnableOverrideActivateText
  { If True, use OverrideActivateText. }
  Message OverrideActivateText
  { If EnableOverrideActivateText, change the activate message to this. }
  Bool EnableBlockActivation
  { If True, use BlockActivation & BlockActivationHideText. }
  Bool BlockActivation
  { If EnableBlockActivation, set Block Activation to this. }
  Bool BlockActivationHideText
  { If EnableBlockActivation, set Block Activation's Hide Text to this. }
EndStruct


;-- Variables ---------------------------------------
Int currentAnimatedStateIndex = 0

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard SetAnimationStateGuard

;-- Properties --------------------------------------
Group Base_Properties
  defaultmultistateactivator:animationstatedatum[] Property AnimationStateData Auto Const mandatory
  { A list of the object's animation states. }
EndGroup

Group Reference_Properties
  String Property StartStateName = "" Auto Const
  { The StateName of the animation state to start in. If "" (the default), this defaults to AnimationState[0]. }
EndGroup

Int Property CurrentStateIndex = 0 Auto conditional hidden

;-- Functions ---------------------------------------

Function SetAnimationState(String newStateName, Bool shouldUseJumpAnims)
  Self.GoToState("Main") ; #DEBUG_LINE_NO:80
  Guard SetAnimationStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:81
    Int newStateIndex = AnimationStateData.findstruct("StateName", newStateName, 0) ; #DEBUG_LINE_NO:82
    If newStateIndex < 0 ; #DEBUG_LINE_NO:83
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.Private_SetAnimationStateIndex(newStateIndex, shouldUseJumpAnims) ; #DEBUG_LINE_NO:86
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function Private_SetAnimationStateIndex(Int newStateIndex, Bool shouldUseJumpAnims)
  Int oldStateIndex = CurrentStateIndex ; #DEBUG_LINE_NO:92
  CurrentStateIndex = newStateIndex ; #DEBUG_LINE_NO:93
  defaultmultistateactivator:animationstatedatum currentStateData = AnimationStateData[CurrentStateIndex] ; #DEBUG_LINE_NO:94
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:96
    currentAnimatedStateIndex = CurrentStateIndex ; #DEBUG_LINE_NO:97
    If !shouldUseJumpAnims && currentStateData.StateStartAnim01 != "" ; #DEBUG_LINE_NO:98
      Self.PlayAnimation(currentStateData.StateStartAnim01) ; #DEBUG_LINE_NO:99
    ElseIf currentStateData.StateJumpAnim01 != "" ; #DEBUG_LINE_NO:100
      Self.PlayAnimation(currentStateData.StateJumpAnim01) ; #DEBUG_LINE_NO:101
    EndIf ; #DEBUG_LINE_NO:
    If !shouldUseJumpAnims && currentStateData.StateStartAnim02 != "" ; #DEBUG_LINE_NO:103
      Self.PlayAnimation(currentStateData.StateStartAnim02) ; #DEBUG_LINE_NO:104
    ElseIf currentStateData.StateJumpAnim02 != "" ; #DEBUG_LINE_NO:105
      Self.PlayAnimation(currentStateData.StateJumpAnim02) ; #DEBUG_LINE_NO:106
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If currentStateData.EnableOverrideDisplayName ; #DEBUG_LINE_NO:110
    Self.SetOverrideName(currentStateData.OverrideDisplayName) ; #DEBUG_LINE_NO:111
  EndIf ; #DEBUG_LINE_NO:
  If currentStateData.EnableOverrideActivateText ; #DEBUG_LINE_NO:113
    Self.SetActivateTextOverride(currentStateData.OverrideActivateText) ; #DEBUG_LINE_NO:114
  EndIf ; #DEBUG_LINE_NO:
  If currentStateData.EnableBlockActivation ; #DEBUG_LINE_NO:116
    Self.BlockActivation(currentStateData.BlockActivation, currentStateData.BlockActivationHideText) ; #DEBUG_LINE_NO:117
  EndIf ; #DEBUG_LINE_NO:
  Var[] argsEvent = new Var[4] ; #DEBUG_LINE_NO:120
  argsEvent[0] = oldStateIndex as Var ; #DEBUG_LINE_NO:121
  argsEvent[1] = AnimationStateData[oldStateIndex].StateName as Var ; #DEBUG_LINE_NO:122
  argsEvent[2] = newStateIndex as Var ; #DEBUG_LINE_NO:123
  argsEvent[3] = AnimationStateData[newStateIndex].StateName as Var ; #DEBUG_LINE_NO:124
  Self.SendCustomEvent("defaultmultistateactivator_DefaultMultiStateActivator_StateChanged", argsEvent) ; #DEBUG_LINE_NO:125
EndFunction

String Function GetCurrentStateName()
  Guard SetAnimationStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:129
    Return AnimationStateData[CurrentStateIndex].StateName ; #DEBUG_LINE_NO:130
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
Auto State Initial

  Event OnLoad()
    Self.GoToState("Main") ; #DEBUG_LINE_NO:58
    If StartStateName == "" ; #DEBUG_LINE_NO:59
      Self.SetAnimationState(AnimationStateData[0].StateName, False) ; #DEBUG_LINE_NO:60
    Else ; #DEBUG_LINE_NO:
      Self.SetAnimationState(StartStateName, False) ; #DEBUG_LINE_NO:62
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State Main

  Event OnLoad()
    Guard SetAnimationStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:70
      Self.Private_SetAnimationStateIndex(CurrentStateIndex, True) ; #DEBUG_LINE_NO:71
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndEvent
EndState
