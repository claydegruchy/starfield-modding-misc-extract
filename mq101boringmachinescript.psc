ScriptName MQ101BoringMachineScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ101 Auto Const mandatory
Int Property iDrillStage = 33 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If MQ101.IsCompleted() || MQ101.GetStageDone(iDrillStage) ; #DEBUG_LINE_NO:8
    Self.PlayAnimation("Stage2NoTransition") ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
