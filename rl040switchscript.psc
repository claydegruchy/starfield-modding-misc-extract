ScriptName RL040SwitchScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property myEnableMarker Auto Const mandatory
ObjectReference Property PirateSceneTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Self.GetReference().BlockActivation(True, True) ; #DEBUG_LINE_NO:7
  PirateSceneTrigger.Disable(False) ; #DEBUG_LINE_NO:8
  myEnableMarker.Enable(False) ; #DEBUG_LINE_NO:9
  Self.GetOwningQuest().SetStage(30) ; #DEBUG_LINE_NO:10
EndEvent
