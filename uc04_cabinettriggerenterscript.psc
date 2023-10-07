ScriptName UC04_CabinetTriggerEnterScript Extends DefaultAliasOnTriggerEnter

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Message Property NotAllowedDuringCombat Auto Const mandatory
  { Message to throw if the player attempts to enter this trigger during combat }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True ; #DEBUG_LINE_NO:10
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If !Game.GetPlayer().IsInCombat() ; #DEBUG_LINE_NO:14
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:17
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:19
  Else ; #DEBUG_LINE_NO:
    NotAllowedDuringCombat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If DeleteWhenTriggeredSuccessfully as Bool && LastRefToDoThingWith ; #DEBUG_LINE_NO:28
    Self.TryToDelete() ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndFunction
