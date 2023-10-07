ScriptName MissionBoardCargoContainerScript Extends ObjectReference Const
{ holds data for the cargo this container represents }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property CargoMiscObject Auto Const
{ misc object to use to create cargo in inventory }
Int Property CargoWeightMultMin = 15 Auto Const
{ cargo items will be randomized between min and max }
Int Property CargoWeightMultMax = 200 Auto Const
{ cargo items will be randomized between min and max }

;-- Functions ---------------------------------------

Function CreateCargo(RefCollectionAlias CargoCollection, Int cargoItems)
  Int I = 0 ; #DEBUG_LINE_NO:15
  While I < cargoItems ; #DEBUG_LINE_NO:16
    ObjectReference cargoRef = Self.PlaceAtMe(CargoMiscObject as Form, 1, False, True, True, None, CargoCollection as Alias, True) ; #DEBUG_LINE_NO:17
    I += 1 ; #DEBUG_LINE_NO:18
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
