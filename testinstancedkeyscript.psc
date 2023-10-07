ScriptName TestInstancedKeyScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Function AddKey()
  Game.GetPlayer().AddKeyIfNeeded(Self as ObjectReference) ; #DEBUG_LINE_NO:4
EndFunction
