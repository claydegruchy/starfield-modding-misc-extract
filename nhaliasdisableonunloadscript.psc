ScriptName NHAliasDisableOnUnloadScript Extends ReferenceAlias
{ Used when the NPCs leave the interior during the Establishing scene }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StagePrereq Auto Const mandatory

;-- Functions ---------------------------------------

Event OnUnload()
  If Self.GetOwningQuest().GetStageDone(StagePrereq) ; #DEBUG_LINE_NO:7
    Self.GetRef().Disable(False) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
