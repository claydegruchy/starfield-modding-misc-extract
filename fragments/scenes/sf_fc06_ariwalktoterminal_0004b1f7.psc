ScriptName Fragments:Scenes:SF_FC06_AriWalkToTerminal_0004B1F7 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FC06_AriSearchRecords Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  FC06_AriSearchRecords.Start() ; #DEBUG_LINE_NO:7
  Self.GetOwningQuest().SetStage(420) ; #DEBUG_LINE_NO:8
EndFunction
