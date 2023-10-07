ScriptName Fragments:Scenes:SF_LC088_Space_SD_225_Batter_0008D561 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  lc088_spacequestscript kmyQuest = Self.GetOwningQuest() as lc088_spacequestscript ; #DEBUG_LINE_NO:7
  kmyQuest.SD_PlayBatteryPhaseCompleteScene(-1) ; #DEBUG_LINE_NO:10
EndFunction
