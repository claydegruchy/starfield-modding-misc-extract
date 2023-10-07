ScriptName Fragments:Scenes:SF_UC07_HadrianVVRevealQuest_001F42E5 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC08 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest myOQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:7
  If myOQ.GetStageDone(140) && !myOQ.GetStageDone(145) && !UC08.GetStageDone(629) ; #DEBUG_LINE_NO:9
    myOQ.SetStage(200) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndFunction
