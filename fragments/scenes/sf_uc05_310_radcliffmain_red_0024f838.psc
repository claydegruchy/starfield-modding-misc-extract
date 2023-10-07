ScriptName Fragments:Scenes:SF_UC05_310_RadcliffMain_Red_0024F838 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:7
  If OQ.GetStageDone(315) && !OQ.GetStageDone(349) ; #DEBUG_LINE_NO:9
    OQ.SetStage(317) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndFunction
