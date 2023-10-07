ScriptName RQ_SetStageOnExternalScene Extends Quest
{ typically for audio log scenes }

;-- Structs -----------------------------------------
Struct SceneStageDatum
  Scene ExternalScene
  Int StageToSetOnEnd
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
rq_setstageonexternalscene:scenestagedatum[] Property SceneStageData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Int I = 0 ; #DEBUG_LINE_NO:14
  While I < SceneStageData.Length ; #DEBUG_LINE_NO:15
    Scene currentScene = SceneStageData[I].ExternalScene ; #DEBUG_LINE_NO:16
    Self.RegisterForRemoteEvent(currentScene as ScriptObject, "OnEnd") ; #DEBUG_LINE_NO:18
    I += 1 ; #DEBUG_LINE_NO:19
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event Scene.OnEnd(Scene akSender)
  Int iFound = SceneStageData.findstruct("ExternalScene", akSender, 0) ; #DEBUG_LINE_NO:26
  rq_setstageonexternalscene:scenestagedatum foundSceneStageDatum = None ; #DEBUG_LINE_NO:27
  If iFound > -1 ; #DEBUG_LINE_NO:28
    foundSceneStageDatum = SceneStageData[iFound] ; #DEBUG_LINE_NO:29
    Self.SetStage(foundSceneStageDatum.StageToSetOnEnd) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:40
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:44
EndFunction
