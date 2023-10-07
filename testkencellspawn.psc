ScriptName TestKenCellSpawn Extends ObjectReference Const

;-- Functions ---------------------------------------

Function SpawnCell()
  Form ObjectBase = Game.GetForm(2741888) ; #DEBUG_LINE_NO:4
  Cell ObjectCell = ObjectBase as Cell ; #DEBUG_LINE_NO:5
  Float[] offsetValues = new Float[3] ; #DEBUG_LINE_NO:6
  offsetValues[0] = 0.0 ; #DEBUG_LINE_NO:7
  offsetValues[1] = 0.0 ; #DEBUG_LINE_NO:8
  offsetValues[2] = 0.0 ; #DEBUG_LINE_NO:9
  Cell newCell = Self.PlaceCellAtMe(ObjectCell, None, False, True, False, offsetValues) ; #DEBUG_LINE_NO:10
EndFunction
