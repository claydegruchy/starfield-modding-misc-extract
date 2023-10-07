ScriptName LandyScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RAD05 Auto Const mandatory

;-- Functions ---------------------------------------

Function RestartRAD05()
  RAD05.Reset() ; #DEBUG_LINE_NO:7
  RAD05.Stop() ; #DEBUG_LINE_NO:8
  RAD05.Reset() ; #DEBUG_LINE_NO:9
  RAD05.Start() ; #DEBUG_LINE_NO:10
EndFunction
