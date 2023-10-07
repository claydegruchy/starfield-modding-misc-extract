ScriptName SE_FAB04_MathCount Extends Quest
{ Calculate the total number of ship parts the player has for both ship and inventory }

;-- Variables ---------------------------------------
Int CargoShipParts
Int PlayerShipParts

;-- Properties --------------------------------------
GlobalVariable Property InventoryTotal Auto Const mandatory
Form Property ItemToRemove Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Int Property RequiredParts = 10 Auto

;-- Functions ---------------------------------------

Function CountShipParts()
  CargoShipParts = Alias_PlayerShip.GetRef().GetItemCount(ItemToRemove) ; #DEBUG_LINE_NO:16
  PlayerShipParts = Game.GetPlayer().GetItemCount(ItemToRemove) ; #DEBUG_LINE_NO:17
  Int TotalParts = CargoShipParts + PlayerShipParts ; #DEBUG_LINE_NO:18
  InventoryTotal.SetValue(TotalParts as Float) ; #DEBUG_LINE_NO:19
EndFunction

Function RemoveShipParts()
  spaceshipreference ShipRef = Alias_PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:23
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:24
  If CargoShipParts >= RequiredParts ; #DEBUG_LINE_NO:26
    ShipRef.RemoveItem(ItemToRemove, RequiredParts, False, None) ; #DEBUG_LINE_NO:27
  Else ; #DEBUG_LINE_NO:
    Int NumberOfPartsRemoved = ShipRef.RemoveItem(ItemToRemove, CargoShipParts, False, None) ; #DEBUG_LINE_NO:29
    Int RemainingPartRemoval = RequiredParts - NumberOfPartsRemoved ; #DEBUG_LINE_NO:30
    PlayerRef.RemoveItem(ItemToRemove, RemainingPartRemoval, False, None) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndFunction
