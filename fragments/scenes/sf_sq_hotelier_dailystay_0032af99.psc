ScriptName Fragments:Scenes:SF_SQ_Hotelier_DailyStay_0032AF99 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  sq_hoteliersquestscript kmyQuest = Self.GetOwningQuest() as sq_hoteliersquestscript ; #DEBUG_LINE_NO:7
  kmyQuest.RentedRoomDaily() ; #DEBUG_LINE_NO:10
EndFunction
