ScriptName Fragments:Scenes:SF_DialogueEleosRetreat_TL_H_000D879E Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:7
  If OQ.GetStageDone(1350) || OQ.GetStageDone(1351) || OQ.GetStageDone(1352) || OQ.GetStageDone(1353) || OQ.GetStageDone(1354) ; #DEBUG_LINE_NO:9,10,11,12,13
    OQ.SetStage(1355) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndFunction
