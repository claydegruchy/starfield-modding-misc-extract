ScriptName Fragments:Scenes:SF_MQ203A_250_DoctorMain_01000807 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ203A_260_DoctorIdle Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  MQ203A_260_DoctorIdle.Stop() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_End()
  MQ203A_260_DoctorIdle.Start() ; #DEBUG_LINE_NO:17
EndFunction
