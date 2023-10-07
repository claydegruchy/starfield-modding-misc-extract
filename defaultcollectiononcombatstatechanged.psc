ScriptName DefaultCollectionOnCombatStateChanged Extends DefaultCollectionAlias default
{ Sets stage when THIS RefCollection's members' combat state changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference THIS RefCollection's members are getting into combat with
<LocationToCheck> is the current location of each ref in THIS collection. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property IncludeOnHitEvent = True Auto Const
  { If true (default), exceute script functionality when THIS actor is hit in combat and <RefToCheck> will be the aggressor. }
  Int Property CombatStateToCheckFor = 4 Auto Const
  { 0: Not In Combat
1: In Combat
2: Searching
4 (Default): In Combat or Searching }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  If IncludeOnHitEvent ; #DEBUG_LINE_NO:20
    Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad(ObjectReference akSenderRef)
  If IncludeOnHitEvent ; #DEBUG_LINE_NO:26
    Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload(ObjectReference akSenderRef)
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:32
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Self.CombatStateChangedOrHit(akTarget, akAggressor) ; #DEBUG_LINE_NO:44
EndEvent

Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState > 0 && CombatStateToCheckFor == 4 || aeCombatState == CombatStateToCheckFor ; #DEBUG_LINE_NO:48
    Self.CombatStateChangedOrHit(akSenderRef, akTarget) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CombatStateChangedOrHit(ObjectReference akSenderRef, ObjectReference TargetOrAggressor)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:55
  If myQuest.GetStageDone(StageToSet) == False && (PrereqStage < 0 || myQuest.GetStageDone(PrereqStage)) && (TurnOffStage < 0 || myQuest.GetStageDone(TurnOffStage) == False) ; #DEBUG_LINE_NO:56
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(TargetOrAggressor, akSenderRef.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:57
    Self.CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams) ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State Done

  Event OnLoad(ObjectReference akSenderRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState
