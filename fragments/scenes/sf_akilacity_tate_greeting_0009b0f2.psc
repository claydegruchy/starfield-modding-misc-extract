ScriptName Fragments:Scenes:SF_AkilaCity_Tate_Greeting_0009B0F2 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_AkilaLife05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  If !City_AkilaLife05.IsCompleted() ; #DEBUG_LINE_NO:8
    City_AkilaLife05.SetStage(50) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_End()
  If !City_AkilaLife05.IsCompleted() ; #DEBUG_LINE_NO:19
    City_AkilaLife05.SetStage(50) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndFunction
