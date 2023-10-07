ScriptName Fragments:Scenes:SF_FFClinicR02Pointer_Scene_001C2BB9 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFClinicR02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_02_Begin()
  FFClinicR02.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Phase_03_End()
  FFClinicR02.SetStage(10) ; #DEBUG_LINE_NO:15
EndFunction
