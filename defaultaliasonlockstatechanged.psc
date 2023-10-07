ScriptName DefaultAliasOnLockStateChanged Extends DefaultAliasParent default
{ Sets stage if THIS Alias's lock state changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property CheckForUnlock = True Auto Const
  { If true (default), exceute this script if the lock state changes to Unlocked. If false, if the lock state changes to Locked. }
EndGroup


;-- Functions ---------------------------------------

Event OnLockStateChanged()
  If CheckForUnlock && Self.TryIsLocked() == False || CheckForUnlock == False && Self.TryIsLocked() ; #DEBUG_LINE_NO:14
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None) ; #DEBUG_LINE_NO:15
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent
