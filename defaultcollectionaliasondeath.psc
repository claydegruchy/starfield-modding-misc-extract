ScriptName DefaultCollectionAliasOnDeath Extends DefaultCollectionAlias default
{ Sets stage when THIS RefCollection's members are killed.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference killing each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property UseOnDyingInstead = False Auto Const
  { (Default: false) If true, stage will be set when OnDying() event is sent. If false, stage will be sent with OnDeath() event is sent. }
  Bool Property RemoveFromRefCollection = False Auto Const
  { (Default: false) If true, after executing script functionality, will remove each reference from the collection when it dies. }
  sq_playershipscript Property SQ_PlayerShip Auto Const
  { autofill (but optional) - used to register for player ship change event }
  Bool Property CountShipTakeover = True Auto Const
  { only valid if SQ_PlayerShip is filled in; for spaceships, consider the player taking over a ship as killing it }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  If SQ_PlayerShip as Bool && CountShipTakeover ; #DEBUG_LINE_NO:24
    Self.RegisterForCustomEvent(SQ_PlayerShip as ScriptObject, "sq_playershipscript_SQ_PlayerShipChanged") ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
  Parent.OnAliasInit() ; #DEBUG_LINE_NO:27
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  If UseOnDyingInstead == False ; #DEBUG_LINE_NO:31
    Self.DeathComplete(akSenderRef, akKiller) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
  If UseOnDyingInstead == True ; #DEBUG_LINE_NO:37
    Self.DeathComplete(akSenderRef, akKiller) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SQ_PlayerShipScript.SQ_PlayerShipChanged(sq_playershipscript akSender, Var[] akArgs)
  spaceshipreference newPlayerShip = akArgs[0] as spaceshipreference ; #DEBUG_LINE_NO:43
  If CountShipTakeover && Self.Find(newPlayerShip as ObjectReference) > -1 ; #DEBUG_LINE_NO:45
    Self.DeathComplete(newPlayerShip as ObjectReference, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DeathComplete(ObjectReference akSenderRef, ObjectReference akKiller)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akKiller, akSenderRef.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:54
  Self.CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams) ; #DEBUG_LINE_NO:56
EndFunction

Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
  If RemoveFromRefCollection ; #DEBUG_LINE_NO:60
    Self.RemoveRef(RefCollectionMemberRef) ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
EndFunction
