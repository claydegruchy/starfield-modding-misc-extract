ScriptName Fragments:Scenes:SF_RI08_0910_Meeting_MasakoW_0017F7B0 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  ri08_questscript kmyQuest = Self.GetOwningQuest() as ri08_questscript ; #DEBUG_LINE_NO:7
  kmyQuest.UnfreezeControlsMeeting() ; #DEBUG_LINE_NO:10
EndFunction
