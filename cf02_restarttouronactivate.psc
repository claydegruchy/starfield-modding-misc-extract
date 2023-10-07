ScriptName CF02_RestartTourOnActivate Extends ReferenceAlias

;-- Structs -----------------------------------------
Struct TourScene
  Scene sceneToStart
  Int requiredStage
  Int turnOffStage
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
cf02_restarttouronactivate:tourscene[] Property TourScenes Auto Const mandatory
Int Property DoneStage Auto Const mandatory
{ Scene to change to done state }

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.goToState("Done") ; #DEBUG_LINE_NO:16
    Quest pQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:17
    If pQuest.GetStageDone(DoneStage) ; #DEBUG_LINE_NO:18
      Return  ; #DEBUG_LINE_NO:19
    ElseIf akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:20
      Int I = 0 ; #DEBUG_LINE_NO:21
      While I < TourScenes.Length ; #DEBUG_LINE_NO:22
        cf02_restarttouronactivate:tourscene TourSceneData = TourScenes[I] ; #DEBUG_LINE_NO:23
        If pQuest.GetStageDone(TourSceneData.requiredStage) && !pQuest.GetStageDone(TourSceneData.turnOffStage) && !TourSceneData.sceneToStart.IsPlaying() ; #DEBUG_LINE_NO:24
          TourSceneData.sceneToStart.Start() ; #DEBUG_LINE_NO:25
          Self.goToState("Waiting") ; #DEBUG_LINE_NO:26
          Return  ; #DEBUG_LINE_NO:27
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:29
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.goToState("Waiting") ; #DEBUG_LINE_NO:32
  EndEvent
EndState
