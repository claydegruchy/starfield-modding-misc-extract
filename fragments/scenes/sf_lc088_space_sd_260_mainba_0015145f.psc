ScriptName Fragments:Scenes:SF_LC088_Space_SD_260_MainBa_0015145F Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  lc088_spacequestscript kmyQuest = Self.GetOwningQuest() as lc088_spacequestscript ; #DEBUG_LINE_NO:7
  kmyQuest.SetStageNoWait(261) ; #DEBUG_LINE_NO:10
EndFunction
