ScriptName UC03_HadrianAliasScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.GetRef().IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:4
EndEvent
