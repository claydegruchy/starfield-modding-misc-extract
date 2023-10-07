ScriptName DefaultAliasOnMenuItemRun Extends ReferenceAlias default
{ Default script to set stages and/or send story events when terminal menu items run. }

;-- Structs -----------------------------------------
Struct MenuItemDatum
  Int ItemID
  { REQUIRED: The ID of the terminal menu item. }
  terminalmenu TargetTerminalMenu
  { OPTIONAL: The specific terminal you want this to trigger on (used to check for subterminals). }
  Int StageToSet = -1
  { OPTIONAL: Stage to set when this menu item is run. }
  Int PrereqStage = -1
  { OPTIONAL: Stage that must be set before StageToSet will be set. }
  Int TurnOffStage = -1
  { OPTIONAL: If the current stage is equal or greater than TurnOffStage, do not set StageToSet.
	 NOTE: this stage does not actually have to be set - any quest stage equal or higher will turn off this script }
  Int TurnOffStageDone = -1
  { OPTIONAL: If this stage has been set, do not set StageToSet. }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  defaultaliasonmenuitemrun:menuitemdatum[] Property MenuItemData Auto Const mandatory
  { Array of stages to set when terminal menu items are run. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, terminalmenu akTerminalBase, ObjectReference akTerminalRef)
  DefaultAliasOnMenuItemRun.HandleMenuItem(Self as Alias, MenuItemData, auiMenuItemID, akTerminalBase, akTerminalRef, ShowTraces) ; #DEBUG_LINE_NO:38
EndEvent

Function HandleMenuItem(Alias callingAlias, defaultaliasonmenuitemrun:menuitemdatum[] MenuItemData, Int auiMenuItemID, terminalmenu akTerminalMenuBase, ObjectReference akTerminalRef, Bool ShouldShowTraces) Global
  defaultaliasonmenuitemrun:menuitemdatum[] matchingMenuItemData = MenuItemData.GetMatchingStructs("ItemID", auiMenuItemID, 0, -1) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs  ; #DEBUG_LINE_NO:43
  Int I = 0 ; #DEBUG_LINE_NO:45
  While I < matchingMenuItemData.Length ; #DEBUG_LINE_NO:46
    defaultaliasonmenuitemrun:menuitemdatum currentData = matchingMenuItemData[I] ; #DEBUG_LINE_NO:47
    If currentData.TargetTerminalMenu == None || (currentData.TargetTerminalMenu as Bool && currentData.TargetTerminalMenu == akTerminalMenuBase) ; #DEBUG_LINE_NO:49
      If currentData.StageToSet >= -1 ; #DEBUG_LINE_NO:50
        defaultscriptfunctions.TryToSetStage(callingAlias as ScriptObject, ShouldShowTraces, callingAlias.GetOwningQuest(), currentData.StageToSet, currentData.PrereqStage, currentData.TurnOffStage, currentData.TurnOffStageDone, None, False, None, None, None, None, None, None, None, False, None, False, None) ; #DEBUG_LINE_NO:51,54,55,56,57,58
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:79
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
