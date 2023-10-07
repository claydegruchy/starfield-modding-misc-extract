ScriptName Fragments:Scenes:SF_DialogueRedDevilsHQ_110_P_00182DC2 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:7
  If OQ.GetStageDone(405) || OQ.GetStageDone(410) || OQ.GetStageDone(415) ; #DEBUG_LINE_NO:8
    OQ.SetStage(400) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
