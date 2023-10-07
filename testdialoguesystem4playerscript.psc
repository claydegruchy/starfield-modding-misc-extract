ScriptName TestDialogueSystem4PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property IntTestVar = 1 Auto

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If IntTestVar == 1 ; #DEBUG_LINE_NO:6
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  (Self.GetOwningQuest() as testdialoguesystem4script).TestMyFunction() ; #DEBUG_LINE_NO:9
EndEvent
