ScriptName Fragments:Scenes:SF_FFClinicR01Pointer_Starti_001C2BC0 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFClinicR01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  FFClinicR01.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Phase_05_End()
  FFClinicR01.Start() ; #DEBUG_LINE_NO:15
EndFunction
