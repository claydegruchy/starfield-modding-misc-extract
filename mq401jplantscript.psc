ScriptName MQ401JPlantScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MQ401JPlantActivatePrompt Auto Const mandatory

;-- State -------------------------------------------
State HasbeenTriggered

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnLoad()
    Self.GotoState("HasbeenTriggered") ; #DEBUG_LINE_NO:7
    ObjectReference MyRef = Self.GetRef() ; #DEBUG_LINE_NO:8
    MyRef.SetActivateTextOverride(MQ401JPlantActivatePrompt) ; #DEBUG_LINE_NO:9
    MyRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:10
  EndEvent
EndState
