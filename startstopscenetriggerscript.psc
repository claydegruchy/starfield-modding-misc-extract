ScriptName StartStopSceneTriggerScript Extends ObjectReference Const
{ A trigger which will start or stop a scene on actor enter or exit. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property sceneToStartOnEnter Auto Const
{ Okay to leave blank - we'll just skip it if so }
Scene Property sceneToStartOnExit Auto Const
{ Okay to leave blank - we'll just skip it if so }
Scene Property sceneToStopOnEnter Auto Const
{ Okay to leave blank - we'll just skip it if so }
Scene Property sceneToStopOnExit Auto Const
{ Okay to leave blank - we'll just skip it if so }
Quest Property questToCheck Auto Const
{ only used if a pre-req stage is specified. }
Int Property preRequisiteStage Auto Const
{ if specified, scenes will only be started/stopped if this stage is done }
Bool Property bDisableAfterEnter = True Auto Const
Bool Property bDisableAfterExit = True Auto Const

;-- Functions ---------------------------------------

Event OnTriggerLeave(ObjectReference akActionRef)
  If (akActionRef == Game.getPlayer() as ObjectReference) && (sceneToStopOnExit as Bool || sceneToStartOnExit as Bool) ; #DEBUG_LINE_NO:20
    Bool bDoWork = False ; #DEBUG_LINE_NO:21
    If preRequisiteStage ; #DEBUG_LINE_NO:22
      If questToCheck.getStageDone(preRequisiteStage) ; #DEBUG_LINE_NO:24
        bDoWork = True ; #DEBUG_LINE_NO:25
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      bDoWork = True ; #DEBUG_LINE_NO:29
    EndIf ; #DEBUG_LINE_NO:
    If bDoWork ; #DEBUG_LINE_NO:32
      If sceneToStopOnExit ; #DEBUG_LINE_NO:33
        sceneToStopOnExit.stop() ; #DEBUG_LINE_NO:34
      EndIf ; #DEBUG_LINE_NO:
      If sceneToStartOnExit ; #DEBUG_LINE_NO:36
        sceneToStartOnExit.start() ; #DEBUG_LINE_NO:37
      EndIf ; #DEBUG_LINE_NO:
      If bDisableAfterExit ; #DEBUG_LINE_NO:39
        Self.disable(False) ; #DEBUG_LINE_NO:40
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef == Game.getPlayer() as ObjectReference) && (sceneToStopOnEnter as Bool || sceneToStartOnEnter as Bool) ; #DEBUG_LINE_NO:47
    Bool bDoWork = False ; #DEBUG_LINE_NO:48
    If preRequisiteStage ; #DEBUG_LINE_NO:49
      If questToCheck.getStageDone(preRequisiteStage) ; #DEBUG_LINE_NO:51
        bDoWork = True ; #DEBUG_LINE_NO:52
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      bDoWork = True ; #DEBUG_LINE_NO:56
    EndIf ; #DEBUG_LINE_NO:
    If bDoWork ; #DEBUG_LINE_NO:59
      If sceneToStopOnEnter ; #DEBUG_LINE_NO:60
        sceneToStopOnEnter.stop() ; #DEBUG_LINE_NO:61
      EndIf ; #DEBUG_LINE_NO:
      If sceneToStartOnEnter ; #DEBUG_LINE_NO:63
        sceneToStartOnEnter.start() ; #DEBUG_LINE_NO:64
      EndIf ; #DEBUG_LINE_NO:
      If bDisableAfterEnter ; #DEBUG_LINE_NO:66
        Self.disable(False) ; #DEBUG_LINE_NO:67
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
