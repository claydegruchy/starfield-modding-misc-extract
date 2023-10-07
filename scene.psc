ScriptName Scene Extends Form Native hidden

;-- Functions ---------------------------------------

Function ForceStart() Native

Quest Function GetOwningQuest() Native

Bool Function IsActionComplete(Int aiActionID) Native

Bool Function IsPlaying() Native

Event OnAction(Int auiActionID, ReferenceAlias akAlias)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnBegin()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnd()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPhaseBegin(Int auiPhaseIndex)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnPhaseEnd(Int auiPhaseIndex)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function Pause(Bool abPause) Native

Function Start() Native

Function Stop() Native
