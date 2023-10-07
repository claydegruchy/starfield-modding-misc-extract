ScriptName DefaultAliasOnBecomePlayerShip Extends DefaultAliasParent default
{ sets stage and removes factions from this alias's ship when it becomes the current player ship (i.e. player sits in the pilot seat)
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  { autofill - used to register for player ship change event }
  Faction[] Property FactionsToRemove Auto Const
  { factions to remove when this ship becomes the player ship }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForCustomEvent(SQ_PlayerShip as ScriptObject, "sq_playershipscript_SQ_PlayerShipChanged") ; #DEBUG_LINE_NO:16
EndEvent

Event SQ_PlayerShipScript.SQ_PlayerShipChanged(sq_playershipscript akSender, Var[] akArgs)
  spaceshipreference newPlayerShip = akArgs[0] as spaceshipreference ; #DEBUG_LINE_NO:20
  If newPlayerShip == Self.GetShipRef() ; #DEBUG_LINE_NO:22
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:26
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  Int I = 0 ; #DEBUG_LINE_NO:36
  While I < FactionsToRemove.Length ; #DEBUG_LINE_NO:37
    Self.TryToRemoveFromFaction(FactionsToRemove[I]) ; #DEBUG_LINE_NO:38
    I += 1 ; #DEBUG_LINE_NO:39
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
