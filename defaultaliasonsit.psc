ScriptName DefaultAliasOnSit Extends DefaultAlias
{ Set a stage when the actor in this alias sits in the specified furniture. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  ReferenceAlias Property SitTarget Auto Const
  { When an actor sits in/on the furniture in this alias, set the stage }
  Bool Property AllowDuringCombat = False Auto Const
  { Default=False. If true, do not set a stage if the sitting actor is in combat. }
  Message Property NotAllowedDuringCombat Auto Const mandatory
  { Message to display if AllowDuringCombat=False, and the player is the sitting actor, and they sit while in combat. }
EndGroup


;-- Functions ---------------------------------------

Event OnSit(ObjectReference akFurniture)
  If akFurniture == SitTarget.GetRef() ; #DEBUG_LINE_NO:16
    If AllowDuringCombat || !Self.GetActorRef().IsInCombat() ; #DEBUG_LINE_NO:17
      defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(Self.GetRef(), Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:19
      Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:21
    ElseIf Self.GetRef() == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:22
      NotAllowedDuringCombat.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
