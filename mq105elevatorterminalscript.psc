ScriptName MQ105ElevatorTerminalScript Extends TerminalMenu

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property MQ105SlaytonElevatorID Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If auiMenuItemID == 1 ; #DEBUG_LINE_NO:6
    Game.GetPlayer().AddItem(MQ105SlaytonElevatorID as Form, 1, False) ; #DEBUG_LINE_NO:7
  EndIf ; #DEBUG_LINE_NO:
EndEvent
