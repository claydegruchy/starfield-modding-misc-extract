ScriptName FCRQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FCRMissionCounter Auto Const mandatory
Quest Property FCR01 Auto Const mandatory

;-- Functions ---------------------------------------

Function FCRMissionComplete()
  FCRMissionCounter.Mod(1.0) ; #DEBUG_LINE_NO:8
  If FCRMissionCounter.GetValue() >= 3.0 && !FCR01.IsRunning() ; #DEBUG_LINE_NO:11
    FCR01.Start() ; #DEBUG_LINE_NO:12
    FCRMissionCounter.SetValue(0.0) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndFunction
