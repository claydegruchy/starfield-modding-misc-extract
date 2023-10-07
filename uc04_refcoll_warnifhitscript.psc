ScriptName UC04_RefColl_WarnIfHitScript Extends DefaultCollectionAliasOnHit

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property WeaponTypeEM Auto Const mandatory
{ Weapon type we're checking the player has equipped before triggering Hadrian's scene }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:7
EndEvent

Event OnLoad(ObjectReference akSenderRef)
  Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:11
EndEvent

Event OnUnload(ObjectReference akSenderRef)
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:15
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:25
  If (akAggressor == PlayACT as ObjectReference) && PlayACT.WornHasKeyword(WeaponTypeEM) ; #DEBUG_LINE_NO:26
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akAggressor, akTarget.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:28
    Self.CheckAndSetStageAndCallDoSpecificThing(akTarget, ParentScriptFunctionParams) ; #DEBUG_LINE_NO:30
    If DoOnce == False ; #DEBUG_LINE_NO:32
      Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:33
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

;-- State -------------------------------------------
State Done

  Event OnLoad(ObjectReference akSenderRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState
