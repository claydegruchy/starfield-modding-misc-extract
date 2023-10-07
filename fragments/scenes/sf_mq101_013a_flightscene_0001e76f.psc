ScriptName Fragments:Scenes:SF_MQ101_013A_FlightScene_0001E76F Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  mq101script kmyQuest = Self.GetOwningQuest() as mq101script ; #DEBUG_LINE_NO:7
  If kmyQuest.GetStageDone(485) == False ; #DEBUG_LINE_NO:11
    kmyQuest.SetStage(405) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndFunction
