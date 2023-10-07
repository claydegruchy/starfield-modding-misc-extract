ScriptName Fragments:Scenes:SF_DialogueEleosRetreat_TL_S_0027898D Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:7
  If !OQ.GetStageDone(910) && (OQ.GetStageDone(905) || OQ.GetStageDone(906)) ; #DEBUG_LINE_NO:8
    OQ.SetStage(910) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
