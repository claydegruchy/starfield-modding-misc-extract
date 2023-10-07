ScriptName Fragments:Scenes:SF_BE_SC04_BargainingScene_01000801 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  If Self.GetOwningQuest().GetStage() != 30 ; #DEBUG_LINE_NO:10
    Self.GetOwningQuest().SetStage(50) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndFunction
