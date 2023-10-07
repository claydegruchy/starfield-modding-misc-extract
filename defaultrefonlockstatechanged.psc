ScriptName DefaultRefOnLockStateChanged Extends DefaultRefParent default
{ Sets stage if THIS object's lock state changes. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property CheckForUnlock = True Auto Const
  { If true (default), exceute this script if the lock state changes to Unlocked. If false, if the lock state changes to Locked. }
EndGroup


;-- Functions ---------------------------------------

Event OnLockStateChanged()
  If CheckForUnlock && Self.IsLocked() == False || CheckForUnlock == False && Self.IsLocked() ; #DEBUG_LINE_NO:13
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None) ; #DEBUG_LINE_NO:14
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent
