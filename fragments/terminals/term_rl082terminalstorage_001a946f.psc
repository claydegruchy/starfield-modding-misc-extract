ScriptName Fragments:Terminals:TERM_RL082TerminalStorage_001A946F Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RL082_EavesdroppingSceneTest Auto Const
ObjectReference Property AirlockDoor01 Auto Const
ObjectReference Property AirlockDoor02 Auto Const
ObjectReference Property HavokObject01 Auto Const
Cell Property RL082TAWarehouse Auto Const
Int Property currentElement Auto Const

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  AirlockDoor01.lock(True, False, True) ; #DEBUG_LINE_NO:7
  AirlockDoor01.SetLockLevel(253) ; #DEBUG_LINE_NO:8
  AirlockDoor02.unlock(False) ; #DEBUG_LINE_NO:9
  RL082TAWarehouse.setGravityScale(0.0) ; #DEBUG_LINE_NO:10
EndFunction
