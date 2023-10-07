ScriptName DebugStopAllScenesQuestScript Extends Quest Const default
{ Stops all current scenes for specified aliases }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias[] Property Aliases Auto Const mandatory

;-- Functions ---------------------------------------

Function StopAllScenes()
  Int I = 0 ; #DEBUG_LINE_NO:7
  While I < Aliases.Length ; #DEBUG_LINE_NO:8
    ObjectReference refToStopSceneFor = Aliases[I].GetReference() ; #DEBUG_LINE_NO:9
    If refToStopSceneFor ; #DEBUG_LINE_NO:10
      Scene sceneToStop = refToStopSceneFor.GetCurrentScene() ; #DEBUG_LINE_NO:11
      If sceneToStop ; #DEBUG_LINE_NO:12
        sceneToStop.Stop() ; #DEBUG_LINE_NO:14
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:17
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
