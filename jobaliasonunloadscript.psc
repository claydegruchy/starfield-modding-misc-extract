ScriptName JobAliasOnUnloadScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnUnload()
  If Self != None ; #DEBUG_LINE_NO:6
    Self.Clear() ; #DEBUG_LINE_NO:7
  EndIf ; #DEBUG_LINE_NO:
EndEvent
