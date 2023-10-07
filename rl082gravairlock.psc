ScriptName RL082GravAirlock Extends TerminalMenu
{ Script to handle interaction with Zero G airlock in level RL083 }

;-- Variables ---------------------------------------
ObjectReference AirlockDoor01
ObjectReference AirlockDoor02
ObjectReference[] LinkedRefs

;-- Properties --------------------------------------
Cell Property RL082TAWarehouse01 Auto Const
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory
Int Property menuItemID_01 = 1 Auto Const
Int Property menuItemID_02 = 2 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.HandleMenuItem(auiMenuItemID) ; #DEBUG_LINE_NO:21
  LinkedRefs = akTerminalRef.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:22
  AirlockDoor01 = akTerminalRef.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:23
  AirlockDoor02 = akTerminalRef.GetLinkedRef(LinkCustom02) ; #DEBUG_LINE_NO:24
EndEvent

Function HandleMenuItem(Int auiMenuItemID)
  If auiMenuItemID == menuItemID_01 ; #DEBUG_LINE_NO:29
    Self.StartTimer(0.100000001, 10) ; #DEBUG_LINE_NO:30
  ElseIf auiMenuItemID == menuItemID_02 ; #DEBUG_LINE_NO:31
    Self.StartTimer(0.100000001, 20) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == 10 ; #DEBUG_LINE_NO:37
    AirlockDoor01.lock(True, False, True) ; #DEBUG_LINE_NO:38
    AirlockDoor01.SetLockLevel(253) ; #DEBUG_LINE_NO:39
    AirlockDoor02.unlock(False) ; #DEBUG_LINE_NO:40
    RL082TAWarehouse01.setGravityScale(0.0) ; #DEBUG_LINE_NO:41
    Int I = 0 ; #DEBUG_LINE_NO:43
    While I < LinkedRefs.Length ; #DEBUG_LINE_NO:44
      LinkedRefs[I].ApplyHavokImpulse(Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), Utility.RandomFloat(-1.0, 1.0), (LinkedRefs[I].GetMass() * Utility.RandomInt(1, 2) as Float) * 0.25) ; #DEBUG_LINE_NO:46
      I += 1 ; #DEBUG_LINE_NO:47
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf aiTimerID == 20 ; #DEBUG_LINE_NO:49
    AirlockDoor01.unlock(False) ; #DEBUG_LINE_NO:50
    AirlockDoor01.setopen(True) ; #DEBUG_LINE_NO:51
    AirlockDoor02.lock(True, False, True) ; #DEBUG_LINE_NO:52
    AirlockDoor02.SetLockLevel(253) ; #DEBUG_LINE_NO:53
    RL082TAWarehouse01.setGravityScale(1.0) ; #DEBUG_LINE_NO:54
  EndIf ; #DEBUG_LINE_NO:
EndEvent
