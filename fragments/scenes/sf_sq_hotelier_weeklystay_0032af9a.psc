ScriptName Fragments:Scenes:SF_SQ_Hotelier_WeeklyStay_0032AF9A Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  sq_hoteliersquestscript kmyQuest = Self.GetOwningQuest() as sq_hoteliersquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.RentedRoomWeekly() ; #DEBUG_LINE_NO:10
EndFunction
