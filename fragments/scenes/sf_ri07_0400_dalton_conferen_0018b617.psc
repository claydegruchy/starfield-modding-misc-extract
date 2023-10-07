ScriptName Fragments:Scenes:SF_RI07_0400_Dalton_Conferen_0018B617 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  ri07_questscript kmyQuest = Self.GetOwningQuest() as ri07_questscript ; #DEBUG_LINE_NO:7
  kmyQuest.UnfreezeControlsMeeting() ; #DEBUG_LINE_NO:10
EndFunction
