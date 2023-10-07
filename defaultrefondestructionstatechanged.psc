ScriptName DefaultRefOnDestructionStateChanged Extends DefaultRefParent default
{ Set stage when THIS object's destruction stage changes. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Int Property DestructionStateToCheckFor = 1 Auto Const
  { Set the stage when this destruction state is reached. }
EndGroup


;-- Functions ---------------------------------------

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  If aiCurrentStage <= DestructionStateToCheckFor ; #DEBUG_LINE_NO:13
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None) ; #DEBUG_LINE_NO:16
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent
