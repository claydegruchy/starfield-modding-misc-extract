ScriptName Fragments:Scenes:SF_Gang03_0400_GangEncounter_00224FF9 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_Neon_Gang03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  If City_Neon_Gang03.GetStageDone(410) == False ; #DEBUG_LINE_NO:7
    City_Neon_Gang03.SetStage(430) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndFunction
