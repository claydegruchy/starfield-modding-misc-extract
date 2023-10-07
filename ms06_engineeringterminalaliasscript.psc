ScriptName MS06_EngineeringTerminalAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property MenuItemTarget Auto Const mandatory
{ REQUIRED: The ID of the terminal menu item. }
Int Property MenuItemTarget02 = -1 Auto Const
{ OPTIONAL: The ID of a second valid terminal menu item. }
terminalmenu Property TargetTerminal Auto Const mandatory
{ OPTIONAL: The specific terminal you want this to trigger on (used to check for subterminals). }
GlobalVariable Property RetrofitStatus Auto Const mandatory
{ REQUIRED: The Global Variable we need to assign a value to when the menu selection is made }

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, terminalmenu akTerminalBase, ObjectReference akTerminalRef)
  If (MenuItemTarget == auiMenuItemID || MenuItemTarget02 == auiMenuItemID) && TargetTerminal == akTerminalBase ; #DEBUG_LINE_NO:17
    Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:19
    ms06_questscript myQIScript = myQuest as ms06_questscript ; #DEBUG_LINE_NO:20
    RetrofitStatus.SetValue(1.0) ; #DEBUG_LINE_NO:21
    myQIScript.CheckEngineeringTerminalSettings() ; #DEBUG_LINE_NO:22
  Else ; #DEBUG_LINE_NO:
    RetrofitStatus.SetValue(0.0) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent
