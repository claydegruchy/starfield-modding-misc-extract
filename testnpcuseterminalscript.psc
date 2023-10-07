ScriptName TestNPCUseTerminalScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Actor Property TestActor Auto Const
GlobalVariable Property TestNPCUseTerminalGlobal Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  TestNPCUseTerminalGlobal.SetValueInt(1) ; #DEBUG_LINE_NO:7
  TestActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:8
EndEvent
