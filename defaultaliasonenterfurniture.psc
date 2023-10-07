ScriptName DefaultAliasOnEnterFurniture Extends DefaultAlias
{ Set a stage when an actor sits in this furniture. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property AllowDuringCombat = False Auto Const
  { Default=False. If true, do not set a stage if the sitting actor is in combat. }
  Message Property NotAllowedDuringCombat Auto Const mandatory
  { Message to display if AllowDuringCombat=False, and the player is the sitting actor, and they sit while in combat. }
EndGroup


;-- Functions ---------------------------------------

Event OnEnterFurniture(Actor akActionRef)
  If AllowDuringCombat || !akActionRef.IsInCombat() ; #DEBUG_LINE_NO:13
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef as ObjectReference, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:15
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:17
  ElseIf akActionRef == Game.GetPlayer() ; #DEBUG_LINE_NO:18
    NotAllowedDuringCombat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent
