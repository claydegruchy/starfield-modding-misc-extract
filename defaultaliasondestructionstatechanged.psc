ScriptName DefaultAliasOnDestructionStateChanged Extends DefaultAliasParent default
{ Set stage when THIS Alias's destruction stage changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Int Property DestructionStateToCheckFor = 1 Auto Const
  { Set the stage when this destruction state is reached. }
EndGroup


;-- Functions ---------------------------------------

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  If aiCurrentStage <= DestructionStateToCheckFor ; #DEBUG_LINE_NO:14
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None) ; #DEBUG_LINE_NO:17
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent
