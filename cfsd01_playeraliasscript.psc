ScriptName CFSD01_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CFSD01 Auto Const mandatory
Location Property LC082VigilanceLocation Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akOldLoc == LC082VigilanceLocation ; #DEBUG_LINE_NO:7
    (CFSD01 as cfsd01_questscript).JailCheck() ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
