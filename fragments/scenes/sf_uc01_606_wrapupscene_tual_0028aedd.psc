ScriptName Fragments:Scenes:SF_UC01_606_WrapupScene_Tual_0028AEDD Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:7
  If myQuest.GetStageDone(691) ; #DEBUG_LINE_NO:8
    myQuest.SetStage(692) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
