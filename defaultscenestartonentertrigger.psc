ScriptName DefaultSceneStartOnEnterTrigger Extends DefaultRefOnTriggerEnter
{ Starts a scene when THIS reference's trigger is entered.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties collapsedonbase collapsedonref
{ Double-Click to EXPAND }
  Bool Property xxxPlaceHolderForEmptyGroup2xxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group Script_Specific_Properties
  Scene Property SceneToStart Auto Const mandatory
  { Scene that we want to start }
  Bool Property DisableAfterStartingScene = True Auto Const
  { If true (default), disable THIS object after the scene starts }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True ; #DEBUG_LINE_NO:21
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If SceneToStart.IsPlaying() == False ; #DEBUG_LINE_NO:27
    If SceneToStart.GetOwningQuest().IsRunning() ; #DEBUG_LINE_NO:28
      SceneToStart.Start() ; #DEBUG_LINE_NO:30
      If DisableAfterStartingScene ; #DEBUG_LINE_NO:32
        Self.Disable(False) ; #DEBUG_LINE_NO:34
      EndIf ; #DEBUG_LINE_NO:
      Parent.DoSpecificThing(ParentScriptFunctionParams, RefToDoThingWith, LastRefToDoThingWith) ; #DEBUG_LINE_NO:37
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
