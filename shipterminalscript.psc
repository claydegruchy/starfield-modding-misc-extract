ScriptName ShipTerminalScript Extends ObjectReference

;-- Variables ---------------------------------------
Int MenuItemID_ReleaseDockingClamps = 1 Const

;-- Properties --------------------------------------
ActorValue Property SpaceshipDockingclamps Auto Const mandatory
{ docking clamps actor value - will be > 0 when a ship initiates docking with another ship }
terminalmenu Property DefaultShipTerminal Auto Const mandatory
{ top level ship terminal }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Self.CheckForDockingClamps() ; #DEBUG_LINE_NO:14
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, terminalmenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalBase == DefaultShipTerminal ; #DEBUG_LINE_NO:21
    If auiMenuItemID == MenuItemID_ReleaseDockingClamps ; #DEBUG_LINE_NO:22
      spaceshipreference myShip = Self.GetCurrentShipRef() ; #DEBUG_LINE_NO:23
      If myShip as Bool && myShip.GetValue(SpaceshipDockingclamps) > 0.0 ; #DEBUG_LINE_NO:24
        myShip.ModValueTo(SpaceshipDockingclamps, 0.0) ; #DEBUG_LINE_NO:25
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckForDockingClamps()
  spaceshipreference myShip = Self.GetCurrentShipRef() ; #DEBUG_LINE_NO:33
  Self.SetValue(SpaceshipDockingclamps, myShip.GetValue(SpaceshipDockingclamps)) ; #DEBUG_LINE_NO:34
EndFunction
