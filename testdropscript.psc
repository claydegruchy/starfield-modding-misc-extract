ScriptName TestDropScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Function TestDropFirstObject()
  ObjectReference theRef = Self.DropFirstObject(False) ; #DEBUG_LINE_NO:4
EndFunction
