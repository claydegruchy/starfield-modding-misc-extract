ScriptName Fragments:Scenes:SF_SQ_Doctors_BuySupplies_001895EA Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  sq_doctorsscript kmyQuest = Self.GetOwningQuest() as sq_doctorsscript ; #DEBUG_LINE_NO:7
  kmyQuest.BuySupplies() ; #DEBUG_LINE_NO:10
EndFunction
