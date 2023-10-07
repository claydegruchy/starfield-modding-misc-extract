ScriptName DefaultAliasOnActivate Extends DefaultAlias default
{ Sets stage if a THIS Alias's reference is activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating THIS Alias's reference.
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property ShouldDisableAfterSuccessfulActivation = False Auto Const
  { (Default: false) If true, disable after being successfully activated }
  Bool Property ShouldHideActivationAfterSuccessfulActivation = False Auto Const
  { (Default: false) If true, hide activation (button prompt) after being successfully activated }
  Bool Property AllowDuringCombat = True Auto Const
  { Default=true. If true, do not set a stage if the activator is in combat. }
  Message Property NotAllowedDuringCombat Auto Const
  { Message to display if AllowDuringCombat=False, and the player is the activator, and they sit while in combat. }
EndGroup


;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor ActorREF = akActionRef as Actor ; #DEBUG_LINE_NO:22
  If AllowDuringCombat || (ActorREF as Bool && !ActorREF.IsInCombat()) ; #DEBUG_LINE_NO:24
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:27
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:29
  ElseIf (akActionRef == Game.GetPlayer() as ObjectReference) && NotAllowedDuringCombat != None ; #DEBUG_LINE_NO:30
    NotAllowedDuringCombat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If ShouldDisableAfterSuccessfulActivation ; #DEBUG_LINE_NO:40
    ObjectReference selfRef = Self.GetReference() ; #DEBUG_LINE_NO:41
    selfRef.Disable(False) ; #DEBUG_LINE_NO:43
  ElseIf ShouldHideActivationAfterSuccessfulActivation ; #DEBUG_LINE_NO:
    ObjectReference selfref = Self.GetReference() ; #DEBUG_LINE_NO:45
    selfref.BlockActivation(True, True) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
EndFunction
