ScriptName TestKenObjSpawn Extends ObjectReference Const

;-- Functions ---------------------------------------

Function SpawnObject()
  Form ObjectBase = Game.GetForm(1743617) ; #DEBUG_LINE_NO:4
  Float[] offsetValues = new Float[3] ; #DEBUG_LINE_NO:5
  offsetValues[0] = 100.0 ; #DEBUG_LINE_NO:6
  offsetValues[1] = 100.0 ; #DEBUG_LINE_NO:7
  offsetValues[2] = 0.0 ; #DEBUG_LINE_NO:8
  ObjectReference newObj = Self.PlaceAtMe(ObjectBase, 1, False, False, True, offsetValues, None, True) ; #DEBUG_LINE_NO:9
EndFunction
