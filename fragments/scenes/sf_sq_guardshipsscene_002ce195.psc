ScriptName Fragments:Scenes:SF_SQ_GuardShipsScene_002CE195 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_Begin()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.ShowContrabandScanWarning(True) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Phase_05_End()
  guardshipquestscript kmyQuest = Self.GetOwningQuest() as guardshipquestscript ; #DEBUG_LINE_NO:18
  kmyQuest.ScanForContraband() ; #DEBUG_LINE_NO:21
EndFunction
