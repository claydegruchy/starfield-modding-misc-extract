ScriptName RL040TriggerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property myEnableMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  myEnableMarker.Enable(False) ; #DEBUG_LINE_NO:6
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:7
  Self.GetOwningQuest().SetStage(20) ; #DEBUG_LINE_NO:8
EndEvent
